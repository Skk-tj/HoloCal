//
//  ManageGenerationOrderView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationOrderView: View {
    let agency: AgencyEnum
    
    @AppStorage("hololiveGenerationListOrder") var hololiveGenerationListOrder = agencyEnumToGenerations[AgencyEnum.hololive]!
    @AppStorage("nijisanjiGenerationListOrder") var nijisanjiGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nijisanji]!
    
    @State var showResetAlert = false
    
    var body: some View {
        List {
            Section(content: {
                switch agency {
                case .hololive:
                    ForEach(hololiveGenerationListOrder, id: \.self) { generation in
                        VStack(alignment: .leading) {
                            Text(generation.getLocalizedName())
                            Text(generation.getAltLocalizedName())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onMove(perform: moveHololive)
                case .nijisanji:
                    ForEach(nijisanjiGenerationListOrder, id: \.self) { generation in
                        VStack(alignment: .leading) {
                            Text(generation.getLocalizedName())
                            Text(generation.getAltLocalizedName())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onMove(perform: moveNijisanji)
                }
            }, footer: {
                Text("SETTINGS_MANAGE_GENERATION_ORDER_SECTION_FOOTER")
            })
            
            Section {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_GENERATION_ORDER_RESET")
                })
                .confirmationDialog("SETTINGS_MANAGE_GENERATION_ORDER_RESET_ALERT_TEXT", isPresented: $showResetAlert, actions: {
                    Button("SETTINGS_MANAGE_GENERATION_RESET_ALERT_RESET", role: .destructive) {
                        switch agency {
                        case .hololive:
                            hololiveGenerationListOrder = agencyEnumToGenerations[AgencyEnum.hololive]!
                        case .nijisanji:
                            nijisanjiGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nijisanji]!
                        }
                    }
                }, message: {
                    Text("SETTINGS_MANAGE_GENERATION_ORDER_RESET_ALERT_TEXT")
                })
            }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("SETTINGS_MANAGE_GENERATION_ORDER_VIEW_TITLE")
    }
    
    func moveHololive(from source: IndexSet, to destination: Int) {
        hololiveGenerationListOrder.move(fromOffsets: source, toOffset: destination)
    }
    
    func moveNijisanji(from source: IndexSet, to destination: Int) {
        nijisanjiGenerationListOrder.move(fromOffsets: source, toOffset: destination)
    }
}

struct ManageGenerationOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationOrderView(agency: .hololive)
        ManageGenerationOrderView(agency: .nijisanji)
    }
}
