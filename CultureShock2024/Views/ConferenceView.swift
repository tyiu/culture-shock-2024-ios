//
//  ConferenceView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct ConferenceView: View {
    private let conference: Conference
    private let dateFormatter = DateFormatter()
    private var calendar = Calendar.current

    @State var selectedDayIndex: Int = 0

    init(conference: Conference) {
        self.conference = conference

        calendar.timeZone = conference.timeZone

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = conference.timeZone
    }

    var body: some View {
        TabView {
            ScheduleView(conference: conference)
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }

            PeopleView(
                speakers: Array(Set(conference.sessions.flatMap { $0.speakers })),
                organizers: conference.organizers,
                volunteers: conference.volunteers
            )
            .tabItem {
                Label("People", systemImage: "person")
            }

            SponsorsView(
                sponsors: SponsorsView_Previews.sponsors
            )
            .tabItem {
                Label("Sponsors", systemImage: "heart")
            }
        }
        .navigationTitle(conference.name)
    }
}

struct ConferenceView_Previews: PreviewProvider {

    static let isoDateFormatter = ISO8601DateFormatter()

    static let cultureShock2024 = Conference(
        name: "Culture Shock 2024",
        startDate: isoDateFormatter.date(from: "2024-02-17T10:00:00-07:00")!,
        endDate: isoDateFormatter.date(from: "2024-02-17T20:00:00-07:00")!,
        location: "Phoenix, Arizona",
        timeZone: TimeZone(identifier: "America/Phoenix") ?? TimeZone.current,
        sessions: sessions,
        organizers: organizers,
        volunteers: volunteers
    )

    static let arkinox = Person(
        nostrPublicKey: "npub1arkn0xxxll4llgy9qxkrncn3vc4l69s0dz8ef3zadykcwe7ax3dqrrh43w",
        name: "Arkinox",
        description:
"""
InnovatAR Co-Founder
""",
        picture: "arkinox",
        lightningIdentifier: "arkinox@getalby.com"
    )

    static let calvadev = Person(
        nostrPublicKey: "npub16dhgpql60vmd4mnydjut87vla23a38j689jssaqlqqlzrtqtd0kqex0nkq",
        name: "calvadev⚡️",
        description:
"""
Shopstr Co-Founder
""",
        picture: "calvadev",
        lightningIdentifier: "calvadev@getalby.com"
    )

    static let car = Person(
        nostrPublicKey: "npub1f4www6qjx43mckpkjld4apyyr76j3aahprvkduh9gc5xec78ypmsmakqh9",
        name: "Car González",
        description:
"""
Pleb Lab Co-Founder  & Thriller Zine
""",
        picture: "car",
        lightningIdentifier: "thrillerx_@getalby.com"
    )

    static let erik = Person(
        nostrPublicKey: "npub1aesr9ql7h3xrrvyeqvujgz9zllca4a56cgjy5hj26plv5w78nhkq2m0d2r",
        name: "Erik",
        description:
"""
Bitcoin Consulting & JUXTAPOSE Founder
""",
        picture: "erik",
        lightningIdentifier: "bcus@strike.me"
    )

    static let heidi = Person(
        nostrPublicKey: "npub1zas6j8r62ejfadxrvqsrp27qdszdpr87hdg4jyussfrx72eek86sjg8sm8",
        name: "Heidi",
        description:
"""
""",
        picture: "heidi",
        lightningIdentifier: "heidi@zbd.gg"
    )

    static let jimCostello = Person(
        nostrPublicKey: "npub1t6njrhtc9q3f5wdrwfrhpypq3kes5mpdx4u4rw9w2pxjanuxcpkqveagv3",
        name: "Jim Costello",
        description:
"""
Phantom Power Media
""",
        picture: "jim-costello",
        lightningIdentifier: "LNURL1DP68GURN8GHJ7EM9W3SKCCNE9E3K7MF0D3H82UNVWQHHQ6RPDE6X7MTSDAMK2UNDV4JXJCGR8045E"
    )

    static let michaelRhee = Person(
        nostrPublicKey: "npub1z0rrmak9v5drkr3a20e5pehrwzc5pf392apfl5t9h9qk928nay3s7wxuxf",
        name: "Michael Rhee",
        description:
"""
Wavlake Co-Founder
""",
        picture: "michael-rhee",
        lightningIdentifier: "rheedi0@stacker.news"
    )

    static let openMike = Person(
        nostrPublicKey: "npub1a6c3jcdj23ptzcuflek8a04f4hc2cdkat95pd6n3r8jjrwyzrw0q43lfrr",
        name: "OpenMike",
        description:
"""
Founder & CTO, tunestr.io
""",
        picture: "open-mike",
        lightningIdentifier: "openmike@getalby.com"
    )

    static let samMeans = Person(
        nostrPublicKey: "npub1eequz6v23szzyx9utphsh8kg6kll50wte6sfh4vah8gdjtplcz6qg7at9s",
        name: "Sam Means",
        description:
"""
Wavlake Co-Founder & Lightning Store
""",
        picture: "sam-means",
        lightningIdentifier: "ltngstore@getalby.com"
    )

