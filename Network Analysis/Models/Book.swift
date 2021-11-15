//
//  Book.swift
//  Network Analysis
//
//  Created by R. Kukuh on 15/11/21.
//

import Foundation

struct Book: Codable, Identifiable {
    let id = UUID()
    var author: String
    var email: String
    var title: String
}
