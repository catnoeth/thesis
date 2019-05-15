//
//  bookSitterViewController.swift
//  blah
//
//  Created by Catharine Noeth on 5/7/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit
import Alamofire
class bookSitterViewController:UIViewController {

    @IBOutlet weak var startDateLabel: UILabel!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var bookSitterLabel: UILabel!
    
    @IBOutlet weak var sitterNameLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var petNameSpeciesLabel: UILabel!
   
    @IBOutlet weak var speciesText: UITextField!
    @IBOutlet weak var petNameText: UITextField!
    
  
//    @IBAction func endDateChanged(_ sender: Any) {
//    }
//
//
//    @IBAction func startDateChanged(_ sender: Any) {
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        dateFormatter.timeStyle = DateFormatter.Style.short
//
//        let strDate = dateFormatter.string(from: startDatePicker.date)
//
//
//
//    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, dd YYYY"
        let startDateTxt = dateFormatter.string(from: startDatePicker.date)
        let endDateTxt = dateFormatter.string(from: endDatePicker.date)
        self.view.endEditing(true)
        
        
        if(petNameText.text == "" || speciesText.text == ""){
            let alertController = UIAlertController(title: "Missing Fields", message: "Please enter in your pet details", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
            
        
        else{
            let parameters: Parameters = ["sitter": sitterNameLabel.text!, "petname": petNameText.text!, "species": speciesText.text!, "start_date": startDateTxt, "end_date" :endDateTxt ]
            
            
            let urlString = "http://woofrthesis.com/booksitter.php"
            
            Alamofire.request(urlString, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseString {
                response in
                switch response.result {
                case .success:
                    print(response)
                    print(parameters)
                    
                    let alertController = UIAlertController(title: "Success!", message: "You have successfully booked a pet sitter!", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Back to Home Page", style: .default){(action) -> Void in let UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                        self.present(UITabBarController!, animated: true, completion:nil)
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
        let currentDate = NSDate()
        let startDatePicker = currentDate
        
        super.viewDidLoad()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
