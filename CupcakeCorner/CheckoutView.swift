//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Yashavika Singh on 17.06.24.
//

import SwiftUI

struct CheckoutView: View {
    
    @State private var showingConfirmation = false
    @State private var confirmationMessage = ""
    var order = Order()
    var body: some View {
        ScrollView
        {
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){
                    image in image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233 )
                
                
                Text("Your total cost is: \(order.cost, format: .currency(code: "USD"))")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                
                Button("Place Order "){
                    Task {
                        await placeOrder()
                    }
                }.padding()
                
            }
            
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you", isPresented: $showingConfirmation){ Button("OK"){}
        } message:
        {
            Text(confirmationMessage)
        }
        
    }
    
    func placeOrder() async{
        
        guard let encoded = try? JSONEncoder().encode(order)else
        {
            print("Failed to encode ")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way"
            showingConfirmation = true
        }
        catch{
            print("check out failed: \(error.localizedDescription)")
        }
        
        
    }
    }

#Preview {
    CheckoutView(order: Order() )
}

