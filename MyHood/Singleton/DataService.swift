//
//  DataService.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/8/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    
    //getter for loaded posts
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        //transforms array into data
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        //saves data to a key called posts
        UserDefaults.standard.set(postsData, forKey: "posts")
        //saves data to disk
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data {
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(_ image: UIImage) -> String {
        //turns image into data
        let imgData = UIImagePNGRepresentation(image)
        //makes sure that each time we save an image it will have a unique path name
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(imgPath)
        //writes fullPath to disc
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        //not sure why we are returning imgPath?
        return imgPath
    }
    
    func imageForPath(_ path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(_ name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
    
}
