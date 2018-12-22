//
//  ViewController.swift
//  Xxx
//
//  Created by kiyohiro kawamura on 2018/12/20.
//  Copyright © 2018 kiyohiro kawamura. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController,
    UITextFieldDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet weak var ratingView: RatingControl!
    var meal: Meal?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    // 新しく init を定義した場合に必須
    required init?(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("called viewDidLoad")
        self.mealNameField.delegate = self
       // photoImageView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("called didReceiveMemoryWarning")
    }
    
    //MARK: Properties
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!

    @IBAction func onClickButton(_ sender: Any) {
        print("called Click Button")
        mealNameLabel.text = "XXX"
    }
    
    
     //MARK: Actions
    @IBAction func onTapPhoto(_ sender: UITapGestureRecognizer) {
        print("called onTapPhoto")
        self.mealNameField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("called imagePickerControllerDidCancel")
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        print("##>>## prepare -------------------")
        // Configure the destination view controller only when the save button is pressed.
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        print(button)
        let name = mealNameField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingView.rating
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name, photo: photo, rating: rating)
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("called ")
        textField.resignFirstResponder()
        self.mealNameLabel.text = textField.text
        return true
    }
}


