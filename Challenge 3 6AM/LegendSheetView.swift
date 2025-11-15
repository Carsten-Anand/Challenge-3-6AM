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
            Text("‼️important‼️")
                .font(.title)
            
            Text("Click on the map pins to see more information!")
                .padding()
            
            Text("The pins highlighted in blue are suggested places")
                .foregroundStyle(Color.blue)
                .padding()
            
            Text("The pins highlighted in yellow are places that you have indicated interest in")
                .foregroundStyle(Color.yellow)
                .padding()
        }
        
        Spacer()
        Button("Dismiss"){
            showingLegendSheetView = false
        }
    }
}

//#Preview {
//    LegendSheetView()
//}
