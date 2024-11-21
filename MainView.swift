//
//  MainView.swift
//  visionTest
//
//  Created by Nayan Khadase on 27/06/23.
//

import SwiftUI

struct MainView: View {
    @State private var path = NavigationPath()
    
    // to call another window
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack{
                Image("earth1")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Spacer()
                    Spacer()
                    Text("Welcome to MoonShot")
                        .font(.extraLargeTitle)
                    Spacer()
                    
                    HStack{
                        NavigationLink(value: "AllMissionsView") {
                            Text("View all")
                        }
                        Button(action: {
                            openWindow(id: "planet-moon")
                        }, label: {
                            Text("Open 3D model")
                        })
                    }
                    Spacer()
                }
            }
            .navigationDestination(for: String.self) { str in
                AllMissionsView()
            }
        }
    }
}

#Preview {
    MainView()
}
