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
    
    
    // Mark: Properties
    var meals = [Meal]()
    @IBOutlet var tableView: UITableView!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()
        
        self.navigationController?.isNavigationBarHidden = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // Mark: Private methods
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
    
    // Mark: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
//        let button = sender as? UIBarButtonItem, button === 
    }
    
    
    
    
    ////////////////////////////////////////////////
    //go map
    @IBAction func goCityhall(_ sender: Any) {
        self.performSegue(withIdentifier: "segue_map", sender: self)
    }
    
    
    // unwind segue
    @IBAction func popMap(segue: UIStoryboardSegue) {
        
    }
    
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MealTableViewCell else {
            fatalError("error")
        }
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetialViewController {
//            vc.textView.text = self.text[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}
