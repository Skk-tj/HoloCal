//
//  SpecialThanksView().swift
//  holo-wtf
//
//
//

import SwiftUI

struct SpecialThanksView: View {
    var body: some View {
        List {
            Section(content: {
                Link(destination: URL(string: "https://www.twitter.com/amefuru_")!, label: {
                    Text("ame")
                })
                
                Text("Ricky")
                
                Link(destination: URL(string: "https://www.twitter.com/bobsmithliu")!, label: {
                    Text("Liu/リュウ")
                })
            }, header: {
                Text("Translators")
            })
            
            Section {
                Link(destination: URL(string: "https://holodex.net")!, label: {
                    Text("Data graciously provided by Holodex")
                })
            }
            
            Section(content: {
                Text("sayaka#4163")
                Text("acolyte#9321")
                Link(destination: URL(string: "https://teamup.com/ks58vf85ajmc6pd7vu")!) {
                    Text("Original concert data")
                }
            }, header: {
                Text("Concert data provided by")
            })
        }
        .navigationTitle("SETTINGS_SPECIAL_THANKS")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpecialThanksView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialThanksView()
    }
}
