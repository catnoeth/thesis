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
    let urlPath: String = "http://woofrthesis.com/calendar.php"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession =
            Foundation.URLSession(configuration:URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                
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
                let sitterr = SitterModel()
                
                if let sitter = jsonElement["sitter"] as? String,
                    let petname = jsonElement["petname"] as? String,
                    let species = jsonElement["species"] as? String,
                    let start_date = jsonElement["start_date"] as? String,
                    let end_date = jsonElement["end_date"] as? String
                    
                {
                    sitterr.sitter = sitter
                    sitterr.petname = petname
                    sitterr.species = species
                    sitterr.start_date = start_date
                    sitterr.end_date = end_date
                }
                sitters.add(sitterr)
                
              
        }
        DispatchQueue.main.async(execute: { () -> Void in

            self.delegate.itemsDownloaded(items: sitters)

        })
    }
}


