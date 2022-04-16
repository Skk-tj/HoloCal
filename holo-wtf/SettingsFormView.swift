//
//  SettingsFormView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsFormView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var hoursLookAhead: Int = 48
    
    var body: some View {
        Form {
            Section(header: Text("SETTINGS_UPCOMING_SCHEDULE_SECTION_HEADER")) {
                
                Text("SETTINGS_UPCOMING_SCHEDULE_HOURS_TEXT \(hoursLookAhead)")
                
                Picker("Upcoming look ahead", selection: $hoursLookAhead) {
                    ForEach([12, 24, 48, 72, 96, 120], id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.wheel)
                .onChange(of: hoursLookAhead, perform: { newHours in
                    UserDefaults.standard.set(newHours, forKey: UserDefaultKeys.upcomingLookAhead)
                })
            }
            
            Section("SETTINGS_CHANNEL_MANAGEMENT_HEADER") {
                NavigationLink(destination: ManageFavoriteView()) {
                    Text("SETTINGS_MANAGE_FAVOURITE")
                }
            }
            
            Section(header: Text("SETTINGS_ABOUT_SECTION_HEADER")) {
                Link(destination: URL(string: "https://github.com/Skk-tj/HoloCal/issues")!) {
                    Text("SETTINGS_ABOUT_BUG_REPORT")
                }
                
                NavigationLink(destination: OpenSourceView()) {
                    Text("SETTINGS_OPEN_SOURCE")
                }
            }
        }
        .navigationTitle("SETTINGS_TITLE")
    }
}

struct SettingsFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFormView()
    }
}