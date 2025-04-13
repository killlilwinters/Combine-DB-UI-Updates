//
//  Person.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import SwiftData

@Model
final class Person {
    @Attribute(.unique) var name: String
    
    init(name: String) { self.name = name }
}
