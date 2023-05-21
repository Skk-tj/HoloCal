//
//  PaneViewButtonRowView.swift
//  holo-wtf
//
//
//

import SwiftUI
import EventKit

struct PaneViewButtonRowView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var isAddToCalendarSheetPresented = false
    @State var isCalendarAccessAlertPresented = false
    @State var isShowingSheet = false
    @State var isNotificationAccessAlertPresented = false
    @State var isNotificationScheduleErrorPresented = false
    
    @AppStorage(UserDefaultKeys.notifications) var scheduledNotifications: Data = (try? JSONEncoder().encode(LiveVideoToNotification())) ?? Data()
    
    let video: LiveVideo
    let showCalendar: Bool
    
    var body: some View {
        let selectedNotificationBinding: Binding<NotificationMinutesBefore?> = Binding(get: {
            let isScheduled = isNotificationScheduledFor(storage: scheduledNotifications, thisVideo: video)
            switch isScheduled {
            case .yes(let result):
                return result.minutesBefore
            case .no:
                return nil
            }
        }, set: { value in
            if let value {
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound]) { _, error in
                    if error != nil {
                        self.isNotificationAccessAlertPresented = true
                    }
                    do {
                        try scheduledNotification(storage: scheduledNotifications, video: video, minutesBefore: value)
                    } catch {
                        self.isNotificationScheduleErrorPresented = true
                    }
                }
            }
        })
        
        ControlGroup {
            ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: {
                Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
                    .labelStyle(.iconOnly)
                    .hoverEffect()
            })
            .buttonStyle(.borderless)
            
            Spacer()
            
            if showCalendar {
                Menu(content: {
                    Picker(selection: selectedNotificationBinding, label: Text("Select notification")) {
                        ForEach(NotificationMinutesBefore.allCases, id: \.self) { minute in
                            Text("\(minute.toActualNumber()) minutes before").tag(Optional(minute))
                        }
                    }
                    
                    if selectedNotificationBinding.wrappedValue != nil {
                        Button(role: .destructive, action: {
                            cancelNotification(video: video)
                        }, label: {
                            Label("Cancel Notification", systemImage: "bell.slash")
                        })
                    }
                    
                    #if DEBUG
                    Button("Test notification") {
                        let center = UNUserNotificationCenter.current()
                        center.requestAuthorization(options: [.alert, .sound]) { _, error in
                            if error != nil {
                                self.isNotificationAccessAlertPresented = true
                            }
                            do {
                                try addVideoToNotificationCenterTest(video: video)
                            } catch {
                                self.isNotificationScheduleErrorPresented = true
                            }
                        }
                    }
                    #endif

                    Section {
                        Button(action: {
                            let eventStore: EKEventStore = EKEventStore()
                            eventStore.requestAccess(to: .event) { (granted, error) in
                                if (granted) && (error == nil) {
                                    DispatchQueue.main.async {
                                        self.isAddToCalendarSheetPresented = true
                                    }
                                } else {
                                    self.isCalendarAccessAlertPresented = true
                                }
                            }
                        }, label: {
                            Label("VIDEO_CONTEXT_MENU_ADD_TO_CALENDAR", systemImage: "calendar.badge.plus")
                        })
                    }
                    
                }, label: {
                    Label("", systemImage: selectedNotificationBinding.wrappedValue != nil ? "bell.badge" : "bell")
                        .labelStyle(.iconOnly)
                })
                .buttonStyle(.borderless)
                .sheet(isPresented: $isAddToCalendarSheetPresented) {
                    let eventStore: EKEventStore = EKEventStore()
                    EventEditView(eventStore: eventStore, event: getCalendarEventFromVideo(eventStore: eventStore, video: video))
                }
                .alert("CALENDAR_ACCESS_TITLE", isPresented: $isCalendarAccessAlertPresented, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text("CALENDAR_ACCESS_MESSAGE")
                })
                .alert("NOTIFICATION_ACCESS_TITLE", isPresented: $isNotificationAccessAlertPresented, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text("NOTIFICATION_ACCESS_MESSAGE")
                })
                .alert("NOTIFICATION_ERROR_TITLE", isPresented: $isNotificationScheduleErrorPresented, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text("NOTIFICATION_ERROR_MESSAGE")
                })
                .hoverEffect()
                
                Spacer()
            }
            
            FavouriteButton(video: video) { isFavourited in
                Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.borderless)
            .hoverEffect()
            
            if let songs = video.songs {
                Spacer()
                
                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    Image(systemName: "music.note.list")
                })
                .sheet(isPresented: $isShowingSheet) {
                    SongListStackView(videoURL: video.url!, songsRaw: songs)
                        .presentationDetents([.medium, .large])
                }
            }
        }
        .controlGroupStyle(.navigation)
    }
}

struct PaneViewButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PaneViewButtonRowView(video: LiveVideo.previewLive, showCalendar: true)
        PaneViewButtonRowView(video: LiveVideo.previewLive, showCalendar: false)
    }
}
