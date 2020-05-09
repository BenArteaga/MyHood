//
//  Post.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/4/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    fileprivate var _imagePath: String
    fileprivate var _title: String
    fileprivate var _postDesc: String
    
    //these three variables are essentially getters for the private variables
    //only way to set private variables in this case is through initialization
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
    }
    
    override init() {
        self._imagePath = ""
        self._title = ""
        self._postDesc = ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._postDesc, forKey: "description")
        aCoder.encode(self._title, forKey: "title")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = (aDecoder.decodeObject(forKey: "imagePath") as? String)!
        self._title = (aDecoder.decodeObject(forKey: "title") as? String)!
        self._postDesc = (aDecoder.decodeObject(forKey: "description") as? String)!
    }
}
