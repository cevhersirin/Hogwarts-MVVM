//
//  ListItemCellViewModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

class ListItemCellViewModel {
    
    var id: String?
    var name: String?
    var imageUrl: String?
    var isAlive: Bool?
    
    init(id: String? = nil, name: String? = nil, imageUrl: String? = nil, isAlive: Bool? = nil) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.isAlive = isAlive
    }
}
