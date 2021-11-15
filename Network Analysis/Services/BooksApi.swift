//
//  BooksApi.swift
//  Network Analysis
//
//  Created by R. Kukuh on 15/11/21.
//

import Foundation

class BooksApi: ObservableObject {
    @Published var books = [Book]()
    
    func loadData(completion:@escaping ([Book]) -> ()) {
        let booksApiURL = "https://training.xcelvations.com/data/books.json"
        
        guard let url = URL(string: booksApiURL) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.sessionDescription = "Main Session"
        
        let task = session.dataTask(with: url) { data, response, error in
            let books = try! JSONDecoder().decode([Book].self, from: data!)
            
            DispatchQueue.main.async {
                completion(books)
            }
        }
        
        task.taskDescription = "Get books data"
        task.resume()
    }
}
