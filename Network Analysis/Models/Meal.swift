//
//  Meal.swift
//  Network Analysis
//
//  Created by R. Kukuh on 16/11/21.
//

import Foundation

struct Meal: Decodable, Identifiable {
    let id = UUID()
    var strMeal: String
    var strMealThumb: String
}
