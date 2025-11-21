//
//  LegendSheetView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 15/11/25.
//

import SwiftUI

struct LegendSheetView: View {
    @Binding var showingLegendSheetView: Bool
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text("‼️important‼️")
                .font(.title)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Click on the map pins to see more information!")
                .padding()
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("The pins highlighted in blue are suggested places")
                .foregroundStyle(Color.blue)
                .padding()
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("The pins highlighted in yellow are places that you have indicated interest in")
                .foregroundStyle(Color.yellow)
                .padding()
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        
        Spacer()
        Button("Dismiss"){
            showingLegendSheetView = false
        }.buttonStyle(.glass)
        .background(Capsule().fill(Color.blue.opacity(0.4)))
    }
}

#Preview {
    LegendSheetView(showingLegendSheetView: .constant(true))
}
