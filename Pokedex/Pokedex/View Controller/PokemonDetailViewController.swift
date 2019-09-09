//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Uptiie on 9/7/19.
//  Copyright © 2019 Donovan Langager. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemonController: PokemonController?
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
        
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        guard let pokemon = pokemon else { return }
        title = pokemon.name.capitalized + " " + "ID: \(pokemon.id)"
        guard let pokemonImageData = try? Data(contentsOf: pokemon.sprites.frontDefault) else { return }
        imageView.image = UIImage(data: pokemonImageData)
        nameLabel.isHidden = false
        nameLabel.text = pokemon.name.capitalized
        IDLabel.text = "\(pokemon.id)"
        abilitiesLabel.text = "\(pokemon.abilities)"
        typeLabel.text = "\(pokemon.types)"
    }

}
