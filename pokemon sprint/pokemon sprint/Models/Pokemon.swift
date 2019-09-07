//
//  Pokemon.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import Foundation

struct PokemonResult: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Sprite
    let abilities: [Ability]
    
    struct Ability: Decodable {
        let subAbility: SubAbility
        
        struct SubAbility {
            let name: String
        }
    }
    struct Sprite: Decodable {
        let frontDefault: URL
    }
    
    let types: String
}
