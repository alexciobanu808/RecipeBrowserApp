//
//  DessertMealsViewModel.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/29/22.
//

import Foundation

class DessertMealsViewModel {
    @Published var uiModel: Result<[String], TheMealAPIError>?
    
    private let api = TheMealAPI()
    
    var desertNames: [String] {
        switch uiModel {
        case .success(let names): return names
        case .failure, .none: return []
        }
    }
    
    func fetchDessetMeals() {
        api.getDessertMeals { [weak self] response in
            self?.uiModel = response.map { $0.meals.map(\.name).sorted() }
        }
    }
}
