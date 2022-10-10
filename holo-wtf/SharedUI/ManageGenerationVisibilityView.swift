//
//  ManageGenerationSelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationVisibilityView: View {
    @AppStorage("generationListSelection") var generationSelected = Set(hololiveGenerations.allCases)
    @AppStorage("excludedGenerations") var excludedGenerations = Set<hololiveGenerations>()
    @State var showResetAlert = false
    
    var body: some View {
        List {
            Section(content: {
                ForEach(hololiveGenerations.allCases, id: \.self) { generation in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(generation.getLocalizedName())")
                            Text("\(generation.getAltLocalizedName())")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        Button(action: {
                            if !generationSelected.contains(generation) {
                                generationSelected.insert(generation)
                            } else {
                                generationSelected.remove(generation)
                            }
                        }) {
                            Label("Show", systemImage: generationSelected.contains(generation) ? "star.fill" : "star")
                                .labelStyle(.iconOnly)
                        }
                    }
                }
            }, footer: {
                Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_SECTION_FOOTER")
            })
            
            Section {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET")
                })
                .confirmationDialog("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET_ALERT_TEXT", isPresented: $showResetAlert, actions: {
                    Button("SETTINGS_MANAGE_GENERATION_RESET_ALERT_RESET", role: .destructive) {
                        generationSelected = Set(hololiveGenerations.allCases)
                    }
                }, message: {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET_ALERT_TEXT")
                })
            }
        }
        .onChange(of: generationSelected, perform: { newValue in
            excludedGenerations =  Set(hololiveGenerations.allCases).symmetricDifference(newValue)
        })
        .navigationTitle("SETTINGS_MANAGE_GENERATION_VISIBILITY_VIEW_TITLE")
    }
}

struct ManageGenerationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationVisibilityView()
    }
}
