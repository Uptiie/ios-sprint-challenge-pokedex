//
//  PokemonTableViewController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    // MARK: Properties
    
    private var pokemonNames: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let apiController = PokemonController()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = pokemonNames[indexPath.row]

        return cell
    }
    
    //MARK: - Actions
    @IBAction func getPokemon(_ sender: UIBarButtonItem) {
        apiController.fetchAllPokemonNames { result in
            if let names = try? result.get() {
                DispatchQueue.main.async {
                    self.pokemonNames = names
                }
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPokemonDetailSegue",
            let detailVC = segue.destination as? PokemonDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.pokemonName = pokemonNames[indexPath.row]
            }
            detailVC.apiController = apiController
        }
    }

}
