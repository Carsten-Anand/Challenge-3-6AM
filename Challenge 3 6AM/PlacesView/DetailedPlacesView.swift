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
    
    var buttonColor: Color {
        switch data.status {
        case .visited:
            return .green
        default:
            return .blue
        }
    }
    
    
    
    var buttonLabelText: String {
        switch data.status {
        case .visited:
            return "Visited"
        default:
            return "Suggested"
        }
    }

    func cycleVisited() {
        if data.status == .visited {
            data.status = .recommended
            data.markerTint = .green
            
        } else if data.status == .recommended {
            data.status = .visited
            data.markerTint = .blue
        }
    }
    func cycleBookmark() {
        if data.status == .saved {
            data.status = .recommended
            data.markerTint = .blue
            
        } else if data.status == .recommended {
            data.status = .saved
            data.markerTint = .yellow
        }
        
    }
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                
                Text(data.location)
                    .padding(.bottom)
                
                Text(data.desc)
                    .padding(.bottom)
                
                HStack {
                    
                    Button {
                        cycleVisited()
                    } label: {
                        Text(buttonLabelText)
                            .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .foregroundColor(.white)
                    }
                    .background(Capsule().fill(buttonColor))
//---------------|| bookmark ||------------------//
                    
                    Button {
                        cycleBookmark()
                    } label: {
                        Image(systemName: data.status == .saved ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                        
                            .accessibilityLabel("Mark as saved")
                    }

//
                }.navigationTitle(data.name)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(20)
            }
            
        }
    }
}
#Preview {
    DetailedPlacesView(data: sampleData[0])
}
