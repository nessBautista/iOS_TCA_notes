import ComposableArchitecture
import StandupModels
import SwiftUI

@Reducer
struct StandupFormFeature {
    @ObservableState
    struct State: Equatable {
    
    }
    
    enum Action {
        
    }
    
    @Dependency(\.uuid) var uuid
    var body: some ReducerOf<Self> {
        Reduce { state, action in
                return .none
        }
    }
}
