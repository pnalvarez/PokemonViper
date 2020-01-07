//
//  PokemonListManager.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

protocol PokemonListManagerInput {
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ())
}

class PokemonListManager: PokemonListManagerInput {
    
    var objects: [PokemonAPIModel] = []
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        PokemonAPI.shared.getPokemons {
            objects in
            
            self.objects = objects
            completion(self.objects)
        }
    }
}
