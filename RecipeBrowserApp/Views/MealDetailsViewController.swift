//
//  MealDetailsViewController.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/30/22.
//

import Kingfisher
import Combine
import UIKit

class MealDetailsViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    var mealDetailsViewModel: MealDetailsViewModel?
    
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    @IBOutlet weak var ingredientsAndMeasurementLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDetailsViewModel?.getMealDetails()
        
        if let mealDetailsViewModel = mealDetailsViewModel {
            mealImageView.kf.setImage(with: URL(string: mealDetailsViewModel.mealPictureURL))
        }
        
        mealDetailsViewModel?.$uiModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self]_ in
                self?.title = self?.mealDetailsViewModel?.mealDetails?.strMeal ?? ""
                self?.mealInstructionsLabel.text = self?.mealDetailsViewModel?.mealDetails?.strInstructions ?? ""
                self?.ingredientsAndMeasurementLabel.text = self?.mealDetailsViewModel?.ingredientsAndMeasurementsString ?? ""
            }
            .store(in: &cancellables)
    }
}
