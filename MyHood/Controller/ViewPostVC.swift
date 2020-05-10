//
//  ViewPostVC.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/10/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class ViewPostVC: UIViewController {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var postDesc: UILabel!
    
    var image1 = UIImage()
    var title1 = ""
    var description1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = 120
        postLbl.text = title1
        postDesc.text = description1
        postImg.image = image1
        postImg.layer.cornerRadius = 120
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
    }
    

}
