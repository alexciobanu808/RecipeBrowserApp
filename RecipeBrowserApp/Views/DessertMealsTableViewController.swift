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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dessertViewModel.fetchDessetMeals()
        
        dessertViewModel.$uiModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &cancellables)
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

