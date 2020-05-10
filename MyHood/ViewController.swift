//
//  ViewController.swift
//  MyHood
//
//  Created by Ben Arteaga on 5/4/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //makes sure we are loading the posts when we initially open the app
        DataService.instance.loadPosts()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        }
        return PostCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewPostVC") as? ViewPostVC
        let post = DataService.instance.loadedPosts[indexPath.row]
        vc?.image1 = DataService.instance.imageForPath(post.imagePath)!
        vc?.title1 = post.title
        vc?.description1 = post.postDesc
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }

}

