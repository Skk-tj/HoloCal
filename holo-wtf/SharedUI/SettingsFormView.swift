//
//  SettingsFormView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsFormView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var hoursLookAhead: Int = 48
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    
    var body: some View {
        Form {
            Section(header: Text("SETTINGS_UPCOMING_SCHEDULE_SECTION_HEADER")) {
                Picker("SETTINGS_UPCOMING_SCHEDULE_HOURS_TEXT", selection: $hoursLookAhead) {
                    ForEach([12, 24, 48, 72, 96, 120], id: \.self) {
                        Text("WATCH_SETTINGS_UPCOMING_SCHEDULE_PICKER_TEXT \($0)")
                    }
                }
                .onChange(of: hoursLookAhead, perform: { newHours in
                    hoursLookAhead = newHours
                })
            }
            
            Section(header: Text("SETTINGS_STREAM_TIME_HEADER"), footer: Text("SETTINGS_STREAM_TIME_FOOTER")) {
                Picker("SETTINGS_DST_CHANGE_TEXT", selection: $dstDays) {
                    ForEach(1...10, id: \.self) {
                        Text("SETTINGS_DST_CHANGE_PICKER_TEXT \($0)")
                    }
                }
                .onChange(of: dstDays, perform: { newDays in
                    dstDays = newDays
                })
            }
            
            Section("SETTINGS_CHANNEL_MANAGEMENT_HEADER") {
                NavigationLink(destination: ManageFavoriteAgencySelectionView()) {
                    Text("SETTINGS_MANAGE_FAVOURITE")
                }
                
                NavigationLink(destination: ManageGenerationVisibilityView()) {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY")
                }
                
                NavigationLink(destination: ManageGenerationOrderAgencySelectionView(), label: {
                    Text("SETTINGS_MANAGE_GENERATION_ORDER")
                })
            }
            
            Section(header: Text("SETTINGS_ABOUT_SECTION_HEADER"), footer: Text("HoloCal \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) \nCodename: \(Bundle.main.codeName)")) {
                Link(destination: URL(string: "https://github.com/Skk-tj/HoloCal/issues")!) {
                    Text("SETTINGS_ABOUT_BUG_REPORT")
                }
                
                Link(destination: URL(string: "https://testflight.apple.com/join/uxxMYkU3")!) {
                    Text("SETTINGS_BETA_TESTING")
                }
                
                Link(destination: URL(string: "https://crowdin.com/project/holocal/invite?d=p6a556u4l6f5339323b363c5b3o4a3p4a323")!, label: {
                    Text("SETTINGS_HELP_TRANSLATE")
                })
                
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

struct SettingsFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFormView()
    }
}
