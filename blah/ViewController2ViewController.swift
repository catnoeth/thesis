//
//  ViewController2ViewController.swift
//  blah
//
//  Created by Catharine Noeth on 12/12/18.
//  Copyright © 2018 Catharine Noeth. All rights reserved.
//

import UIKit
//import Alamofire
class ViewController2ViewController: UIViewController {
   
   
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var firstnametext: UITextField!
    @IBOutlet weak var aboutyoutext: UITextField!
  
    @IBOutlet weak var locationtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var lastnametext: UITextField!
    
   
    @IBOutlet weak var labelMessage: UILabel!
    @IBAction func buttonClicked(_ sender: Any) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://woofrthesis.com/signup.php")! as URL)
        
       
        let postString = "username = \(usernametext.text!)&password = \(passwordtext.text!)&firstname = \(firstnametext.text!)&lastname = \(lastnametext.text!)&about = \(aboutyoutext.text!)&email = \(emailtext.text!)&location = \(locationtext.text!)"
        
        
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main)
        {
            (response, data, error) in
            print(response)
            
        }
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//
//            if error != nil {
//                //print("error=\(String(describing: error))")
//                return
//            }
//
//            //print("response = \(String(describing: response))")
//
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(String(describing: responseString))")
//            //print(data)
//        }
//        task.resume()
        
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

     @IBOutlet weak var scrollbox: UIScrollView!
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
