//
//  AddPostVC.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/8/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var descField: UITextField!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = 120
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
        //the if statement makes sure that there is something inside of each of text fields and image field
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            let post = Post(imagePath: "", title: title, description: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = selectedImage
    }
    
}
