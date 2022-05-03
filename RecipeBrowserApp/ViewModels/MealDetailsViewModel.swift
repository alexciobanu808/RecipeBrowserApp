//
//  MealDetailsViewModel.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/30/22.
//

import Foundation

class MealDetailsViewModel {
    @Published var uiModel: Result<MealDetailsResponse, TheMealAPIError>?
    
    private let mealID: String
    let mealPictureURL: String
    
    private let api = TheMealAPI()
    
    var mealDetails: MealDetailsResponse.MealDetails? {
        switch uiModel {
        case .success(let mealDetailsResponse): return mealDetailsResponse.meals.first
        case.failure, .none: return nil
        }
    }
    
    var ingredientsAndMeasurementsString: String {
        guard let details = mealDetails else { return "" }
        
        return details.ingredientsAndMeasurements.map { item in
            "\(item.ingredient) - \(item.measurement)\n"
        }.joined()
    }
    
    init(mealID: String, mealPictureURL: String) {
        self.mealID = mealID
        self.mealPictureURL = mealPictureURL
    }
    
    
    
    func getMealDetails() {
        api.getMealDetails(mealId: mealID) { [weak self] response in
            self?.uiModel = response
        }
    }
}
