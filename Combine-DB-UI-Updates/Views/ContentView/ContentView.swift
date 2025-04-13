//
//  ContentView.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.people, id: \.name) { person in
                HStack {
                    Image(systemName: "person.fill")
                    Text(person.name)
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        PersonGenerator()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("ContentView")
        }
    }
}

#Preview {
    ContentView()
}
