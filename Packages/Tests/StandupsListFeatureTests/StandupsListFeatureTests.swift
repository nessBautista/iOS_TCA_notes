import XCTest
import ComposableArchitecture
import StandupModels
@testable import StandupsListFeature

// Test suite for the StandupsList feature, focusing on its initialization behavior
@MainActor
final class StandupsListFeatureTests: StandupsListFeatureTestCase {
    // Tests that when the feature is initialized with pre-existing standups,
    // they are properly loaded into the state
    func test_whenInitializedWithStandups_hasStandups() async {
        let store = TestStore(
            initialState: self.initialState
        ) {
            StandupsListFeature()
        }
        // Call await store.finish() to ensure any initial effects complete
        await store.finish()
        XCTAssertFalse(store.state.standups.isEmpty)
    }
    
    // Tests that when the feature is initialized with an empty state,
    // the standups array remains empty
    func test_whenInitializedEmpty_hasNoStandups() async {
        let store = TestStore(
            initialState: self.emptyInitialstate
        ) {
            StandupsListFeature()
        }
        // Call await store.finish() to ensure any initial effects complete
        await store.finish()
        XCTAssertTrue(store.state.standups.isEmpty)
    }
} 
