//
//  MealDbApi.swift
//  Network Analysis
//
//  Created by R. Kukuh on 16/11/21.
//

import Foundation

class MealDbApi: ObservableObject {
    @Published var meals = [Meal]()
    
    func loadData(completion: @escaping ([Meal]) -> ()) {
        let mealDbApiURL = "www.themealdb.com/api/json/v1/1/filter.php?a=Japanese"
        
        guard let url = URL(string: mealDbApiURL) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.sessionDescription = "Main Session"
        
        let task = session.dataTask(with: url) { data, response, error in
            let meals = try! JSONDecoder().decode([Meal].self, from: data!)
            
            print(meals)
            
            DispatchQueue.main.async {
                completion(meals)
            }
        }
        
        task.taskDescription = "Get meals filtered by area"
        task.resume()
    }
}
