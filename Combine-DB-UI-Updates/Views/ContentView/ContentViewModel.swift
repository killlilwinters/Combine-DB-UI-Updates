//
//  ContentViewModel.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import Combine
import Foundation

@MainActor
@Observable
final class ContentViewModel {
    let db = DatabaseInstance.shared
    var subscriptions = Set<AnyCancellable>()
    var people = [Person]()
    
    init() {
        // Subscribe to the Database's publisher
        db.publisher
            .sink { [weak self] notification in
                // Fetch data upon every update notification
                if notification == .update { self?.fetchDataAndUpdateUI() }
            }
            // Storing the subscription to continue receiving updates
            .store(in: &subscriptions)
    }
    
    func fetchDataAndUpdateUI() {
        print("ContentView received a notification to update UI.\n\(people.count + 1) - people.")
        people = (try? db.fetchPeople()) ?? []
    }
}
