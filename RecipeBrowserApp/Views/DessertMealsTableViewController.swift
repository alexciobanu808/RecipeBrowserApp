//
//  DessertMealsTableViewController.swift
//  RecipeBrowserApp
//
//  Created by Alex Ciobanu on 4/25/22.
//

import Combine
import UIKit

class DessertMealsTableViewController: UITableViewController {
    var cancellables = Set<AnyCancellable>()
    let dessertViewModel  = DessertMealsViewModel()
    var loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dessertViewModel.fetchDessetMeals()
        
        setUpLoadingIndicator()
        
        dessertViewModel.$uiModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success: self?.tableView.reloadData()
                case .none: break
                case .failure(let error):
                    self?.presentErrorAlert(error: error)
                }
                 }
            .store(in: &cancellables)
        
        dessertViewModel.$isLoading
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
            self.dessertViewModel.fetchDessetMeals()
        }
        
        alert.addAction(okButton)
        alert.addAction(retryButton)
        
        present(alert, animated: true)
        
        print(error)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dessertViewModel.meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCellID", for: indexPath)
        cell.textLabel?.text = dessertViewModel.meals[indexPath.row].strMeal
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MealDetailsViewControllerID") as? MealDetailsViewController else { return }
        
        let meal = dessertViewModel.meals[indexPath.row]
        let viewModel = MealDetailsViewModel(mealID: meal.idMeal, mealPictureURL: meal.strMealThumb)
        viewController.mealDetailsViewModel = viewModel
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

