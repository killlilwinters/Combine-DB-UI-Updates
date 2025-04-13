//
//  DatabaseInstance.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import Combine
import SwiftData

@MainActor
// MVVM Implementation of the database
final class DatabaseInstance: Database {
    static let shared = DatabaseInstance()
    let publisher = PassthroughSubject<DatabaseNotification, Never>() // Publisher for views to subscribe
    
    internal let modelContainer = try? ModelContainer(for: Person.self, configurations: .init(isStoredInMemoryOnly: true))
    internal lazy var modelContext = modelContainer?.mainContext
    
    private init() { }
    
    func addPerson(_ person: Person) {
        modelContext?.insert(person)
        publisher.send(.update) // Send update notification
    }
    
    func fetchPeople() throws -> [Person]? {
        do { return try modelContext?.fetch(FetchDescriptor<Person>()) } catch { throw error }
    }
}
