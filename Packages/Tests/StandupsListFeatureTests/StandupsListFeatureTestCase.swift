import XCTest
import ComposableArchitecture
import StandupModels
@testable import StandupsListFeature

open class StandupsListFeatureTestCase: XCTestCase {
    
    let emptyInitialstate: StandupsListFeature.State = .init()
    
    let initialState: StandupsListFeature.State = .init(
        standups: [
            Standup(
                id: UUID(0),
                attendees: [Attendee(id: UUID(1))],
                theme: .bubblegum
            )
        ]
    )
}
