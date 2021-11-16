//
//  ContentView.swift
//  Network Analysis
//
//  Created by R. Kukuh on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var meals = [Meal]()
        
        var body: some View {
            List(meals) { meal in
                Text("\(meal.strMeal)")
            }
            .onAppear() {
                MealDbApi().loadData { (meals) in
                    self.meals = meals
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
