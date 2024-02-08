//
//  CultureShock2024App.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/9/23.
//

import SwiftUI

@main
struct CultureShock2024App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    ConferenceView(conference: ConferenceView_Previews.cultureShock2024)
                }
                .navigationTitle("Culture Shock 2024")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink(destination: HelpView()) {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink(destination: InfoView()) {
                            Image(systemName: "info.circle")
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }
    }
}
