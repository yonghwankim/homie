//
//  Meal.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2017. 1. 5..
//  Copyright © 2017년 yonghwankim's macbook. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    
    // Mark: Properties
    var name: String
    var photo: UIImage?
    
    
    
    // Initialize stored properties
    init?(name: String, photo: UIImage?) {
    
        // Name must not be empty.
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
}
