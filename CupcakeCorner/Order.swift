//
//  Order.swift
//  CupcakeCorner
//
//  Created by Yashavika Singh on 17.06.24.
//

import Foundation


@Observable
class Order{
    
    static let types = ["Vanilla","Strawberry",  "Chocolate", "Rainbow"]
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
    
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress : Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {return false}
          return true
    }
    
    
    var cost: Decimal{
        // 2 dollars per cake
        var cost = Decimal(quantity)*2
        // extra for fancier cake
        cost += Decimal(type)/2
        // 
         if(extraFrosting)
            { cost += Decimal(quantity) }
        
        
        if(extraFrosting)
           { cost += Decimal(quantity)/2  }
        
        return cost
        
    }
    
    
    
}
