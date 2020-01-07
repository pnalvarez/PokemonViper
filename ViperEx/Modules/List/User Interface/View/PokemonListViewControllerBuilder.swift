//
//  PokemonListViewControllerBuilder.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

class PokemonListViewControllerBuilder {
    
    static func make(router: PokemonListRouter) -> PokemonListViewController {
        let viewController = PokemonListViewController(nibName: String(describing: PokemonListViewController.self), bundle: nil)
        
        let manager = PokemonListManager()
        let interactor = PokemonListInteractorBuilder.make(manager: manager)
        let presenter = PokemonListPresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
