//
//  Bundel-Decoder.swift
//  MoonShot
//
//  Created by Nayan Khadase on 17/02/22.
//

import Foundation

// <T: Codable>  (generic)  it means we dont know the exact type of data at can be anything. but it confirm to Codable protocol

extension Bundle{
    
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: "json")else{
            fatalError("can't find file with name: \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("cant get data for file \(file)")
        }
        let decoder = JSONDecoder()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormater)
        
        guard let safeData = try? decoder.decode(T.self, from: data) else{
            fatalError("cant decode data for file \(file)")
        }
        return safeData
        
    }
}
