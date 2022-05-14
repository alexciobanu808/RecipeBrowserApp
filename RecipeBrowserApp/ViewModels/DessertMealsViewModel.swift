//
//  DessertMealsViewModel.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/29/22.
//

import Foundation

class DessertMealsViewModel {
    @Published var uiModel: Result<[DessertMeals.MealDetails], TheMealAPIError>?
    @Published var isLoading = false
    
    private let api = TheMealAPI()
    
    var meals: [DessertMeals.MealDetails] {
        switch uiModel {
        case .success(let meals): return meals
        case .failure, .none: return []
        }
    }
    
    func fetchDessetMeals() {
        isLoading = true
        api.getDessertMeals { [weak self] response in
            self?.uiModel = response.map { $0.meals }
            self?.isLoading = false
        }
    }
}
