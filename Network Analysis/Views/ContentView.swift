//
//  ContentView.swift
//  Network Analysis
//
//  Created by R. Kukuh on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var food = Food(image: "")
    
    var body: some View {
        Text("Network analysis")
            .onAppear() {
                FoodishApi().getData { (food) in
                    self.food = food
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
