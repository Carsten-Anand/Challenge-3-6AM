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
            VStack(alignment: .leading) {
                
               
                
                Text(data.desc)
                    .padding()
                
                Text(data.location)
                    .padding()
                
                HStack(spacing: 20) {
                    
                    // -------- VISITED BUTTON --------
                    Button {
                        data.isVisited.toggle()
                    } label: {
                        Text(visitedLabel)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background(Capsule().fill(visitedColor))
                    }
                    
                    // -------- BOOKMARK BUTTON --------
                    Button {
                        data.isSaved.toggle()
                    } label: {
                        Image(systemName: data.isSaved ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .accessibilityLabel("Save bookmark")
                    
                }
                .padding(20)
                .navigationTitle(data.name)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    DetailedPlacesView(data: sampleData[0])
}
