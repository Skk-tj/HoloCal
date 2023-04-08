//
//  SingleAgencyItemView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SingleAgencyItemView: View {
    let agency: AgencyEnum
    
    var body: some View {
        Label(title: {
            VStack(alignment: .leading) {
                Text(agency.getAgency().localizedName)
                Text(agency.getAgency().altLocalizedName)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }, icon: {
            Image(systemName: agency.getAgency().icon)
        })
    }
}

struct SingleAgencySelectionView: View {
    let agency: AgencyEnum
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
#if os(iOS)
                .fill(.thickMaterial)
#endif
                .frame(height: 105)
            
            VStack(alignment: .leading) {
                Image(systemName: agency.getAgency().icon)
                
                Text(agency.getAgency().localizedName)
                Text(agency.getAgency().altLocalizedName)
                    .foregroundColor(.secondary)
            }
            .font(.title3)
            .padding(.bottom)
            .padding(.leading)
        }
    }
}

struct FavouritesSelectionView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
#if os(iOS)
                .fill(.thickMaterial)
#endif
                .frame(height: 105)
            
            VStack(alignment: .leading) {
                Image(systemName: "star.fill")
                
                Text("ROOT_VIEW_FAVOURITES")
            }
            .font(.title3)
            .padding(.bottom)
            .padding(.leading)
        }
    }
}

struct SingleAgencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAgencyItemView(agency: .hololive)
        
#if os(iOS)
        List {
            SingleAgencySelectionView(agency: .hololive)
            
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .nijisanji)
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .react)
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .noriPro)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
        List {
            SingleAgencySelectionView(agency: .hololive)
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .nijisanji)
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .react)
                .listRowSeparator(.hidden)
            SingleAgencySelectionView(agency: .noriPro)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .preferredColorScheme(.dark)
#endif
    }
}
