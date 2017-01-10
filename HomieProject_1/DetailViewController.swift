//
//  DetailViewController.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2016. 12. 19..
//  Copyright © 2016년 yonghwankim's macbook. All rights reserved.
//

import UIKit
import os.log


class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Mark: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("error")
        }
        
    }
    
    // ListViewController 로 보낼 data
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
        }
        
        updateSaveButtonState()
    }
    
    
    
    // Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameTextField.resignFirstResponder()
        updateSaveButtonState()
        navigationItem.title = nameTextField.text
    }
    
    
    // Mark: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIButton, button === saveButton else {
            if #available(iOS 10.0, *) {
                os_log("The save button was not pressed", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return
        }
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        
        meal = Meal(name: name, photo: photo)
    }
    
    
    // Mark: Private Methods
    func updateSaveButtonState() {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // Mark: Action
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
    }
    
    
    // Mark: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("error")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
