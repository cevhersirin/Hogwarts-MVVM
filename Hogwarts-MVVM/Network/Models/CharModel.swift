//
//  CharModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

import Foundation

// MARK: - CharModel
struct CharModel: Codable {
    let id, name: String?
    let alternateNames: [String]?
    let species: Species?
    let gender: Gender?
    let house: House?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: Ancestry?
    let eyeColour, hairColour: String?
    let wand: Wand?
    let patronus: String?
    let hogwartsStudent, hogwartsStaff: Bool?
    let actor: String?
    let alternateActors: [String]?
    let alive: Bool?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case alternateNames = "alternate_names"
        case species, gender, house, dateOfBirth, yearOfBirth, wizard, ancestry, eyeColour, hairColour, wand, patronus, hogwartsStudent, hogwartsStaff, actor
        case alternateActors = "alternate_actors"
        case alive, image
    }
}

enum Ancestry: String, Codable {
    case empty = ""
    case halfBlood = "half-blood"
    case muggleborn = "muggleborn"
    case pureBlood = "pure-blood"
    case squib = "squib"
    case muggle = "muggle"
    case halfVeela = "half-veela"
    case quarterVeela = "quarter-veela"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum House: String, Codable {
    case gryffindor = "Gryffindor"
    case slytherin = "Slytherin"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case none = ""
}

enum Species: String, Codable {
    case ghost = "ghost"
    case halfGiant = "half-giant"
    case human = "human"
    case werewolf = "werewolf"
    case cat = "cat"
    case goblin = "goblin"
    case owl = "owl"
    case poltergeist = "poltergeist"
    case threeHeadedDog = "three-headed dog"
    case dragon = "dragon"
    case centaur
    case houseElf = "house-elf"
    case acromantula, hippogriff, giant, vampire
    case halfHuman = "half-human"
}

// MARK: - Wand
struct Wand: Codable {
    let wood: String?
    let core: Core?
    let length: Double?
}

enum Core: String, Codable {
    case dragonHeartstring = "dragon heartstring"
    case empty = ""
    case phoenixFeather = "phoenix feather"
    case phoenixTailFeather = "phoenix tail feather"
    case unicornTailHair = "unicorn tail hair"
    case unicornHair = "unicorn hair"
}

typealias Char = [CharModel]
