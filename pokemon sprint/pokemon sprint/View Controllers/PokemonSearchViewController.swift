//
//  SearchViewController.swift
//  pokemon sprint
//
//  Created by Uptiie on 9/6/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let pokemonController = PokemonController()
    var pokemon: Pokemon? {
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        pokemonController.getPokemon(searchTerm: searchTerm) (pokemon) in
        guard let pokemon = try pokemon.get() else { return }
        DispatchQueue.main.async {
            self.pokemon = searchedPokemon
        }
    }
    func updateViews() {
        guard isViewLoaded else { return }
        guard let pokemonImageData = try? Data(contentsOf: pokemon?.sprites.frontDefault) else { return }
        imageView.image = UIImage(data: pokemonImageData)
        
        }
        
    }
    @IBAction func saveButton(_ sender: Any) {
    }

}
