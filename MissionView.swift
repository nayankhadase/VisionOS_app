//
//  MissionView.swift
//  MoonShot
//
//  Created by Nayan Khadase on 17/02/22.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Identifiable{
        var id = UUID()
        let role: String
        let astronaut: Astronaut
    }
    
    var mission: Mission
    var crew: [CrewMember] = [CrewMember]()
    
    init(mission: Mission, astronsauts: [Astronaut]){
        self.mission = mission
        for member in mission.crew{
            for astronaut in astronsauts {
                if member.name == astronaut.id{
                    self.crew.append(CrewMember(role: member.role, astronaut: astronaut))
                }
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.height * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Mission Highlights")
                            .font(.extraLargeTitle.bold())
                            .padding(.bottom)
                        
                        Text(mission.description)
                            .font(.largeTitle)
                    }
                    .padding(.horizontal)
                }
                HStack{
                    VStack(alignment:.leading){
                        
                        Text("Crew Members")
                            .font(.extraLargeTitle.bold())
                            .padding([.top,.leading])
                        
                        ScrollView(.horizontal){
                            LazyHGrid(rows: [GridItem(.fixed(120))]) {
                                
                                ForEach(crew){ member in
                                    NavigationLink {
                                        AstronautDetailsView(astronaut: member.astronaut)
                                    } label: {
                                        HStack(spacing: 10){
                                            Image(member.astronaut.id)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 120)
                                                .clipShape(Capsule())
                                                .overlay(
                                                    Capsule()
                                                        .stroke(.white, lineWidth: 2)
                                                )
                                            VStack(alignment: .leading,spacing: 10){
                                                Text(member.astronaut.name)
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                                Text(member.role)
                                                    .foregroundColor(.secondary)
                                                    .font(.title)
                                            }
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                
            }
            .padding(.bottom)
            .padding()
        }
    }
}
//#Preview {
//    MissionView()
//}
