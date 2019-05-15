//
//  ViewPetModel.swift
//  blah
//
//  Created by Catharine Noeth on 5/14/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit

protocol ViewPetProtocol: class {
    func itemsDownloaded(items: NSArray)
}
class ViewPetModel: NSObject {
    weak var delegate: ViewPetProtocol!
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
        let pets = NSMutableArray()
        for i in jsonResult{
            print(i)
        }
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let pet = PetModel()
            
            //insures none of the Json values are nil through optional binding
            if let  species = jsonElement["species"] as? String,
                let name = jsonElement["name"] as? String,
                let breed = jsonElement["breed"] as? String
           
            {
            
                
                pet.species = species
                
                pet.name = name
                pet.breed = breed
                
                
            }
            
            pets.add(pet)
            
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: pets)
            
        })
    }
}
