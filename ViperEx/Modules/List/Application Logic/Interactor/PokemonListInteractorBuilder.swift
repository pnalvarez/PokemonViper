//
//  PokemonListInteractorBuilder.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

class PokemonListInteractorBuilder {
    
    static func make(manager: PokemonListManagerInput) -> PokemonListInteractor{
        
        return PokemonListInteractor(manager: manager)
    }
}
