//
//  PersonGeneratorViewModel.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import Foundation

@MainActor
@Observable
final class PersonGeneratorViewModel {
    let db = DatabaseInstance.shared
    var latestGeneratedPerson: Person?
    
    // The view that generates the data usually doesn't need to subscribe to changes
    // as it's the one creating them
    func generateRandomPerson() {
        let name = UUID().uuidString
        let person = Person(name: String(name.prefix(5)))
        db.addPerson(person)
        latestGeneratedPerson = person
    }
}
