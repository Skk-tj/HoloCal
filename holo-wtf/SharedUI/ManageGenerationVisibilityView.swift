//
//  ManageGenerationSelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationVisibilityView: View {
    @AppStorage("generationListSelection") var generationSelected = Set(Generation.allCases)
    @AppStorage("excludedGenerations") var excludedGenerations = Set<Generation>()
    @State var showResetAlert = false
    
    var body: some View {
        List {
            ForEach(AgencyEnum.allCases, id: \.self) { agency in
                Section(content: {
                    ForEach(agencyEnumToGenerations[agency]!, id: \.self) { generation in
                        DisclosureGroup(content: {
                            ForEach(talentsByGeneration[generation]!.members) { talent in
                                VStack(alignment: .leading) {
                                    Text(talentEnumToTalent[talent]!.localizedName)
                                    Text(talentEnumToTalent[talent]!.altLocalizedName)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }, label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(generation.getLocalizedName())
                                    Text(generation.getAltLocalizedName())
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
                        })
                    }
                }, header: {
                    Text(agencyEnumToAgency[agency]!.localizedName)
                })
            }
            
            Section(content: {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET")
                })
                .confirmationDialog("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET_ALERT_TEXT", isPresented: $showResetAlert, actions: {
                    Button("SETTINGS_MANAGE_GENERATION_RESET_ALERT_RESET", role: .destructive) {
                        generationSelected = Set(Generation.allCases)
                    }
                }, message: {
                    Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_RESET_ALERT_TEXT")
                })
            }, footer: {
                Text("SETTINGS_MANAGE_GENERATION_VISIBILITY_SECTION_FOOTER")
            })
        }
        .onChange(of: generationSelected, perform: { newValue in
            excludedGenerations = Set(Generation.allCases).symmetricDifference(newValue)
        })
        .navigationTitle("SETTINGS_MANAGE_GENERATION_VISIBILITY_VIEW_TITLE")
    }
}

struct ManageGenerationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationVisibilityView()
    }
}
