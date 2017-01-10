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
import os.log

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
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedMeals = loadMeals() {
            meals += savedMeals
        } else {
            loadSampleMeals()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // Mark: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem" :
            if #available(iOS 10.0, *) {
                os_log("add a new meal", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            
        case "showDetail" :
            guard let mealDetailViewController = segue.destination as? DetailViewController else {
                fatalError("error")
            }
            
            guard let selectedMealCell = sender as? MealTableViewCell else {
                fatalError("error")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("error")
            }
            let selectedMeal = meals[indexPath.row]
            
        default:
            fatalError("you choose non-exist segue")
        }
    }
    
    
    // Mark: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender as? DetailViewController, let meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                
            } else {
                // add a new meal
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveMeals()
        }
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
    
    private func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.archiveURL.path)
        
        if isSuccessfulSave {
            print("successfully saved")
        } else {
            print("failed to save")
        }
    }
    
    private func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.archiveURL.path) as? [Meal]
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
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            meals.remove(at: indexPath.row)
            saveMeals()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
}
