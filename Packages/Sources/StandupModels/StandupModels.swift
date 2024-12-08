import SwiftUI

/// Represents a standup meeting configuration with its attendees, duration, and history.
public struct Standup: Equatable, Identifiable, Codable, Sendable {
    /// Unique identifier for the standup
    public let id: UUID
    /// List of attendees participating in the standup
    public var attendees: [Attendee] = []
    /// Total duration allocated for the standup meeting
    public var duration = Duration.seconds(60 * 5)
    /// Historical record of past meetings
    public var meetings: [Meeting] = []
    /// Visual theme for the standup
    public var theme: Theme = .bubblegum
    /// Name or title of the standup meeting
    public var title = ""
    
    /// Date of the most recent meeting, if any meetings exist
    public var lastMeetingDate: Date? {
        meetings.max(by: { $0.date < $1.date })?.date
    }
    
    /// Calculated duration per attendee based on total duration and number of attendees
    var durationPerAttendee: Duration {
        guard !attendees.isEmpty else { return duration }
        return self.duration / self.attendees.count
    }
    
    public var attendeeCount: Int {
        attendees.count
    }
    
    public init(id: UUID, attendees: [Attendee], duration: Duration = Duration.seconds(60 * 5), meetings: [Meeting] = [], theme: Theme, title: String = "") {
        self.id = id
        self.attendees = attendees
        self.duration = duration
        self.meetings = meetings
        self.theme = theme
        self.title = title
    }
}

/// Represents an individual participant in a standup meeting
public struct Attendee: Equatable, Identifiable, Codable, Sendable {
    /// Unique identifier for the attendee
    public let id: UUID
    /// Name of the attendee
    public var name = ""
    
    public init(id: UUID, name: String = "") {
        self.id = id
        self.name = name
    }
}

/// Represents a recorded standup meeting instance
public struct Meeting: Equatable, Identifiable, Codable, Sendable {
    /// Unique identifier for the meeting
    public let id: UUID
    /// Date when the meeting took place
    public let date: Date
    /// Text record of the meeting's conversation
    public var transcript: String
    
    public init(id: UUID, date: Date, transcript: String) {
        self.id = id
        self.date = date
        self.transcript = transcript
    }
}

/// Represents the visual theme options available for standups
public enum Theme: String, CaseIterable, Equatable, Hashable, Identifiable, Codable, Sendable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    /// The theme itself serves as its identifier
    public var id: Self { self }
    
    /// Determines the appropriate text color to use against the theme's background
    public var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan,
                .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }
    
    /// The main color associated with this theme
    public var mainColor: Color { Color(self.rawValue) }
    
    /// Human-readable name of the theme
    public var name: String { self.rawValue.capitalized }
}


extension Standup {
    public static let mock = Self(
        id: Standup.ID(),
        attendees: [
            Attendee(id: Attendee.ID(), name: "Blob"),
            Attendee(id: Attendee.ID(), name: "Blob Jr"),
            Attendee(id: Attendee.ID(), name: "Blob Sr"),
            Attendee(id: Attendee.ID(), name: "Blob Esq"),
            Attendee(id: Attendee.ID(), name: "Blob III"),
            Attendee(id: Attendee.ID(), name: "Blob I"),
        ],
        duration: .seconds(60),
        meetings: [
            Meeting(
                id: Meeting.ID(),
                date: Date().addingTimeInterval(-60 * 60 * 24 * 7),
                transcript: """
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor \
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud \
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure \
          dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \
          Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \
          mollit anim id est laborum.
          """
            )
        ],
        theme: .orange,
        title: "Design"
    )
    
    static let mocks: [Standup] = [
        Self.mock,  // Use the existing mock as first item
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Alice"),
                Attendee(id: UUID(), name: "Bob"),
            ],
            duration: .seconds(300),
            theme: .bubblegum,
            title: "Engineering"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Carol"),
                Attendee(id: UUID(), name: "Dave"),
                Attendee(id: UUID(), name: "Eve"),
            ],
            duration: .seconds(450),
            theme: .indigo,
            title: "Marketing"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Frank"),
                Attendee(id: UUID(), name: "Grace"),
            ],
            duration: .seconds(600),
            theme: .lavender,
            title: "Product"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Henry"),
                Attendee(id: UUID(), name: "Ivy"),
            ],
            duration: .seconds(300),
            theme: .navy,
            title: "Sales"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Jack"),
                Attendee(id: UUID(), name: "Kelly"),
            ],
            duration: .seconds(300),
            theme: .purple,
            title: "Support"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Linda"),
                Attendee(id: UUID(), name: "Mike"),
            ],
            duration: .seconds(300),
            theme: .seafoam,
            title: "Operations"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Nina"),
                Attendee(id: UUID(), name: "Oscar"),
            ],
            duration: .seconds(300),
            theme: .tan,
            title: "Research"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Paul"),
                Attendee(id: UUID(), name: "Quinn"),
            ],
            duration: .seconds(300),
            theme: .teal,
            title: "Finance"
        ),
        Self(
            id: UUID(),
            attendees: [
                Attendee(id: UUID(), name: "Rachel"),
                Attendee(id: UUID(), name: "Steve"),
            ],
            duration: .seconds(300),
            theme: .yellow,
            title: "HR"
        )
    ]
}


