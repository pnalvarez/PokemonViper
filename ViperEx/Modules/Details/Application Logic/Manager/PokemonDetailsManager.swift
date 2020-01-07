//
//  PokemonDetailsManager.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

protocol PokemonDetailsManagerInput {
    func getPokemonDetails(id: String, completion: @escaping ((PokemonDetailsAPIModel) -> ()))
}

class PokemonDetailsManager: PokemonDetailsManagerInput {
    
    var object: PokemonDetailsAPIModel?
    
    func getPokemonDetails(id: String, completion: @escaping ((PokemonDetailsAPIModel) -> ())) {
        PokemonAPI.shared.getPokemon(id: id) {
            pokemon in
            
            self.object = pokemon
            guard let object = self.object else { return }
            completion(object)
        }
    }
}
