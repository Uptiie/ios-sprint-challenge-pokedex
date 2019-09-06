//
//  PokemonDetailViewController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard isViewLoaded,
            let pokemon = pokemon else { return }
        pokemonNameLabel.text = pokemon.name
        idLabel.text = "\(pokemon.id)"
        abilitiesLabel.text = pokemon.abilities
        typeLabel.text = pokemon.type
        guard let imageData = try? Data(contentsOf: pokemon.)
        
    }
 
}
