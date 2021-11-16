//
//  FoodishApi.swift
//  Network Analysis
//
//  Created by R. Kukuh on 16/11/21.
//

import Foundation

class FoodishApi: ObservableObject {
    @Published var food = Food(image: "")
    
    func getData(completion: @escaping (Food) -> ()) {
        let urlString = "https://foodish-api.herokuapp.com/api/images/burger"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.sessionDescription = "Main Session"
        
        let task = session.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let food = try JSONDecoder().decode(Food.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(food)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.taskDescription = "Get burger image"
        task.resume()
    }
}
