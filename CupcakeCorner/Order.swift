//
//  Order.swift
//  CupcakeCorner
//
//  Created by Yashavika Singh on 17.06.24.
//

import Foundation


@Observable
class Order{
    
    static let types = ["Strawberry", "Vanilla", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 0
    var specialRequestEnabled = false
    {
        didSet {
            if(specialRequestEnabled == false)
            {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
}
