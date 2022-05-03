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
        let strMeal: String
        let strMealThumb: String
        let idMeal: String
    }
}
