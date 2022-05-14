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
    var loadingIndicator = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    @IBOutlet weak var ingredientsAndMeasurementLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDetailsViewModel?.getMealDetails()
        
        setUpLoadingIndicator()
        
        if let mealDetailsViewModel = mealDetailsViewModel {
            mealImageView.kf.setImage(with: URL(string: mealDetailsViewModel.mealPictureURL))
        }
        
        mealDetailsViewModel?.$uiModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success: self?.title = self?.mealDetailsViewModel?.mealDetails?.strMeal ?? ""
                    self?.mealInstructionsLabel.text = self?.mealDetailsViewModel?.mealDetails?.strInstructions ?? ""
                    self?.ingredientsAndMeasurementLabel.text = self?.mealDetailsViewModel?.ingredientsAndMeasurementsString ?? ""
                case .none: break
                case .failure(let error):
                    self?.presentErrorAlert(error: error)
                }
            }
            .store(in: &cancellables)
        
        mealDetailsViewModel?.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.loadingIndicator.startAnimating()
                } else {
                    self?.loadingIndicator.stopAnimating()
                }
            }
            .store(in: &cancellables)
    }
    
    func setUpLoadingIndicator() {
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func presentErrorAlert(error: TheMealAPIError) {
        let alert = UIAlertController(title: "Error", message: "Uh oh, something went wrong...", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        let retryButton = UIAlertAction(title: "Retry", style: .default) { _ in
            self.mealDetailsViewModel?.getMealDetails()
        }
        
        alert.addAction(okButton)
        alert.addAction(retryButton)
        
        present(alert, animated: true)
        
        print(error)
    }
}
