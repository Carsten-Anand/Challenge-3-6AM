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
            NavigationStack{
                HStack{
                    Text("")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("‼️important‼️")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .toolbar{
                            ToolbarItem(placement: .confirmationAction){
                                Button(action: {
                                    showingLegendSheetView = false
                                }){
                                    Image(systemName: "xmark.circle")
                                }
                            }
                        }
                }
                
                Text("Click on the map pins to see more information!")
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("The pins highlighted in blue are suggested places")
                    .foregroundStyle(Color.blue)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("The pins highlighted in yellow are places that you have indicated interest in")
                    .foregroundStyle(Color(red: 0.9, green: 0.85, blue: 0.01))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
           
           
            
            
        }
       
    }
}

#Preview {
    LegendSheetView(showingLegendSheetView: .constant(true))
}
