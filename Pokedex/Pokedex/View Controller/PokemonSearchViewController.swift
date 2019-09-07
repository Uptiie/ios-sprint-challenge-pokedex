//
//  PokemonSearchViewController.swift
//  Pokedex
//
//  Created by Mitchell Budge on 9/7/19.
//  Copyright © 2019 Donovan Langager. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameLabek: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonAbilities: UILabel!
    
    var pokemonController: PokemonController?
    var pokemon: Pokemon? {
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        hideViews()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        pokemonController?.getPokemon(searchTerm: searchTerm) { (pokemon) in
            guard let searchedPokemon = try? pokemon.get() else { return }
            DispatchQueue.main.async {
                self.pokemon = searchedPokemon
            }
        }
    }
    
    func hideViews() {
        saveButton.isEnabled = false
        nameLabek.isHidden = true
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        guard let pokemon = pokemon else { return }
        saveButton.isEnabled = true
        title = pokemon.name.capitalized + " " + "ID: \(pokemon.id)"
        guard let pokemonImageData = try? Data(contentsOf: pokemon.sprites.frontDefault) else { return }
        imageView.image = UIImage(data: pokemonImageData)
        nameLabek.isHidden = false
        nameLabek.text = pokemon.name.capitalized
        pokemonID.text = "\(pokemon.id)"
        pokemonType.text = "\(pokemon.abilities)"
        pokemonType.text = "\(pokemon.types)"
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let pokemonToBeSaved = pokemon else { return }
        pokemonController?.addPokemon(pokemon: pokemonToBeSaved)
        navigationController?.popToRootViewController(animated: true)
    }
}
