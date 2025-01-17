//
//  Restraurant.swift
//  Swiggy
//
//  Created by Ankit Yadav on 18/01/25.
//

import Foundation
import SwiftData


@Model
class Restraurant {
    var id: UUID
    var name: String
    var rating: Double
    var viewCount: Int
    var cuisine: [String]
    var location: String
    var distance: Double
    var deliveryTime: Int = 40
    var image: String
    var categories: String
    var speciality: String
    
    init(id: UUID, name: String, rating: Double, viewCount: Int, cuisine: [String], location: String, distance: Double, deliveryTime: Int, image: String, categories: String, speciality: String) {
        self.id = id
        self.name = name
        self.rating = rating
        self.viewCount = viewCount
        self.cuisine = cuisine
        self.location = location
        self.distance = distance
        self.deliveryTime = deliveryTime
        self.image = image
        self.categories = categories
        self.speciality = speciality
    }
}

