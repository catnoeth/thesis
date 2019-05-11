//
//  discover.swift
//  blah
//
//  Created by Catharine Noeth on 3/1/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit

class discover: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewUserProtocol{
    
    
   
   
    
   
    var feeditems: NSArray = NSArray()
    var selectedUser: UserModel = UserModel()
    
    
    @IBOutlet weak var sitters: UITableView!
    
    @IBOutlet weak var pets_view: UIView!
    
    @IBOutlet weak var title_label: UILabel!
    
    @IBOutlet weak var pets_collection: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.sitters.delegate = self
        self.sitters.dataSource = self
        
        
        let userModel = ViewUserModel()
        userModel.delegate = self
        
        userModel.downloadItems()

        // Do any additional setup after loading the view.
    }
    func itemsDownloaded(items: NSArray) {
        feeditems = items
        self.sitters.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeditems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return feeditems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "BasicCell"
        let item: UserModel = feeditems[indexPath.row] as! UserModel
        //print (item)
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let data = item.firstname! + ":      " + item.location!
        // Get references to labels of cell
        
        myCell.textLabel!.text = data
        
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cellIdentifier: String = "CollectionCell"
        let item: UserModel = feeditems[indexPath.row] as! UserModel
       
        let myCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        myCell.backgroundColor = .black
        return myCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
