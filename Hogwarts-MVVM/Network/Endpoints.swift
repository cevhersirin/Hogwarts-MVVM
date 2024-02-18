//
//  Endpoints.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

/*
 https://hp-api.onrender.com
*/
class Endpoints {
    
    static let shared = Endpoints()
    
    let allCharactersUrl = "https://hp-api.onrender.com/api/characters"
    
    func getDetailUrl(id: String) -> String {
        return "https://hp-api.onrender.com/api/character/\(id)"
    }
    
    func charactersByHouseUrl(house: String) -> String {
        return "https://hp-api.onrender.com/api/characters/house/\(house)"
    }
}
