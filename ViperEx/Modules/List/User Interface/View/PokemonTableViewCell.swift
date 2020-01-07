//
//  PokemonTableViewCell.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var display: PokemonListItemViewModel?
    
    func setUp() {
        guard let display = self.display else { return }
        
        idLabel.text = "\(display.id)"
        pokemonNameLabel.text = display.name
    }
    
}
