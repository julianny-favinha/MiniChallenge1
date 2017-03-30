//
//  Item.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/29/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import Foundation

class Item {
    public var name:String
    public var value:Double
    public var date:String
    
    init(name:String, date:String, value:Double) {
        self.name = name
        self.value = value
        self.date = date
    }
}
