//
//  PeopleView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct PeopleView: View {
    let speakers: [Person]
    let organizers: [Person]
    let volunteers: [Person]

    @State var selectedGroupIndex: Int = 0

    var body: some View {
        VStack {
            Picker(selection: $selectedGroupIndex, label: Text("Group")) {
                Text(
                    "Speakers",
                    comment: "Picker option to show list of conference speakers."
                ).tag(0)
                Text(
                    "Organizers",
                    comment: "Picker option to show list of conference organizers."
                ).tag(1)
                Text(
                    "Volunteers",
                    comment: "Picker option to show list of conference volunteers."
                ).tag(2)
            }
            .pickerStyle(.segmented)
            List {
                if selectedGroupIndex == 0 {
                    ForEach(speakers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { person in
                        HStack {
                            if let picture = person.picture, !picture.isEmpty {
                                Image(picture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            }
                            NavigationLink(destination: PersonView(person: person)) {
                                Text(person.name)
                            }.navigationTitle("People")
                        }
                    }
                } else if selectedGroupIndex == 1 {
                    ForEach(organizers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { person in
                        HStack {
                            if let picture = person.picture, !picture.isEmpty {
                                Image(picture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            }
                            NavigationLink(destination: PersonView(person: person)) {
                                Text(person.name)
                            }.navigationTitle("People")
                        }
                    }
                } else {
                    ForEach(volunteers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { person in
                        HStack {
                            if let picture = person.picture, !picture.isEmpty {
                                Image(picture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            }
                            NavigationLink(destination: PersonView(person: person)) {
                                Text(person.name)
                            }.navigationTitle("People")
                        }
                    }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(
            speakers: ConferenceView_Previews.cultureShock2024.sessions.flatMap { $0.speakers },
            organizers: ConferenceView_Previews.organizers,
            volunteers: ConferenceView_Previews.volunteers
        )
    }
}
