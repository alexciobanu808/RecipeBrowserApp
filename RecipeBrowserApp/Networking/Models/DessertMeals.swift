//
//  DessertMeals.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/29/22.
//

import Foundation

struct DessertMeals: Decodable {
    let meals: [MealDetails]
    
    struct MealDetails: Decodable {
        let name: String
        let thumbnail: String
        let id: String
        
        enum CodingKeys: String, CodingKey {
            case name = "strMeal"
            case thumbnail = "strMealThumb"
            case id = "idMeal"
        }
    }
}
