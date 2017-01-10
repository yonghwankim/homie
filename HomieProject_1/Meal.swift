//
//  Meal.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2017. 1. 5..
//  Copyright © 2017년 yonghwankim's macbook. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    // Mark: Properties
    var name: String
    var photo: UIImage?
    
    
    // Mark: Archiving Paths
    static let documentsDirectory = FileManager().urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("meals")
    
    
    // Mark: Types
    struct PropertyKeys {
        static let name = "name"
        static let photo = "photo"
    }
    
    
    // Initialize stored properties
    init?(name: String, photo: UIImage?) {
    
        // Name must not be empty.
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
    
    // Mark: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKeys.name)
        aCoder.encode(photo, forKey: PropertyKeys.photo)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKeys.name) as? String else {
            if #available(iOS 10.0, *) {
                os_log("unable to decode the name for meal object", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKeys.photo) as? UIImage
        
        // Must call designated initializer.
        self.init(name: name, photo: photo)
    }
}










