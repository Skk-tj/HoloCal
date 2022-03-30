//
//  SettingsView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-21.
//

import SwiftUI

struct SettingsView: View {
    @State var hoursLookAhead: Int = getUpcomingStreamLookAheadHoursFromUserDefaults()
    
    var body: some View {
        NavigationView {
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
                        let defaults = UserDefaults.standard
                        defaults.set(newHours, forKey: "upcomingLookAhead")
                    })
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
