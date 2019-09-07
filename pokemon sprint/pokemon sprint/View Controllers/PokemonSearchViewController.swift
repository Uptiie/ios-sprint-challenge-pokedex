//
//  SearchViewController.swift
//  pokemon sprint
//
//  Created by Uptiie on 9/6/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var pokemonSearch: UISearchBar!
    @IBAction func saveButton(_ sender: Any) {
    }

}
