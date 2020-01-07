//
//  PokemonAPIModel.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation
import ObjectMapper

class PokemonAPIModel: Mappable {
    
    var name: String = ""
    var url: String = ""

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}
