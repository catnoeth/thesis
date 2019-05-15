//
//  PetModel.swift
//  blah
//
//  Created by Catharine Noeth on 5/14/19.
//  Copyright © 2019 Catharine Noeth. All rights reserved.
//

import UIKit
import Foundation
class PetModel: NSObject {
    var species: String?
    var name: String?
    var breed: String?
    
    
    override init(){
        
    }
    
    init(species: String, name: String, breed: String){
    
        self.species = species
        self.name = name
        self.breed = breed
    }
}
