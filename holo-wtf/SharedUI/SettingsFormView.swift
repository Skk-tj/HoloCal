//
//  SettingsFormView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsFormView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var hoursLookAhead: Int = 48
    @AppStorage(UserDefaultKeys.pastLimit) var pastLimit: PastLimit = .limit25
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    @AppStorage(UserDefaultKeys.searchSuggestionLanguage) var searchSuggestionLanguage: NameLanguage = Locale.current.language.languageCode?.identifier == "en" ? .en : .ja
    @AppStorage(UserDefaultKeys.holodexApiKey) var holodexApiKey: String = ""
    
    var body: some View {
        Form {
            Section(content: {
                SecureField("Holodex API Key", text: $holodexApiKey)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }, footer: {
                Text("An API key from Holodex is required for this app. [Login to Holodex to get an API key](https://holodex.net/login)")
            })
            
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
            
            Section(header: Text("SETTINGS_PAST_VIDEOS_SECTION_HEADER")) {
                Picker("SETTINGS_PAST_LIMIT", selection: $pastLimit) {
                    ForEach(PastLimit.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
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
            
            Section(content: {
                Picker("SETTINGS_SEARCH_SUGGESTION_LANGUAGE", selection: $searchSuggestionLanguage) {
                    Text(Locale.current.localizedString(forIdentifier: "en") ?? "").tag(NameLanguage.en)
                    Text(Locale.current.localizedString(forIdentifier: "ja") ?? "").tag(NameLanguage.ja)
                }
            }, header: {
                Text("SETTINGS_SEARCHING_HEADER")
            })
            
            Section("SETTINGS_CHANNEL_MANAGEMENT_HEADER") {
                NavigationLink(destination: ManageFavoriteAgencySelectionView()) {
                    Text("SETTINGS_MANAGE_FAVOURITE")
                }
                
                NavigationLink(destination: ManageGenerationVisibilityView()) {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY")
                }
                
                NavigationLink(destination: ManageGenerationOrderAgencySelectionView()) {
                    Text("SETTINGS_MANAGE_GENERATION_ORDER")
                }
            }
            
            Section("SETTINGS_NOTIFICATION") {
                NavigationLink(destination: NotificationManagementView()) {
                    Text("SETTINGS_MANAGE_NOTIFICATION")
                }
            }
            
            Section(header: Text("SETTINGS_ABOUT_SECTION_HEADER"), footer: Text("HoloCal \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) \nCodename: \(Bundle.main.codeName)")) {
                Link("SETTINGS_ABOUT_BUG_REPORT", destination: URL(string: "https://github.com/Skk-tj/HoloCal/issues")!)
                
                Link(destination: URL(string: "https://me.skk-tj.live/holocal-support")!, label: {
                    Text("SETTINGS_SUPPORT_PAGE")
                })
                
                NavigationLink("SETTINGS_SPECIAL_THANKS") {
                    SpecialThanksView()
                }
                               
                NavigationLink("SETTINGS_OPEN_SOURCE") {
                    OpenSourceView()
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
