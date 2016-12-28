//
//  ListViewController.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2016. 12. 19..
//  Copyright © 2016년 yonghwankim's macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var text = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //go map
    @IBAction func goCityhall(_ sender: Any) {
        self.performSegue(withIdentifier: "segue_map", sender: self)
    }
    
    
    // unwind segue
    @IBAction func popMap(segue: UIStoryboardSegue) {
        
    }
    
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.text.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.text[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetialViewController {
            vc.textView.text = self.text[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
