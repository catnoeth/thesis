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
    var selectedPet: PetModel = PetModel()
    
    
    @IBOutlet weak var sitters: UITableView!
    
  
    
    @IBOutlet weak var petsLabel: UILabel!
    @IBOutlet weak var petsView: UITableView!
    @IBOutlet weak var title_label: UILabel!
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.sitters.delegate = self
        self.sitters.dataSource = self
//        self.petsView.delegate = self
//        self.petsView.dataSource = self
//
        
        let userModel = ViewUserModel()
        userModel.delegate = self
        
        userModel.downloadItems()
        
//        let petModel = ViewPetModel()
//        petModel.delegate = self
//
//        petModel.downloadItems()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
