//
//  ChartacterModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

struct ChartacterModel: Decodable {
    
    var id: String?
    var name: String?
    var alternateNames: [String]?
    var species: String?
    var gender: String?
    var house: String?
    var dateOfBirth: String?
    var yearOfBirth: Int?
    var isWizard: Bool?
    var ancestry: String?
    var eyeColour: String?
    var hairColour: String?
    var wand: WandModel?
    var patronus: String?
    var isHogwartsStudent: Bool?
    var isHogwartsStaff: Bool?
    var actor: String?
    var alternateActors: [String]?
    var isAlive: Bool?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case alternateNames = "alternate_names"
        case species = "species"
        case gender = "gender"
        case house = "house"
        case dateOfBirth = "dateOfBirth"
        case yearOfBirth = "yearOfBirth"
        case isWizard = "wizard"
        case ancestry = "ancestry"
        case eyeColour = "eyeColour"
        case hairColour = "hairColour"
        case wand = "wand"
        case patronus = "patronus"
        case isHogwartsStudent = "hogwartsStudent"
        case isHogwartsStaff = "hogwartsStaff"
        case actor = "actor"
        case alternateActors = "alternate_actors"
        case isAlive = "alive"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ChartacterModel.CodingKeys> = try decoder.container(keyedBy: ChartacterModel.CodingKeys.self)
        
        self.id = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.id)
        self.name = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.name)
        self.alternateNames = try container.decodeIfPresent([String].self, forKey: ChartacterModel.CodingKeys.alternateNames)
        self.species = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.species)
        self.gender = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.gender)
        self.house = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.house)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.dateOfBirth)
        self.yearOfBirth = try container.decodeIfPresent(Int.self, forKey: ChartacterModel.CodingKeys.yearOfBirth)
        self.isWizard = try container.decodeIfPresent(Bool.self, forKey: ChartacterModel.CodingKeys.isWizard)
        self.ancestry = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.ancestry)
        self.eyeColour = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.eyeColour)
        self.hairColour = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.hairColour)
        self.wand = try container.decodeIfPresent(WandModel.self, forKey: ChartacterModel.CodingKeys.wand)
        self.patronus = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.patronus)
        self.isHogwartsStudent = try container.decodeIfPresent(Bool.self, forKey: ChartacterModel.CodingKeys.isHogwartsStudent)
        self.isHogwartsStaff = try container.decodeIfPresent(Bool.self, forKey: ChartacterModel.CodingKeys.isHogwartsStaff)
        self.actor = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.actor)
        self.alternateActors = try container.decodeIfPresent([String].self, forKey: ChartacterModel.CodingKeys.alternateActors)
        self.isAlive = try container.decodeIfPresent(Bool.self, forKey: ChartacterModel.CodingKeys.isAlive)
        self.image = try container.decodeIfPresent(String.self, forKey: ChartacterModel.CodingKeys.image)
    }
}


