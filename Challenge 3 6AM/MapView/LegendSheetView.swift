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
                    .padding()
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("The pins highlighted in \(Text("blue").foregroundStyle(Color.blue)) are suggested places")
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom)
                
                Text("The pins highlighted in \(Text("yellow").foregroundStyle(Color.yellow)) are places that you have indicated interest in")
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
