//
//  RecipeCell.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit


let recipeCell = "recipeCell"

class RecipeCell: UICollectionViewCell {
    var imageView: UIImageView!
    var title: UILabel!
    var imageTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: .zero)
        
        title = UILabel(frame: .zero)
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(meal: Meal) {
        title.text = meal.title
        imageTask?.cancel()
        imageView.image = nil
        imageTask = imageView.setImage(urlString: meal.thumbnail)
    }
    
}
