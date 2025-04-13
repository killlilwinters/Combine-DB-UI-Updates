//
//  DatabaseProtocol.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import Combine
import SwiftData

@MainActor 
protocol Database {
    var publisher: PassthroughSubject<DatabaseNotification, Never> { get }
    
    var modelContainer: ModelContainer? { get }
    var modelContext: ModelContext? { get }
}
