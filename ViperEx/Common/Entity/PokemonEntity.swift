//
//  PokemonEntity.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

struct PokemonEntity {
    
    var name = ""
    var pokemonURL = ""
    var id: Int = 0
    
    init(name: String, pokemonURL: String){
        self.name = name
        self.pokemonURL=pokemonURL
        self.id = Int(pokemonURL.split(separator: "/", maxSplits: 10, omittingEmptySubsequences: true)[5])!
    }
}
