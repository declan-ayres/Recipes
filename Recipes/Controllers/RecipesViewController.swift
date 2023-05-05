//
//  ViewController.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

class RecipesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    var recipeViewModel = RecipeViewModel()
    
    var desserts = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: recipeCell)
        recipeViewModel.getRecipes { desserts, error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Failed to get recipes", preferredStyle: .alert)
                self.present(alert, animated: true)
                return
            }
            self.desserts = desserts!
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    //MARK: UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return desserts.count
    }
    
    //MARK: UICollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeCell, for: indexPath) as! RecipeCell
        cell.configure(meal: desserts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = desserts[indexPath.item]
        let detailsVC = DetailsViewController()
        recipeViewModel.meal = meal
        detailsVC.recipeViewModel = recipeViewModel
        self.present(detailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }

}

