//
//  ManageGenerationOrderView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationOrderView: View {
    let agency: AgencyEnum
    
    @AppStorage("generationListOrderNew") var generateListOrder: Data = (try? JSONEncoder().encode(agencyEnumToGenerations)) ?? Data()
    
    @State var showResetAlert = false
    
    var body: some View {
        List {
            Section(content: {
                ForEach(getGenerationOrderList(from: generateListOrder, agency: agency), id: \.self) { generation in
                    MultiLanguageNameView(entity: generation.getGeneration())
                }
                .onMove { source, destination in
                    moveGenerationOrderList(from: generateListOrder, agency: agency, source: source, to: destination)
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
                        overwriteNewGenerationOrderList(to: generateListOrder, order: agencyEnumToGenerations[agency]!, agency: agency)
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
    
    func moveGenerationOrderList(@AppStorage("generationListOrderNew") from: Data, agency: AgencyEnum, source: IndexSet, to: Int) {
        var gottenGenerationListOrder = getGenerationOrderList(from: from, agency: agency)
        gottenGenerationListOrder.move(fromOffsets: source, toOffset: to)
        overwriteNewGenerationOrderList(to: generateListOrder, order: gottenGenerationListOrder, agency: agency)
    }
}

struct ManageGenerationOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationOrderView(agency: .hololive)
        ManageGenerationOrderView(agency: .nijisanji)
    }
}
