//
//  ContentView.swift
//  Network Analysis
//
//  Created by R. Kukuh on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var books = [Book]()
    
    var body: some View {
        List(books) { book in
            Text("\(book.title)")
        }
        .onAppear() {
            BooksApi().loadData { (books) in
                self.books = books
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
