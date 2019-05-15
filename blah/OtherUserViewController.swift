//
//  OtherUserViewController.swift
//  blah
//
//  Created by Catharine Noeth on 5/14/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit

class OtherUserViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var bookSitterButton: UIButton!
    @IBOutlet weak var addToFavButton: UIButton!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    @IBOutlet weak var reviewsTable: UITableView!
    
   
    override func viewDidLoad() {
        
        //cell.textLabel?.text = "Moose"
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
