//
//  PaneViewButtonRowView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-22.
//

import SwiftUI
import EventKit

struct PaneViewButtonRowView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var isAddToCalendarSheetPresented: Bool = false
    @State var isCalendarAccessAlertPresented: Bool = false
    @State var isShowingSheet: Bool = false
    
    let video: LiveVideo
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        ControlGroup {
            if #available(iOS 16.0, *) {
                ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: {
                    Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
                        .labelStyle(.iconOnly)
                        .hoverEffect()
                })
                .buttonStyle(.borderless)
            } else {
                ShareButton(video: video) {
                    Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
                        .labelStyle(.iconOnly)
                        .hoverEffect()
                }
            }
            
            Spacer()
            
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
            
            Spacer()
            
            FavouriteButton(video: video) {
                let isFavourited = favourited.contains(where: {$0 == video.channel.id})
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
                    if #available(iOS 16.0, *) {
                        SongListStackView(videoURL: video.url!, songsRaw: songs)
                            .presentationDetents([.medium, .large])
                    } else {
                        SongListView(videoURL: video.url!, songsRaw: songs)
                    }
                }
            }
        }
        .controlGroupStyle(.navigation)
    }
}

struct PaneViewButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PaneViewButtonRowView(video: LiveVideo.previewLive)
    }
}
