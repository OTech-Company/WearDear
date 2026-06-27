//
//  ProductsDetailsView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ProductsDetailsView: View {
    var body: some View {
        VStack{
            HeaderView()
            HStack{
                ZStack{
                    Image("nike")
                        .resizable()
                        .scaledToFit()
                    
                    Image("shoes")
                        .resizable()
                        .scaledToFit()
                }
                
                ColorView()
            }
            VStack(alignment: .leading){
                Text("$30.99")
                    .bold()
                Text("%10 OFF")
                    .foregroundColor(.red)
            }
            
        }.padding(8)
        
    }
}


