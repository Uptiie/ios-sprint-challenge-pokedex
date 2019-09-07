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
    
    let abilities: [Ability]
    
    struct Ability {
        let subAbility: SubAbility
        
        struct SubAbility {
            let name: String
        }
    }
    
    let sprites: Sprite {
        struct Sprite {
            front_default: String
        }
    }
    
    let types: String
}
