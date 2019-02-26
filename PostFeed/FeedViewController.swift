//
//  ViewController.swift
//  PostFeed
//
//  Created by chris on 2/26/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var FeedTableView: UITableView!
    
    var posts = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        
        let url = URL(string: "https://api.myjson.com/bins/f8xry")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.posts = dataDictionary["posts"] as! [[String:Any]]
                self.FeedTableView.reloadData()
            }
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        let post = posts[indexPath.row]
        let user = post["user"] as! [String:Any]
        let name = user["name"] as! String
        let avatarURL = user["avatarURL"] as! String
        let postURL = post["postURL"] as! String
        let likeCount = post["likeCount"] as! Int
        let description = post["description"] as! String
        let created = post["created"] as! String
        
        cell.nameLabel.text = name
        cell.likeLabel.text = "\(likeCount)"
        cell.descriptionLabel.text = description
        
        
        return cell
    }


}
