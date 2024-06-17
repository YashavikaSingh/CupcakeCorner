//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Yashavika Singh on 17.06.24.
//

import SwiftUI
struct ContentView: View {
    
    
    @State private var order = Order()


    var body: some View {
       
        
        NavigationStack{
            Form{
                
                Section{
                    Picker( "Select cake type", selection: $order.type)
                    {
                        ForEach(Order.types.indices, id:\.self )
                        {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity , in: 3...20)
                    
                }
                
                
                Section
                {
                    Toggle("Any Special Requests?", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled
                    {
                        Toggle("Add extra frosting?", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles?", isOn: $order.addSprinkles)
                    }
                }
              
                
                Section{
                    NavigationLink ("Delivery Details"){
                        AddressView(order: order )
                    }
                }
                
              
                
                
            }.navigationTitle("Cupcake Selection")
        }
    }
}
 
#Preview {
    ContentView()
}
