//
//  UIImageView+Fetcher.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

extension UIImageView {
    
    var session: URLSession {
        return URLSession.shared
    }
    
    var cache: ImageCache {
        return ImageCache.shared
    }

    @discardableResult
    func setImage(urlString: String) -> URLSessionDataTask? {
        if let imageData = cache.getImage(key: urlString) {
            self.image = UIImage(data: imageData)
            return nil
        }
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                return
            }
            self.cache.cacheImage(key: urlString, value: data!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
        return task
    }
}
