//
//  Mission.swift
//  MoonShot
//
//  Created by Nayan Khadase on 17/02/22.
//

import Foundation
import SwiftUI
struct Mission: Codable, Identifiable, Hashable{
    struct Crew: Codable, Hashable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedLaunchedDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    
}

