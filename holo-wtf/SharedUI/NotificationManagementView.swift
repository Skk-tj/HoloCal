//
//  NotificationManagementView.swift
//  holo-wtf
//
//
//

import SwiftUI
import OrderedCollections
import UserNotifications

struct NotificationManagementView: View {
    @AppStorage(UserDefaultKeys.notifications) var scheduledNotifications: Data = (try? JSONEncoder().encode(LiveVideoToNotification())) ?? Data()
    @State var showReset: Bool = false
    
    var body: some View {
        if let schedules = try? JSONDecoder().decode(LiveVideoToNotification.self, from: scheduledNotifications) {
            let ordered = OrderedDictionary(uniqueKeys: schedules.keys, values: schedules.values)
            let filtered = ordered.filter { $0.value.finalNotificationTime > Date() }
            let sorted = filtered.sorted { $0.value.finalNotificationTime < $1.value.finalNotificationTime }
            
            List {
                if sorted.isEmpty {
                    Section {
                        Text("SETTINGS_NOTIFICATION_NO_NOTIFICATION_SCHEDULED")
                            .foregroundColor(.secondary)
                    }
                    
                } else {
                    Section {
                        ForEach(sorted, id: \.self.key.id) { key, value in
                            VStack(alignment: .leading) {
                                Text(key.title)
                                Text(key.channel.getTalentName())
                                    .foregroundColor(.secondary)
                                Text(value.minutesBefore.getManagementDescription())
                                    .foregroundColor(.secondary)
                                Text("SETTINGS_NOTIFICATION_WILL_BE_DELIVERED_AT \(value.finalNotificationTime.formatted())")
                                    .foregroundColor(.secondary)
                            }
                            .swipeActions {
                                Button("SETTINGS_NOTIFICATION_CANCEL_NOTIFICATION", role: .destructive) {
                                    cancelNotification(video: key)
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Button("SETTINGS_NOTIFICATION_CANCEL_ALL_NOTIFICATIONS", role: .destructive) {
                        showReset = true
                    }
                    .confirmationDialog("SETTINGS_NOTIFICATION_CANCEL_ALL_NOTIFICATIONS", isPresented: $showReset, actions: {
                        Button("SETTINGS_NOTIFICATION_CANCEL_ALL_NOTIFICATIONS", role: .destructive) {
                            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                            scheduledNotifications = (try? JSONEncoder().encode(LiveVideoToNotification())) ?? Data()
                        }
                    })
                }
            }
            .navigationTitle("SETTINGS_MANAGE_NOTIFICATION")
        } else {
            List {
                Text("Error")
                Button("Reset notification") {
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    scheduledNotifications = (try? JSONEncoder().encode(LiveVideoToNotification())) ?? Data()
                }
            }
            .navigationTitle("SETTINGS_MANAGE_NOTIFICATION")
        }
    }
}

struct NotificationManagementView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationManagementView()
    }
}
