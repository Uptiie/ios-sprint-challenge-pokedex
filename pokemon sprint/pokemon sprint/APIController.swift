//
//  APIController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import Foundation

class APIController {
    
    var pokemon: [Pokemon] = []
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/evolution-chain/1/")!
    typealias CompletionHandler = (Error?) -> Void
    
    func getPokemon(completion: @escaping CompletionHandler = { _ in }) {
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                NSLog("Error retrieving Pokemon: \(error)")
            }
            guard let data = data else {
                NSLog("No data from data task.")
                completion(nil)
                return
            }
            do {
                let newPokemon = try JSONDecoder().decode(PokemonResult.self, from: data)
                print(newPokemon)
                self.pokemon = newPokemon.results
            } catch {
                NSLog("Error decoding Pokemon: \(error)")
                completion(error)
            }
            completion(nil)
        }.resume()
    }
}
