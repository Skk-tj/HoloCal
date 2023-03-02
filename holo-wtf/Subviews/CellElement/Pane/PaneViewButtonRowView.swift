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
    
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    @State var isAddToCalendarSheetPresented: Bool = false
    @State var isCalendarAccessAlertPresented: Bool = false
    @State var isShowingSheet: Bool = false
    
    let video: LiveVideo
    let showCalendar: Bool
    
    var body: some View {
        ControlGroup {
            ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: {
                Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
                    .labelStyle(.iconOnly)
                    .hoverEffect()
            })
            .buttonStyle(.borderless)
            
            Spacer()
            
            if showCalendar {
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
                }) {
                    Label("VIDEO_CONTEXT_MENU_ADD_TO_CALENDAR", systemImage: "calendar.badge.plus")
                        .labelStyle(.iconOnly)
                }
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
                .hoverEffect()
            }
            
            Spacer()
            
            let isFavourited = favourited.contains(where: {$0 == video.channel.id})
            FavouriteButton(video: video) {
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
