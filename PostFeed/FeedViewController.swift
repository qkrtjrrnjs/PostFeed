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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        return cell
    }


}

