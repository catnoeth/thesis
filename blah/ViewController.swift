//
//  ViewController.swift
//  blah
//
//  Created by Catharine Noeth on 11/6/18.
//  Copyright © 2018 Catharine Noeth. All rights reserved.
//
///Users/catharinenoeth/Desktop/blah/blah/ViewController.swift
import UIKit

class ViewController: UIViewController {
    
   
   
    
   //@IBOutlet weak var Button: UIButton!
    @IBOutlet weak var emailtextbox: UITextField!
    @IBOutlet weak var passwordtextbox: UITextField!
    @IBOutlet weak var password: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var woofrLogo: UIImageView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func login(_ sender: UIButton) {
        let user_email = emailtextbox.text
        let user_pass = passwordtextbox.text
        if(user_email == "" || user_pass == ""){
            let alertController = UIAlertController(title: "Missing Fields", message: "Please enter in your email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        emailtextbox.layer.cornerRadius = 12
        passwordtextbox.layer.cornerRadius = 12
    }
    
   
 //
        
        
//        login.layer.shadowRadius = 5
//        login.layer.cornerRadius = 10

  
         
        

      
    
  
}


