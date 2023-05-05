//
//  ImageCache.swift
//  Recipes
//
//  Created by Declan Ayres on 5/4/23.
//

import UIKit

class ImageCache: NSObject {
    
    static let shared = ImageCache()

    let cache = NSCache<NSString, NSData>()
    
    func cacheImage(key: String, value: Data) {
        cache.setObject(value as NSData, forKey: key as NSString)
    }
    
    func getImage(key: String) -> Data? {
        return cache.object(forKey: key as NSString) as Data?
    }
}
