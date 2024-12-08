import SwiftUI
import ComposableArchitecture
import StandupModels



struct StandupFormView: View {
    @State private var standupTitle = "Design standup"
    @State private var duration = 5.0
    @State private var theme: Theme = .bubblegum
    @State private var attendees: [String] = ["Julie"]
    
    var body: some View {
        Form {
            Section("Standup Info") {
                //TextField("New Standup", text: $standupTitle)
                    
                HStack {
                    Text("Length")
                    Spacer()
                    Text("5 min")
                }
                
                Slider(
                    value: $duration,
                    in: 5...30,
                    step: 1
                ) {
                    Text("Duration")
                } minimumValueLabel: {
                    Text("5")
                } maximumValueLabel: {
                    Text("30")
                }
                ThemePicker(selection: $theme)
            }
            
            Section("Attendees") {
                ForEach(Array(attendees.enumerated()), id: \.offset) { index, attendee in
                    TextField("Name", text: $attendees[index])
                }
                .onDelete { indices in
                    attendees.remove(atOffsets: indices)
                }
                
                Button("Add attendee") {
                    attendees.append("")
                }
            }
        }
    }
}

struct ThemePicker: View {
  @Binding var selection: Theme

  var body: some View {
    Picker("Theme", selection: self.$selection) {
      ForEach(Theme.allCases) { theme in
        ZStack {
          RoundedRectangle(cornerRadius: 4)
            .fill(theme.mainColor)
          Label(theme.name, systemImage: "paintpalette")
            .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
        .tag(theme)
      }
    }
  }
}

public extension Duration {
  fileprivate var minutes: Double {
    get { Double(self.components.seconds / 60) }
    set { self = .seconds(newValue * 60) }
  }
}

#Preview {
    StandupFormView()
}


#Preview {
    NavigationStack {
        StandupFormView()
    }
}
