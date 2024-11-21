//
//  AllMissionsView.swift
//  visionTest
//
//  Created by Nayan Khadase on 27/06/23.
//

import SwiftUI

struct AllMissionsView: View {
    var astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    var missions: [Mission] = Bundle.main.decode("missions")
    
    let columns = [GridItem(.adaptive(minimum: 200), spacing: 50)]
    
    var body: some View {
            VStack{
                ScrollView{
                    Text("All missions")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach(missions) { mission in
                            NavigationLink(value: mission) {
                                VStack{
                                    
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130, height: 130)
                                        .padding(5)
                                    
                                    VStack{
                                        Text(mission.displayName)
                                            .font(.title)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.formattedLaunchedDate)
                                            .font(.headline)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                    
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        .padding()
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronsauts: astronauts)
        }
    }
}

#Preview {
    AllMissionsView()
}
