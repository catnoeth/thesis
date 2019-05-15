//
//  ViewController2ViewController.swift
//  blah
//
//  Created by Catharine Noeth on 12/12/18.
//  Copyright © 2018 Catharine Noeth. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
class ViewController2ViewController: UIViewController {
   
   
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var firstnametext: UITextField!
    @IBOutlet weak var aboutyoutext: UITextField!
  
    @IBOutlet weak var locationtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var lastnametext: UITextField!
    
   
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var signInNowButton: UIButton!
    
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        

        let urlString = "http://woofrthesis.com/signup.php"
        
        if(usernametext.text == "" || passwordtext.text == "" || firstnametext.text == "" || lastnametext.text == "" || aboutyoutext.text == "" || emailtext.text == "" || locationtext.text == ""){
            let alertController = UIAlertController(title: "Missing Fields", message: "Please enter in your email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
            
        else{
        
            let parameters: Parameters = ["username": usernametext.text!, "password": passwordtext.text!, "firstname": firstnametext.text!, "lastname": lastnametext.text!, "about": aboutyoutext.text!, "email": emailtext.text!, "location": locationtext.text!]

            Alamofire.request(urlString, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseString {
                response in
                switch response.result {
                case .success:
                    print(response)
                    print(parameters)
                    
                    let alertController = UIAlertController(title: "Success!", message: "You have successfully created an account :)", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Log In Now!", style: .default){(action) -> Void in let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "signin")
                        self.present(ViewController!, animated: true, completion:nil)
                    }
                    
                    
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    break
                case .failure(let error):
                    
                    print(error)
                }
        }
    
    }
    }
    override func viewDidLoad() {
        

        super.viewDidLoad()
        
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation
*/

}

