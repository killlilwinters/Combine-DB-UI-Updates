
# Combine-DB-UI-Updates

A small iOS feature-project demonstrating how to use Apple's Combine framework to reactively update SwiftUI views when changes occur in a SwiftData database.

## Overview

This app showcases a common pattern:

1.  A view (`PersonGenerator`) triggers an action that modifies data in a database (SwiftData via `DatabaseInstance`).
2.  The database service (`DatabaseInstance`) publishes a notification (`PassthroughSubject`) upon successful modification.
3.  Another view's ViewModel (`ContentViewModel`) subscribes (`sink`) to this publisher.
4.  Upon receiving a notification, the subscribing ViewModel fetches the updated data from the database and updates its state (`@Observable` property).
5.  The corresponding SwiftUI view (`ContentView`) automatically reflects these changes.

This avoids manual refresh calls and tightly coupled view logic, leveraging Combine for a reactive data flow.

## Showcase

![CombineDBShowcase](https://github.com/user-attachments/assets/cbff0c87-28ca-4745-9c4a-9bd81f085385)

> The above video demonstrates how the project functions in an iOS 18.4
> Simulator.

## Project Structure

```
Combine-DB-UI-Updates
└── Combine-DB-UI-Updates
    ├── Model
    │   └── Person.swift               # SwiftData Model
    ├── Persistence
    │   ├── DatabaseInstance.swift     # Singleton DB Service with Publisher
    │   ├── DatabaseNotification.swift # Enum for notification types
    │   └── DatabaseProtocol.swift     # Protocol for the DB service
    ├── Views
    │   ├── ContentView
    │   │   ├── ContentView.swift      # Displays the list of people
    │   │   └── ContentViewModel.swift # Subscribes to DB updates, fetches data
    │   └── PersonGenerator
    │       ├── PersonGenerator.swift  # UI to add new people
    │       └── PersonGeneratorViewModel.swift # Logic to add people via DB service
    ├── Assets
    │   └── Combine_DB_UI_Updates.xcassets
    └── Combine_DB_UI_UpdatesApp.swift # App entry point
```


## How to Run

1.  Clone the repository.
2.  Open `Combine-DB-UI-Updates.xcodeproj` (or the package if it's a Swift Package) in Xcode.
3.  Build and run on a simulator or a physical device.
4.  Navigate to the "PersonGenerator" view using the '+' button and tap "Generate a person".
5.  Navigate back to "ContentView" to see the updated list.
