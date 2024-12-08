import ComposableArchitecture
import SwiftUI
import StandupModels

@Reducer
struct StandupsListFeature {
    @ObservableState
    struct State: Equatable {
        // We initialize with an empty array of standups
        // using `IdentifiedArrayOf` enable us with an ergonomic access to our array elements
        // by using the identifier rather than the positional index of the elements.
        var standups: IdentifiedArrayOf<Standup> = []
    }
    
    enum Action: Equatable {}
    
    @Dependency(\.uuid) var uuid
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
