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
        guard isViewLoaded,
            let pokemon = pokemon else { return }
        nameLabel.text = pokemon.name
        IDLabel.text = "\(pokemon.id)"
        typeLabel.text = "\(pokemon.types)"
        abilitiesLabel.text = "\(pokemon.abilities)"
        imageView.image = UIImage(data: pokemon.sprites.frontDefault)
    }

}
