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
            .sink { _ in self.tableView.reloadData() }
            .store(in: &cancellables)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dessertViewModel.desertNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCellID", for: indexPath)
        cell.textLabel?.text = dessertViewModel.desertNames[indexPath.row]
        
        return cell
    }

}

