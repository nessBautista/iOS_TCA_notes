# **Standup Form Engineering Design Document**

## Overview

The objective of this feature will be to provide the user with an interface to add create new Standups instances.

The UI for the Standup form will be built using the SwiftUI `Form` component. The `Form` component provides a structured layout for presenting and editing data, making it well-suited for this use case. The `Form` will contain 2 sections

1. **Standup Info**:

  - **Title**: A text field for the standup title, with a placeholder of "New Standup".
  - **Duration**: A slider to select the duration of the standup meeting, with a range from 5 to 30 minutes. The initial value will be 5 minutes, and the selected duration will be displayed in a label next to the slider.
  - **Theme**: A button labeled "Select Theme" that, when tapped, will display a sheet with a grid of available themes. The selected theme will be displayed on the button.
2. **Attendees**:

  - **Attendee List**: A list of attendees, with each attendee's name displayed. The user will be able to swipe on an attendee to reveal a delete button and remove them from the list.
  - **Add Attendee**: A button with a "+" icon that, when tapped, will display a sheet with a text field for the user to enter a new attendee's name. The new attendee will then be added to the list.

If there are no attendees, the "Attendees" section will only display the "Add Attendee" button.
