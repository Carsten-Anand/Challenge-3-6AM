//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI
import SwiftData
import UIKit
struct DetailedPlacesView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var data: Place
    
    var visitedColor: Color {
        data.isVisited ? .green : .blue
    }
    
    var visitedLabel: String {
        data.isVisited ? "Visited" : "Mark Visited"
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    
                    Text(data.desc)
                        .padding()
                    
                    Text(data.location)
                        .padding()
                    
                    HStack(spacing: 20) {
                    }
                    .padding(20)
                    .navigationTitle(data.name)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .bottomBar) {
                            
                            // -------- VISITED BUTTON --------
                            Button {
                                data.isVisited.toggle()
                            } label: {
                                Text(visitedLabel)
                            }.buttonStyle(.glassProminent).tint(visitedColor)
                        }
                            ToolbarItem(placement: .bottomBar) {
                                // -------- BOOKMARK BUTTON --------
                                Button {
                                    data.isSaved.toggle()
                                } label: {
                                    Image(systemName: data.isSaved ? "bookmark.fill" : "bookmark")
                                }
                            .accessibilityLabel("Save bookmark")
                            
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    DetailedPlacesView(data: sampleData[0])
}
