//
//  APIController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import Foundation

class PokemonController {
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    func getPokemon(searchTerm: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        let requestURL = baseURL.appendingPathComponent(searchTerm.lowercased())
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("Error getting Pokemon: \(error)")
                completion(.failure(error))
                return
            }
            guard let pokemonData = jsonData else {
                print("Error retreiving data from data task")
                completion(.failure(NSError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: pokemonData)
                print(pokemon)
                completion(.success(pokemon))
            } catch {
                print("Error decoding data to type Pokemon: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
