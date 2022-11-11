//
//  ManageGenerationOrderView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-14.
//

import SwiftUI

struct ManageGenerationOrderView: View {
    @AppStorage("generationListOrder") var generationOrder = Generation.allCases
    @State var showResetAlert = false
    
    var body: some View {
        List {
            Section(content: {
                ForEach(generationOrder, id: \.self) { generation in
                    VStack(alignment: .leading) {
                        Text("\(generation.getLocalizedName())")
                        Text("\(generation.getAltLocalizedName())")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onMove(perform: move)
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
                        generationOrder = Generation.allCases
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
    
    func move(from source: IndexSet, to destination: Int) {
        generationOrder.move(fromOffsets: source, toOffset: destination)
    }
}

struct ManageGenerationOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationOrderView()
    }
}
