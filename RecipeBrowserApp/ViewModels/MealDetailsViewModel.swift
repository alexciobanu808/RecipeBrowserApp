//
//  MealDetailsViewModel.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/30/22.
//

import Foundation

class MealDetailsViewModel {
    @Published var uiModel: Result<MealDetails, TheMealAPIError>?

    private let api = TheMealAPI()
    
    
    
    func getMealDetails() {
        api.getMealDetails(mealId: "") { [weak self] response in
            self?.uiModel = response
        }
    }
}
