//
//  PokemonListPresenterBuilder.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

class PokemonListPresenterBuilder {
    
    static func make(interactor: PokemonListInteractorInput, router: PokemonListRouter) -> PokemonListPresenter{
        let presenter = PokemonListPresenter(interactor: interactor, router: router)
        
        return presenter
    }
}
