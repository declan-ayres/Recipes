//
//  Recipe.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

struct MealContainer: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable {
    
    var id: String
    var title: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case thumbnail = "strMealThumb"
    }

}
