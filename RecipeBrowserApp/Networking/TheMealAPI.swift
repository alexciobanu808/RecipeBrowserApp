//
//  TheMealAPI.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/29/22.
//

import Combine
import Foundation

class TheMealAPI {
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    
    func getDessertMeals(completionHandler: @escaping (Result<DessertMeals, TheMealAPIError>) -> Void) {
        let urlString = baseURL + "filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.network(error)))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(DessertMeals.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(.decoding))
                }
            } else {
                completionHandler(.failure(.unknown))
            }
        }.resume()
    }
    
    func getMealDetails(mealId: String, completionHandler: @escaping (Result<MealDetails, TheMealAPIError>) -> Void) {
        let urlString = baseURL + "lookup.php?i=" + mealId
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.network(error)))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(MealDetails.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(.decoding))
                }
            } else {
                completionHandler(.failure(.unknown))
            }
        }.resume()
    }
}

enum TheMealAPIError: Error {
    case invalidURL
    case decoding
    case network(Error)
    case unknown
}
