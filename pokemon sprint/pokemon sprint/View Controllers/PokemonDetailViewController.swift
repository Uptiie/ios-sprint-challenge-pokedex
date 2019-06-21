//
//  PokemonDetailViewController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemonName: String?
    var apiController: APIController?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
    }
    
    func getDetails() {
        guard let apiController = apiController,
            let pokemonName = pokemonName else { return }
        
        apiController.fetchDetails(for: pokemonName) { result in
            if let pokemon = try? result.get() {
                DispatchQueue.main.async {
                    self.updateViews(with: pokemon)
                }
                // fetch image for animal
                apiController.fetchImage(at: pokemon.imageURL, completon: { result in
                    if let image = try? result.get() {
                        DispatchQueue.main.async {
                            self.pokemonImageView.image = image
                        }
                    }
                }
            )}
        }
    
        func updateViews(with pokemon: Pokemon) {
            title = pokemon.name
            idLabel.text = pokemon.id
            abilityLabel.text = pokemon.ability
            typeLabel.text = pokemon.type
            
        }
    }
}
