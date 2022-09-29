//
//  SpecialThanksView().swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-25.
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
        }
        .navigationTitle("SETTINGS_SPECIAL_THANKS")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpecialThanksView___Previews: PreviewProvider {
    static var previews: some View {
        SpecialThanksView()
    }
}
