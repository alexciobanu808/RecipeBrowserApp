//
//  MealDetailsResponse.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/30/22.
//

import Foundation

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
    
    struct MealDetails: Decodable {
        let strMeal: String
        let strInstructions: String
        let ingredientsAndMeasurements: [(ingredient: String, measurement: String)]
    }
}

extension MealDetailsResponse.MealDetails {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        var ingredientsAndMeasurements = [(String, String)]()
        
        if let strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1),
           let strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1),
           !strIngredient1.isEmpty && !strMeasure1.isEmpty {
            ingredientsAndMeasurements.append((strIngredient1, strMeasure1))
        }
        if let strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2),
           let strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2),
           !strIngredient2.isEmpty && !strMeasure2.isEmpty {
            ingredientsAndMeasurements.append((strIngredient2, strMeasure2))
        }
        if let strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3),
           let strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3),
           !strIngredient3.isEmpty && !strMeasure3.isEmpty {
            ingredientsAndMeasurements.append((strIngredient3, strMeasure3))
        }
        if let strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4),
           let strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4),
           !strIngredient4.isEmpty && !strMeasure4.isEmpty {
            ingredientsAndMeasurements.append((strIngredient4, strMeasure4))
        }
        if let strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5),
           let strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5),
           !strIngredient5.isEmpty && !strMeasure5.isEmpty {
            ingredientsAndMeasurements.append((strIngredient5, strMeasure5))
        }
        if let strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6),
           let strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6),
           !strIngredient6.isEmpty && !strMeasure6.isEmpty {
            ingredientsAndMeasurements.append((strIngredient6, strMeasure6))
        }
        if let strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7),
           let strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7),
           !strIngredient7.isEmpty && !strMeasure7.isEmpty {
            ingredientsAndMeasurements.append((strIngredient7, strMeasure7))
        }
        if let strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8),
           let strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8),
           !strIngredient8.isEmpty && !strMeasure8.isEmpty {
            ingredientsAndMeasurements.append((strIngredient8, strMeasure8))
        }
        if let strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9),
           let strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9),
           !strIngredient9.isEmpty && !strMeasure9.isEmpty {
            ingredientsAndMeasurements.append((strIngredient9, strMeasure9))
        }
        if let strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10),
           let strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10),
           !strIngredient10.isEmpty && !strMeasure10.isEmpty {
            ingredientsAndMeasurements.append((strIngredient10, strMeasure10))
        }
        if let strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11),
           let strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11),
           !strIngredient11.isEmpty && !strMeasure11.isEmpty {
            ingredientsAndMeasurements.append((strIngredient11, strMeasure11))
        }
        if let strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12),
           let strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12),
           !strIngredient12.isEmpty && !strMeasure12.isEmpty {
            ingredientsAndMeasurements.append((strIngredient12, strMeasure12))
        }
        if let strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13),
           let strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13),
           !strIngredient13.isEmpty && !strMeasure13.isEmpty {
            ingredientsAndMeasurements.append((strIngredient13, strMeasure13))
        }
        if let strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14),
           let strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14),
           !strIngredient14.isEmpty && !strMeasure14.isEmpty {
            ingredientsAndMeasurements.append((strIngredient14, strMeasure14))
        }
        if let strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15),
           let strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15),
           !strIngredient15.isEmpty && !strMeasure15.isEmpty {
            ingredientsAndMeasurements.append((strIngredient15, strMeasure15))
        }
        if let strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16),
           let strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16),
           !strIngredient16.isEmpty && !strMeasure16.isEmpty {
            ingredientsAndMeasurements.append((strIngredient16, strMeasure16))
        }
        if let strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17),
           let strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17),
           !strIngredient17.isEmpty && !strMeasure17.isEmpty {
            ingredientsAndMeasurements.append((strIngredient17, strMeasure17))
        }
        if let strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18),
           let strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18),
           !strIngredient18.isEmpty && !strMeasure18.isEmpty {
            ingredientsAndMeasurements.append((strIngredient18, strMeasure18))
        }
        if let strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19),
           let strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19),
           !strIngredient19.isEmpty && !strMeasure19.isEmpty {
            ingredientsAndMeasurements.append((strIngredient19, strMeasure19))
        }
        if let strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20),
           let strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20),
           !strIngredient20.isEmpty && !strMeasure20.isEmpty {
            ingredientsAndMeasurements.append((strIngredient20, strMeasure20))
        }
        
        self.ingredientsAndMeasurements = ingredientsAndMeasurements
    }
    
    enum CodingKeys: String, CodingKey {
        case strMeal
        case strInstructions
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
}
