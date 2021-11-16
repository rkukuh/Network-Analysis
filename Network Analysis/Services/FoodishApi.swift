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
        let urlString = "https://foodish-api.herokuapp.com/api/"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let food = try JSONDecoder().decode(Food.self, from: data)
                    
                    print(food.image)
                    
                    DispatchQueue.main.async {
                        completion(food)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
