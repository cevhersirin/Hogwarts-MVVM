//
//  WandModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

struct WandModel: Decodable {
    var wood: String?
    var core: String?
    var length: Double?
    
    enum CodingKeys: CodingKey {
        case wood
        case core
        case length
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wood = try container.decodeIfPresent(String.self, forKey: .wood)
        self.core = try container.decodeIfPresent(String.self, forKey: .core)
        self.length = try container.decodeIfPresent(Double.self, forKey: .length)
    }
}
