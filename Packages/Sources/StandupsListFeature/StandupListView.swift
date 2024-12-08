import ComposableArchitecture
import SwiftUI
import StandupModels

struct StandupsListView: View {
    // This store will be an instance of our Feature.
    // You can think of it as a bridge to our source of truth
    let store: StoreOf<StandupsListFeature>
    var body: some View {
        NavigationStack {
            List {
                // We can access our state using the properties of our store
                ForEach(store.standups) { standup in
                    NavigationLink(destination: Text(standup.title)) {
                        CardView(standup: standup)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                }
            }
            .navigationTitle("Daily Standups")
            .toolbar {
                ToolbarItem {
                    Button {
             
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let standup: Standup
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(standup.title)
                .font(.headline)
            Spacer()
            HStack {
                Label(
                    "\(standup.attendeeCount)",
                    systemImage: "person.3"
                )
                .foregroundStyle(standup.theme.accentColor)
                
                Spacer()
                
                Label(
                    standup.duration.formatted(.units()),
                    systemImage: "clock"
                )
                .foregroundStyle(standup.theme.accentColor)
                .labelStyle(.trailingIcon)
                
                if let lastMeetingDate = standup.lastMeetingDate {
                    Spacer()
                    Label(
                        lastMeetingDate.formatted(date: .numeric, time: .omitted),
                        systemImage: "calendar"
                    )
                    .foregroundStyle(standup.theme.accentColor)
                    .labelStyle(.trailingIcon)
                }
            }
            .font(.caption)
        }
        .padding()
        .background(standup.theme.mainColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}

#Preview {
    NavigationStack {
        NavigationStack {
            StandupsListView(
                store: Store(
                    initialState: StandupsListFeature.State(
                        standups: [.mock]
                    )
                ) {
                    StandupsListFeature()
                        ._printChanges()
                }
            )
        }
    }
}
