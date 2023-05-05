//
//  Recipe.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

struct RecipeContainer: Decodable {
    var meals: [Recipe]
}

struct Recipe: Decodable {
    var id: String
    var title: String
    var thumbnail: String
    var area: String?
    var category: String?
    var ingredients: [String]
    var measures: [String]
    var source: String?
    var videoUrl: String?
    var instructions: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        area = try values.decodeIfPresent(String.self, forKey: .area)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        videoUrl = try values.decodeIfPresent(String.self, forKey: .videoUrl)
        instructions = try values.decode(String.self, forKey: .instructions)
        ingredients = [try values.decodeIfPresent(String.self, forKey: .ingredient1) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient2) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient3) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient4) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient5) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient6) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient7) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient8) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient9) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient10) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient11) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient12) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient13) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient14) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient15) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient16) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient17) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient18) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient19) ?? "",
                       try values.decodeIfPresent(String.self, forKey: .ingredient20) ?? ""]
        measures = [try values.decodeIfPresent(String.self, forKey: .measure1) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure2) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure3) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure4) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure5) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure6) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure7) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure8) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure9) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure10) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure11) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure12) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure13) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure14) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure15) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure16) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure17) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure18) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure19) ?? "",
                    try values.decodeIfPresent(String.self, forKey: .measure20) ?? ""]
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case thumbnail = "strMealThumb"
        case area = "strArea"
        case category = "strCategory"
        case source = "strSource"
        case tags = "strTags"
        case videoUrl = "strYoutube"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
}
