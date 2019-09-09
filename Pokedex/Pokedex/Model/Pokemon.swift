//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mitchell Budge on 9/7/19.
//  Copyright © 2019 Donovan Langager. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Sprite
    let abilities: [Ability]
    let types: [Type]
}
struct Sprite: Decodable {
    let frontDefault: URL
}
struct Ability: Decodable {
    let ability: SubAbility
    
    struct SubAbility: Decodable {
        let name: String
    }
}
struct Type: Decodable {
    let type: SubType
    
    struct SubType: Decodable{
        let name: String
    }
}
