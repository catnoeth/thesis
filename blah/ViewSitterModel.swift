//
//  ViewSitterModel.swift
//  blah
//
//  Created by Catharine Noeth on 4/24/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//
import Foundation
import UIKit

protocol ViewSitterProtocol: class{
    func itemsDownloaded(items: NSArray)
}
class ViewSitterModel: NSObject, URLSessionDataDelegate {
    weak var delegate: ViewSitterProtocol!
    var data = Data()
    let urlPath: String = "http://woofrthesis.com/sitter.php"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession =
            Foundation.URLSession(configuration:URLSessionConfiguration.default)
        
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
            let sitters = NSMutableArray()
            for i in jsonResult{
                print(i)
            }
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                let sitter = SitterModel()
                
                if let firstname = jsonElement["firstname"] as? String,
                    let lastname = jsonElement["lastname"] as? String,
                    let name = jsonElement["name"] as? String
                {
                    sitter.firstname = firstname
                    sitter.lastname = lastname
                    sitter.name = name
                }
                sitters.add(sitter)
                
              
        }
        DispatchQueue.main.async(execute: { () -> Void in

            self.delegate.itemsDownloaded(items: sitters)

        })
    }
}


