//
//  MenuItem.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/14/23.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let description: String
    let image: String
    let price: String
    let category: String
    
}
