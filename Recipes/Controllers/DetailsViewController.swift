//
//  DetailsViewController.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var recipeViewModel: RecipeViewModel!
    
    let recipeFetcher = RecipeFetcher()
    
    var textView: UITextView!
    var imageView: UIImageView!
    
    func setupViews() {
        textView = UITextView(frame: .zero)
        view.addSubview(textView)
        textView.frame = view.bounds
        imageView = UIImageView(frame: .zero)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textView.isEditable = false
        textView.textContainerInset = UIEdgeInsets(top: 220, left: 20, bottom: 20, right: 20)
        
        textView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        imageView.setImage(urlString: recipeViewModel.meal.thumbnail)
    }
    
    func formatRecipe(recipe: Recipe) {
        let attributedText = NSMutableAttributedString(string: recipe.title)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 16
        attributedText.addAttributes([.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 24, weight: .bold)], range: NSRange(location: 0, length: recipe.title.count))
        attributedText.append(NSAttributedString(string: "\n\n"))
        if let area = recipe.area {
            attributedText.append(NSAttributedString(string: area, attributes: [.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 16, weight: .medium)]))
            if let category = recipe.category {
                attributedText.append(NSAttributedString(string: " \(category)\n", attributes: [.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 16, weight: .medium)]))
            } else {
                attributedText.append(NSAttributedString(string: "\n"))
            }
        }
        if let source = recipe.source, let url = URL(string: source) {
            attributedText.append(NSAttributedString(string: source + "\n", attributes: [.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 16, weight: .medium), .link: url]))
        }
        if let videoUrl = recipe.videoUrl {
            attributedText.append(NSAttributedString(string: videoUrl + "\n", attributes: [.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 16, weight: .medium), .link: videoUrl]))
        }
        var ingredientsList = "\nIngredients:\n"
        for i in 0..<recipe.ingredients.count {
            let ingredient = recipe.ingredients[i]
            let measure = recipe.measures[i]
            if !(ingredient.isEmpty || measure.isEmpty) {
                ingredientsList += "\(measure) \(ingredient)\n"
            }
        }
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.alignment = .justified
        paragraphStyle1.lineSpacing = 16
        ingredientsList += "\n"
        attributedText.append(NSAttributedString(string: ingredientsList, attributes: [.paragraphStyle: paragraphStyle1, .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]))
        attributedText.append(NSAttributedString(string: recipe.instructions, attributes: [.paragraphStyle: paragraphStyle1, .font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        self.textView.attributedText = attributedText
        self.view.layoutIfNeeded()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        
        setupViews()
        
        
        recipeViewModel.getRecipeDetails { recipe, error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Failed to get recipe details", preferredStyle: .alert)
                self.present(alert, animated: true)
                return
            }
            guard let recipe = recipe else {return}
            self.formatRecipe(recipe: recipe)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
