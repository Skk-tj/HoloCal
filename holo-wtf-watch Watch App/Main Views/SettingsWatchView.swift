//
//  SettingsWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct SettingsWatchView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var hoursLookAhead: Int = 48
    @AppStorage(UserDefaultKeys.pastLimit) var pastLimit: PastLimit = .limit25
    
    var body: some View {
        Form {
            Section(header: Text("SETTINGS_UPCOMING_SCHEDULE_SECTION_HEADER")) {
                Picker("SETTINGS_UPCOMING_SCHEDULE_HOURS_TEXT", selection: $hoursLookAhead) {
                    ForEach([12, 24, 48, 72, 96, 120], id: \.self) {
                        Text("WATCH_SETTINGS_UPCOMING_SCHEDULE_PICKER_TEXT \($0)")
                    }
                }
                .onChange(of: hoursLookAhead, perform: { newHours in
                    UserDefaults.standard.set(newHours, forKey: UserDefaultKeys.upcomingLookAhead)
                })
            }
            
            Section(header: Text("SETTINGS_PAST_VIDEOS_SECTION_HEADER")) {
                Picker("SETTINGS_PAST_LIMIT", selection: $pastLimit) {
                    ForEach(PastLimit.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
            }
            
            Section(header: Text("SETTINGS_ABOUT_SECTION_HEADER"), footer: Text("HoloCal \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) \nCodename: \(Bundle.main.codeName)")) {
                NavigationLink(destination: SpecialThanksView(), label: {
                    Text("SETTINGS_SPECIAL_THANKS")
                })
                
                NavigationLink(destination: OpenSourceView()) {
                    Text("SETTINGS_OPEN_SOURCE")
                }
            }
        }
        .navigationTitle("SETTINGS_TITLE")
    }
}

struct SettingsWatchView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsWatchView()
    }
}
