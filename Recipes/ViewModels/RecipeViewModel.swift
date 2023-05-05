//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

class RecipeViewModel: NSObject {

    let recipeFetcher = RecipeFetcher()
    var meal: Meal!
    
    func getRecipes(completion: @escaping ([Meal]?, Error?) -> ()) {
        recipeFetcher.fetchDesserts { meals, error in
            DispatchQueue.main.async {
                completion(meals, error)
            }
        }
    }
    
    func getRecipeDetails(completion: @escaping (Recipe?, Error?) -> ()) {
        recipeFetcher.fetchDetails(id: meal.id) { recipe, error in
            DispatchQueue.main.async {
                completion(recipe, error)
            }
        }
    }
}
