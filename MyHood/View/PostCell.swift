//
//  PostCell.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/7/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 15
    }
    
    func configureCell(_ post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        //imageForPath takes in the name for a path and returns the actual image
        postImg.image =          DataService.instance.imageForPath(post.imagePath)
    }

}
