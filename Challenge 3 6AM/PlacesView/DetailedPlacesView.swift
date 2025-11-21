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
        case .saved:
            return .yellow
        case .visited:
            return .green
        default:
            return .blue
        }
    }
    
    var buttonLabelText: String {
        switch data.status {
        case .saved:
            return "Interested"
        case .visited:
            return "Visited"
        default:
            return "Suggested"
        }
    }
    
    var buttonTextColor: Color {
        switch data.status {
        case .saved:
            return .black
        case .visited:
            return .white
        case .recommended:
            return .white
        }
    }
    
    func cycleStatus() {
        if data.status == .saved {
            data.status = .visited
            data.markerTint = .green
            
        } else if data.status == .visited {
            data.status = .recommended
            data.markerTint = .yellow
            
        } else if data.status == .recommended {
            data.status = .saved
            data.markerTint = .blue
        }
    }
    

    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                
                Text(data.location)
                    .padding(.bottom)
                
                Text(data.desc)
                    .padding(.bottom)

                Button {
                    cycleStatus()
                } label: {
                    Text(buttonLabelText)
                        .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .foregroundColor(buttonTextColor)
                }
                .background(Capsule().fill(buttonColor))
                
            }.navigationTitle(data.name)
                .navigationBarTitleDisplayMode(.inline)
                .padding(20)
        }
    }
}
#Preview {
    DetailedPlacesView(data: sampleData[0])
}
