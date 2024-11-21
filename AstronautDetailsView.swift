//
//  AstronautDetailsView.swift
//  MoonShot
//
//  Created by Nayan Khadase on 22/02/22.
//

import SwiftUI

struct AstronautDetailsView: View {
    var astronaut: Astronaut
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .leading){
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.height * 0.7)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: geometry.size.width)
                    
                    Text(astronaut.name)
                        .foregroundColor(.white)
                        .font(.extraLargeTitle.bold())
                        .frame(width: geometry.size.width)
                        
                    
                    Text("Description")
                        .font(.largeTitle)
                        .padding(.top)
                        .padding(.bottom,5)
                    
                    Text(astronaut.description)
                        .font(.title)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }
}

//#Preview {
//    AstronautDetailsView()
//}
