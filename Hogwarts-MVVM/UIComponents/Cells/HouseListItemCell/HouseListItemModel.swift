//
//  HouseListItemModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 19.02.2024.
//

class HouseListItemModel {
    
    var name: String?
    var house: House?
    
    init(name: String? = nil, house: House? = nil) {
        self.name = name
        self.house = house
    }
}
