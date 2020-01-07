//
//  PokemonDetailsRouter.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation
import UIKit

class PokemonDetailsRouter {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func present(navigationController: UINavigationController) {
        navigationController.pushViewController(PokemonDetailsViewControllerBuilder.make(router: self), animated: true)
    }
}
