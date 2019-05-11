//
//  sittersscreenViewController.swift
//  blah
//
//  Created by Catharine Noeth on 4/24/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit

class sittersscreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewSitterProtocol   {
    
   
    @IBOutlet weak var sitterlabel: UILabel!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var sitters_list: UITableView!
    
    
    
    var feedItems: NSArray = NSArray()
    var selectedUser: SitterModel = SitterModel()
    
//    @IBAction func index_changed(_ sender: Any) {
//    }

//
        override func viewDidLoad() {
            super.viewDidLoad()
            self.sitters_list.delegate = self
            self.sitters_list.dataSource = self
            
            let sitterModel = ViewSitterModel()
            sitterModel.delegate = self
            sitterModel.downloadItems()
            /*
             // MARK: - Navigation
             
             
             */
            
        }
        // Do any additional setup after loading the view.
    
    func itemsDownloaded(items: NSArray) {
        //
                feedItems = items
                self.sitters_list.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // Retrieve cell
        let cellIdentifier: String = "sitter_cell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: SitterModel = feedItems[indexPath.row] as! SitterModel
        // Get references to labels of cell
        let data = item.firstname! + " is sitting for: " + item.name!
        myCell.textLabel!.text = data

        return myCell
    }
    
}
