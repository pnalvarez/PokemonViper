//
//  PokemonListRouter.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class PokemonListRouter {
    
    var navigationController: UINavigationController?
    
    func present(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = PokemonListViewControllerBuilder.make(router: self)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    func presentDetails(_ id: Int) {
        
        guard let navigationController = self.navigationController else { return }
        PokemonDetailsRouter(id: id).present(navigationController: navigationController)
    }
}
