//
//  PokemonDetailsEntity.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation

struct PokemonDetailsEntity {
    
    var name: String = ""
    var order: Int = 0
    var id: Int = 0
    var weight: Int = 0
    var height: Int = 0
    var baseExperience: Int = 0
    var image: String = ""
    var types: [String] = []
    var mainMove: String = ""
}
