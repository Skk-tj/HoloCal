//
//  ManageGenerationView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationView: View {
    @AppStorage("generationListSelection") var generationList = Set(GenerationEnum.allCases)
    @AppStorage("generationListOrder") var allGenerations = GenerationEnum.allCases
    @State var showResetAlert = false
    
    var body: some View {
        List(selection: $generationList) {
            ForEach(allGenerations, id: \.self) { generation in
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
                    if generationList.contains(generation) {
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
                        generationList = Set(GenerationEnum.allCases)
                        allGenerations = GenerationEnum.allCases
                    }
                }, message: {
                    Text("SETTINGS_MANAGE_GENERATION_RESET_ALERT_TEXT")
                })
            }
        }
        .navigationTitle("SETTINGS_MANAGE_GENERATION_VIEW_TITLE")
        .toolbar {
            EditButton()
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        allGenerations.move(fromOffsets: source, toOffset: destination)
    }
}

struct ManageGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationView()
    }
}
