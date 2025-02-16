//
//  PokemonController.swift
//  Pokedex
//
//  Created by Mitchell Budge on 9/7/19.
//  Copyright © 2019 Donovan Langager. All rights reserved.
//

import Foundation

class PokemonController {
    
    var pokemonTeam: [Pokemon] = []
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    func getPokemon(searchTerm: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        let requestURL = baseURL.appendingPathComponent(searchTerm.lowercased())
        
        URLSession.shared.dataTask(with: requestURL) { (jsonData, _, error) in
            if let error = error {
                print("Error getting pokemon: \(error)")
                completion(.failure(error))
                return
            }
            guard let pokemonData = jsonData else {
                print("Error retrieving data from data task")
                completion(.failure(NSError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try decoder.decode(Pokemon.self, from: pokemonData)
                print(pokemon)
                completion(.success(pokemon))
            } catch {
                print("Error decoding data to type Pokemon: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    func addPokemon(pokemon: Pokemon) {
        pokemonTeam.append(pokemon)
    }
    
}
