//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI


struct MorePlacesView: View {
    var location:String
    
    var body: some View {
        VStack(){
        }
        .navigationTitle(location)
    }
}

#Preview {
    NavigationStack{
        MorePlacesView(location:"@solaris")
    }
}
