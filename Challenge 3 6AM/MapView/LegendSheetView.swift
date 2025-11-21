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
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("‼️Important‼️")
                    .font(.title)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingLegendSheetView = false
                    } label: {
                        Image(systemName: "x.circle.fill")
                    }
                    .buttonStyle(.glass)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    LegendSheetView(showingLegendSheetView: .constant(true))
}
