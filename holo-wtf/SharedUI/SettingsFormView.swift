//
//  SettingsFormView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-06.
//

import SwiftUI

struct SettingsFormView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var hoursLookAhead: Int = 48
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    
    // Upcoming picker hiding/showing management states
    @State var showUpcomingPicker = false
    @State var upcomingChevronRotationAngle: Double = 0
    
    // DST change picker hiding/showing management states
    @State var showDSTPicker = false
    @State var dstChevronRotationAngle: Double = 0
    
    var body: some View {
        Form {
            Section(header: Text("SETTINGS_UPCOMING_SCHEDULE_SECTION_HEADER")) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        showUpcomingPicker.toggle()
                        if showUpcomingPicker {
                            upcomingChevronRotationAngle += 90
                        } else {
                            upcomingChevronRotationAngle -= 90
                        }
                    }
                }, label: {
                    HStack {
                        Text("SETTINGS_UPCOMING_SCHEDULE_HOURS_TEXT \(hoursLookAhead)")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .rotationEffect(Angle(degrees: upcomingChevronRotationAngle))
                    }
                })
                
                if showUpcomingPicker {
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
            }
            
            Section(header: Text("SETTINGS_STREAM_TIME_HEADER"), footer: Text("SETTINGS_STREAM_TIME_FOOTER")) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        showDSTPicker.toggle()
                        if showDSTPicker {
                            dstChevronRotationAngle += 90
                        } else {
                            dstChevronRotationAngle -= 90
                        }
                    }
                }, label: {
                    HStack {
                        Text("SETTINGS_DST_CHANGE_TEXT \(dstDays)")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .rotationEffect(Angle(degrees: dstChevronRotationAngle))
                    }
                })
                if showDSTPicker {
                    Picker("DST change", selection: $dstDays) {
                        ForEach(1...10, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: dstDays, perform: { newHours in
                        UserDefaults.standard.set(newHours, forKey: UserDefaultKeys.dstDays)
                    })
                }
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
                
                Link(destination: URL(string: "https://twitter.com/skk_tj")!) {
                    Text("SETTINGS_TWITTER")
                }
                
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
