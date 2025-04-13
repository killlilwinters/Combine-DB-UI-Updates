//
//  PersonGenerator.swift
//  Combine-DB-UI-Updates
//
//  Created by Maks Winters on 13.04.2025.
//

import SwiftUI

struct PersonGenerator: View {
    
    @State private var viewModel = PersonGeneratorViewModel()
    
    var body: some View {
        VStack {
            
            if let person = viewModel.latestGeneratedPerson {
                VStack {
                    Image(systemName: "person.fill")
                    Text(person.name)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button("Generate a person") {
                viewModel.generateRandomPerson()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("PersonGenerator")
    }
}

#Preview {
    PersonGenerator()
}