    static let saraJade = Person(
        nostrPublicKey: "npub17yemy3hswcelmcdgjsfn4sns4wr4q5ptvj5h08qt4s7fy2qe3hdqsczs99",
        name: "Sara Jade",
        description:
"""
Keytar Wielding Singer Songwriter
""",
        picture: "sara-jade",
        lightningIdentifier: "gabbytea88@walletofsatoshi.com"
    )

    static let qw = Person(
        nostrPublicKey: "npub1tvqc82mv8cezhax5r34n4muc2c4pgjz8kaye2smj032nngg52clq0rkrq4",
        name: "QW",
        description:
"""
Community Builder & Plebchain Radio
""",
        picture: "qw",
        lightningIdentifier: "qdub@getalby.com"
    )

    static let tyiu = Person(
        nostrPublicKey: "npub1yaul8k059377u9lsu67de7y637w4jtgeuwcmh5n7788l6xnlnrgs3tvjmf",
        name: "Terry Yiu",
        description: "Founder @ Comingle\nContributor @ Damus\nEngineer @ Cash App",
        picture: "tyiu",
        lightningIdentifier: "tyiu@tyiu.xyz"
    )

    static let zantoshi = Person(
        nostrPublicKey: "npub1fkvjh50p9amcvce5eclalcszqduehlhmsjm76hx3zy5sx3g40ddqqednwk",
        name: "Zantoshi",
        description:
"""
VP Business Intelligence @ ZBD
""",
        picture: "zantoshi",
        lightningIdentifier: "sats@zbd.gg"
    )

    static let sessionBreakfast = Session(
        id: "breakfast",
        name: "Breakfast",
        speakers: [
            heidi
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T09:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T09:55:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionOpeningCeremony = Session(
        id: "opening-ceremony",
        name: "Opening Ceremony",
        speakers: [
            samMeans,
            qw,
            zantoshi,
            heidi
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T10:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T10:25:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionWavLake = Session(
        id: "wavlake",
        name: "Wavlake: Empowering Artists Through Value 4 Value",
        speakers: [
            michaelRhee,
            samMeans
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T10:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T10:55:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionPurpleReign = Session(
        id: "purple-reign",
        name: "Purple Reign: The Value 4 Value Movement",
        speakers: [
            qw,
            openMike
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T11:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T11:25:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionNostrTheDawnOfCyberspace = Session(
        id: "nostr-the-dawn-of-cyberspace",
        name: "Nostr: The Dawn of Cyberspace",
        speakers: [
            arkinox
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T11:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T12:00:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionLunch = Session(
        id: "lunch",
        name: "Heidi's Lunch",
        speakers: [
            heidi
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T12:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T12:50:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionTheCreatorEcosystemVision = Session(
        id: "the-creator-ecosystem-vision",
        name: "The Creator Ecosystem Vision",
        speakers: [
            zantoshi
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T13:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T13:25:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionHowNostrPowersDevelopersAndMarketplaces = Session(
        id: "how-nostr-powers-developers-and-marketplaces",
        name: "How Nostr Powers Developers and Marketplaces",
        speakers: [
            calvadev
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T13:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T13:55:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionJimCostello = Session(
        id: "jim-costello",
        name: "Fireside Chat with Jim Costello",
        speakers: [
            jimCostello,
            samMeans
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T14:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T14:25:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionPuraVida = Session(
        id: "pura-vida",
        name: "What Pura Vida Means to Me",
        speakers: [
            erik
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T14:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T14:55:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionNostrBuildersPanel = Session(
        id: "nostr-builders-panel",
        name: "Nostr Builders Panel",
        speakers: [
            michaelRhee,
            qw,
            openMike,
            car
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T15:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T15:25:00-07:00")!,
        stage: "",
        description:
"""
Moderated by Car
"""
    )

    static let sessionSaraJade = Session(
        id: "sara-jade",
        name: "Fireside Chat with Sara Jade",
        speakers: [
            saraJade,
            jimCostello
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T15:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T15:55:00-07:00")!,
        stage: "",
        description:
"""
Sara Jade interviewed by Jim
"""
    )

    static let sessionLivePerformance = Session(
        id: "live-performance",
        name: "Live Performance",
        speakers: [
            saraJade
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T16:00:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T16:25:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionClosingCeremony = Session(
        id: "closing-ceremony",
        name: "Closing Ceremony",
        speakers: [
            samMeans,
            qw,
            zantoshi,
            heidi
        ],
        startTime: isoDateFormatter.date(from: "2024-02-17T16:30:00-07:00")!,
        endTime: isoDateFormatter.date(from: "2024-02-17T17:00:00-07:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessions = [
        sessionOpeningCeremony,
        sessionWavLake,
        sessionPuraVida,
        sessionSaraJade,
        sessionLunch,
        sessionTheCreatorEcosystemVision,
        sessionHowNostrPowersDevelopersAndMarketplaces,
        sessionJimCostello,
        sessionPurpleReign,
        sessionNostrTheDawnOfCyberspace,
        sessionNostrBuildersPanel,
        sessionClosingCeremony,
        sessionLivePerformance
    ]

    static let organizers = [
        heidi,
        qw,
        samMeans,
        zantoshi
    ]

    static let volunteers = [
        tyiu
    ]

    static var previews: some View {
        ConferenceView(
            conference: cultureShock2024
        )
    }
}
