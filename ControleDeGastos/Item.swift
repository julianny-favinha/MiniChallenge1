//
//  Item.swift
//  ControleDeGastos
//
//  Created by Julianny Favinha on 3/29/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import Foundation

class Item {
    public var type:String
    public var value:Double
    public var category:String
    public var description:String
    public var payment:String
    public var date:String
    public var replay:String
    public var when:String
    public var replayNumber:Int
    
    init(type:String, value:Double, category:String, description: String, payment: String, date: String, replay: String, when: String, replayNumber: Int) {
        self.type = type
        self.value = value
        self.category = category
        self.description = description
        self.payment = payment
        self.date = date
        self.replay = replay
        self.when = when
        self.replayNumber = replayNumber
    }
}
