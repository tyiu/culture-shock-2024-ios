//
//  InfoView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/4/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let helloMerch = CLLocationCoordinate2D(latitude: InfoView.helloMerchLatitude, longitude: InfoView.helloMerchLongitude)
}

struct InfoView: View {
    private static let flockstrUrl = "https://www.flockstr.com/event/naddr1qqyrgcmyxe3kvefhqyxhwumn8ghj7mn0wvhxcmmvqgs9kqvr4dkruv3t7n2pc6e6a7v9v2s5fprmwjv4gde8c4fe5y29v0srqsqqql9ngrt6tu"
    private static let nostrPhxUrl = "https://www.nostrphx.com/culture-shock"
    private static let meetupUrl = "https://www.meetup.com/nostrphx/events/298181189/"
    private static let geyserUrl = "https://geyser.fund/project/cultureshock"
    private static let shirtUrl = "https://lightning.store/product/culture-shock-t-shirt/"
    private static let googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=\(InfoView.helloMerchLatitude),\(InfoView.helloMerchLongitude)"
    private static let helloMerchAddress = "850 W Lincoln St, Phoenix, AZ 85007"
    private static let helloMerchName = "Hello Merch"
    static let helloMerchLatitude = 33.4421916
    static let helloMerchLongitude = -112.083652
    private let helloMerch = MKMapItem(placemark: MKPlacemark(coordinate: .helloMerch) )

    init() {
        helloMerch.name = InfoView.helloMerchName
    }

    var body: some View {
        ScrollView {
            Image("culture-shock-poster")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 400, maxHeight: 400)
                .padding(.bottom, 10)

            HStack {
                if let url = URL(string: InfoView.nostrPhxUrl) {
                    Button(
                        action: {
                            UIApplication.shared.open(url)
                        },
                        label: {
                            Image("nostrphx")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                    )
                    .background(.white)
                    .accessibilityLabel(Text("Nostr PHX logo."))
                    .accessibilityHint(Text("Opens the Culture Shock event page on the Nostr PHX website."))
                }

                if let url = URL(string: InfoView.flockstrUrl) {
                    Button(
                        action: {
                            UIApplication.shared.open(url)
                        },
                        label: {
                            Image("flockstr")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                    )
                    .accessibilityLabel(Text("Flockstr logo."))
                    .accessibilityHint(Text("Opens the Culture Shock event page on the Flockstr website."))
                }

                if let url = URL(string: InfoView.meetupUrl) {
                    Button(
                        action: { UIApplication.shared.open(url) },
                        label: {
                            Image("meetup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                    )
                    .accessibilityLabel(Text("Meetup logo."))
                    .accessibilityHint(Text("Opens the Culture Shock event page on the Meetup website."))
                }

                if let url = URL(string: InfoView.geyserUrl) {
                    Button(
                        action: { UIApplication.shared.open(url) },
                        label: {
                            Image("geyser")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                    )
                    .accessibilityLabel(Text("Geyser logo."))
                    .accessibilityHint(Text("Opens the Culture Shock funding support page on the Geyser website."))
                }

                if let url = URL(string: InfoView.shirtUrl) {
                    Button(
                        action: {
                            UIApplication.shared.open(url)
                        },
                        label: {
                            Image("shirt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                        }
                    )
                    .accessibilityLabel(Text("Culture Shock t-shirt."))
                    .accessibilityHint(Text("Opens the Culture Shock t-shirt purchase page on the Lightning.store website."))
                }
            }

            Text("Venue: \(InfoView.helloMerchName)")

            HStack {
                Button(
                    action: {
                        UIPasteboard.general.string = InfoView.helloMerchAddress
                    },
                    label: {
                        Label(InfoView.helloMerchAddress, systemImage: "doc.on.doc")
                    }
                )
                .buttonStyle(.bordered)
            }

            HStack {
                Text("Open in:")

                Button("Apple Maps") {
                    helloMerch.openInMaps()
                }
                .buttonStyle(.bordered)

                if let url = URL(string: InfoView.googleMapsUrl) {
                    Link("Google Maps", destination: url)
                        .buttonStyle(.bordered)
                }
            }
            .padding(.bottom, 10)

            Text(
"""
Nostr PHX Presents Culture Shock

The first Value 4 Value cultural event in Downtown Phoenix. We will showcase the power of Nostr + Bitcoin / Lightning with a full day of education, conversation, food, live music performances and goods. We strive to source local vendors, local artists, local partnerships.
""")

            Divider()
                .frame(height: 4)
                .overlay(Color.init(red: 242 / 255, green: 166 / 255, blue: 59 / 255))
                .padding(20)

            if let url = URL(string: "https://comingle.co/") {
                Button(
                    action: { UIApplication.shared.open(url) },
                    label: {
                        Image("comingle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                )
            }

            Text("This Culture Shock 2024 app was built by Terry Yiu (tyiu) to reimagine conference apps in a Nostr world. This work is being used to inspire Comingle, a general-purpose Nostr conference app, powered by NIP-52 calendar events. If you have feedback, please message him. He can be found on the People > Volunteers page of the app.")
        }
        .padding(20)
        .navigationTitle("Conference Info")
    }
}

#Preview {
    InfoView()
}
