//
//  VendorsView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 2/8/24.
//

import SwiftUI

struct VendorsView: View {
    let vendors: [Person]

    var body: some View {
        VStack {
            List {
                ForEach(vendors.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { vendor in
                    HStack {
                        if let picture = vendor.picture, !picture.isEmpty {
                            Image(picture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                        }
                        NavigationLink(destination: PersonView(person: vendor)) {
                            Text(vendor.name)
                        }.navigationTitle("Vendors")
                    }
                }
            }
        }
    }
}

struct VendorsView_Previews: PreviewProvider {
    static var previews: some View {
        VendorsView(
            vendors: ConferenceView_Previews.vendors
        )
    }
}
