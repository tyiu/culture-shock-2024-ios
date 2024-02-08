//
//  SessionView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct SessionView: View {

    private let dateIntervalFormatter = DateIntervalFormatter()
    private let session: Session
    private let calendar: Calendar

    init(session: Session, calendar: Calendar) {
        self.session = session
        self.calendar = calendar

        dateIntervalFormatter.dateStyle = .none
        dateIntervalFormatter.timeStyle = .short
        dateIntervalFormatter.timeZone = calendar.timeZone
    }

    var body: some View {
        ScrollView {
            Text(session.name)
                .padding(.vertical, 2)
                .font(.largeTitle)

            Divider()

            if !session.stage.isEmpty {
                Text(session.stage)
                    .padding(.vertical, 2)
                    .font(.subheadline)
            }

            Text(dateIntervalFormatter.string(from: session.startTime, to: session.endTime))
                .font(.footnote)

            if !session.description.isEmpty {
                Divider()

                Text(session.description)
                    .padding(.vertical, 2)
                    .font(.subheadline)
            }

            if !session.speakers.isEmpty {
                Divider()

                Text("Speakers:")
                    .padding(.vertical, 2)
                    .font(.title)
                ForEach(session.speakers, id: \.self) { speaker in
                    PersonView(person: speaker)
                    Divider()
                }
            }
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView(session: ConferenceView_Previews.sessionOpeningCeremony, calendar: Calendar.current)
    }
}
