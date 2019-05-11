//
//  UserModel.swift
//  blah
//
//  Created by Catharine Noeth on 3/26/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

// Class to hold user info from db

import Foundation
import UIKit

class UserModel: NSObject {
    //properties
    var firstname: String?
    var lastname: String?
    var location: String?
    var email: String?
    var username: String?
    var password: String?
    //var usersince: String?
    var about: String?
    var id: String?
    
    override init(){
        
    }
    init(firstname: String, lastname: String, location: String, email: String, username: String,
         password: String, about: String, id: String){
        self.firstname = firstname;
        self.lastname = lastname;
        self.location = location;
        self.email = email;
        self.username = username;
        self.password = password;
        //self.usersince = usersince;
        self.about = about;
        self.id = id;
        
        
    }
    // Print objects current state
    
//    override var description: String{
//        return "Name: \(firstname), Last Name: \(lastname), Location: \(location), Email: \(email), Username: \(username), Password: \(password), User Since: \(usersince), About: \(about), ID: \(id)"
//        
//        
//    }

}
