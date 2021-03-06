//
//  ManageGenerationView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-03.
//

import SwiftUI

struct ManageGenerationView: View {
    @AppStorage("generationListSelection") var generationSelected = Set(GenerationEnum.allCases)
    @AppStorage("generationListOrder") var generationOrder = GenerationEnum.allCases
    @AppStorage("excludedGenerations") var excludedGenerations = Set<GenerationEnum>()
    @State var showResetAlert = false
    
    var body: some View {
        List(selection: $generationSelected) {
            ForEach(generationOrder, id: \.self) { generation in
                HStack {
                    VStack(alignment: .leading) {
                        if Locale.current.languageCode == "ja" {
                            Text("\(generationToName[generation]![.ja]!)")
                            Text("\(generationToName[generation]![.en]!)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        } else {
                            Text("\(generationToName[generation]![.en]!)")
                            Text("\(generationToName[generation]![.ja]!)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    if generationSelected.contains(generation) {
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            .onMove(perform: move)
            
            Section {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_GENERATION_RESET")
                })
                .confirmationDialog("SETTINGS_MANAGE_GENERATION_RESET_ALERT_TEXT", isPresented: $showResetAlert, actions: {
                    Button("SETTINGS_MANAGE_GENERATION_RESET_ALERT_RESET", role: .destructive) {
                        generationSelected = Set(GenerationEnum.allCases)
                        generationOrder = GenerationEnum.allCases
                    }
                }, message: {
                    Text("SETTINGS_MANAGE_GENERATION_RESET_ALERT_TEXT")
                })
            }
        }
        .onChange(of: generationSelected, perform: { newValue in
            excludedGenerations =  Set(GenerationEnum.allCases).symmetricDifference(newValue)
        })
        .navigationTitle("SETTINGS_MANAGE_GENERATION_VIEW_TITLE")
        .toolbar {
            EditButton()
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        generationOrder.move(fromOffsets: source, toOffset: destination)
    }
}

struct ManageGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationView()
    }
}
