//
//  ForgotPassViewController.swift
//  blah
//
//  Created by Catharine Noeth on 5/13/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//
import MessageUI
import Parse
import UIKit

class ForgotPassViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var info_paragraph: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let email = emailTextBox.text!
        
        if email.isEmpty{
            let userMessage:String = "Please type in your email"
            displayMessage(userMessage: userMessage)
            return
        }
        PFUser.requestPasswordResetForEmail(inBackground: email) { (success: Bool, error: Error?) in
                if(error != nil){
                    //Display error message
                    let userMessage:String = error!.localizedDescription
                    self.displayMessage(userMessage: userMessage)
                }
                else{
                    
                    //Display succes message
                    let userMessage:String = "An email was sent to your address"
                    self.displayMessage(userMessage: userMessage)
                }
            }
      
            
            
            
        }
    
    
    func displayMessage(userMessage: String){
        let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    }
    
    
   
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



///
