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
    let abilities: String
    let type: String
    let id: Int
    
}
