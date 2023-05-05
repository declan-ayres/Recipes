//
//  RecipeFetcher.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

let baseUrl = "https://themealdb.com/api/json/v1/1"

class RecipeFetcher: NSObject {

    let session = URLSession.shared
    
    func fetchDesserts(completion: @escaping ([Meal]?, Error?) -> ()) {
        let url = URL(string: baseUrl + "/filter.php?c=Dessert")
        let request = URLRequest(url: url!)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return;
            }
            
            var mealContainer: MealContainer?
            let decoder = JSONDecoder()
            do {
                mealContainer = try decoder.decode(MealContainer.self, from: data!)
            } catch {
                completion(nil, error)
                return
            }
            completion(mealContainer?.meals.sorted(by: {$0.title < $1.title}), nil)
        }.resume()
    }
    
    func fetchDetails(id: String, completion: @escaping (Recipe?, Error?) -> ()) {
        let url = URL(string: baseUrl + "/lookup.php?i=\(id)")
        let request = URLRequest(url: url!)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return;
            }
            
            var mealContainer: RecipeContainer?
            let decoder = JSONDecoder()
            do {
                mealContainer = try decoder.decode(RecipeContainer.self, from: data!)
            } catch {
                completion(nil, error)
                return
            }
            completion(mealContainer?.meals[0], nil)
        }.resume()
    }
}
