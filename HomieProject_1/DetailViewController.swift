//
//  DetailViewController.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2016. 12. 19..
//  Copyright © 2016년 yonghwankim's macbook. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController {
    
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let textToLoad = selected {
            textView.text = textToLoad
        }
        
    }
    
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var imgView: UIImageView!
}
