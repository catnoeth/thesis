//
//  ViewUserModel.swift
//  blah
//
//  Created by Catharine Noeth on 4/2/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

//JSON stuff to pull from DB to UI
import Foundation
//import UIKit
protocol ViewUserProtocol: class {
    func itemsDownloaded(items: NSArray)
}
class ViewUserModel: NSObject, URLSessionDataDelegate {
    weak var delegate: ViewUserProtocol!
    var data = Data()
    let urlPath: String = "http://woofrthesis.com/service.php"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                //print(url)
                
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    
    }
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray

        } catch let error as NSError {
            print(error)

        }
        
        var jsonElement = NSDictionary()
        let users = NSMutableArray()
        for i in jsonResult{
            print(i)
        }
        for i in 0 ..< jsonResult.count
        {
            //print ("hi")
            jsonElement = jsonResult[i] as! NSDictionary
            //print(jsonElement["id"] as? String)
          
            //print(i)
            let user = UserModel()
            //print("hello")
            //the following insures none of the Json values are nil through optional binding
            if let firstname = jsonElement["firstname"] as? String,
                let lastname = jsonElement["lastname"] as? String,
                let email = jsonElement["email"] as? String,
                let location = jsonElement["location"] as? String,
                let username = jsonElement["username"] as? String,
                let password = jsonElement["password"] as? String,
                //let usersince = jsonElement["usersince"] as? String,
                let about = jsonElement["about"] as? String,
                let id = jsonElement["id"] as? String
                
            {
                //user.firstname = "cat"
               //print("name one" + firstname)
               // print(user.firstname)
                
                user.firstname = firstname
                //print(firstname)
                
                //print("name two" + firstname)
                user.lastname = lastname
                
                user.location = location
                
                user.email = email
                
                user.username = username
                
                user.password = password
                
                //user.usersince = usersince
                
                user.about = about
                //print(user.about)
                user.id = id
                //print(firstname)
                
            }
            
            users.add(user)
            //for user in users{
               // print(user.firstname)
            //}
      
            
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in

            self.delegate.itemsDownloaded(items: users)

        })
    }
}
