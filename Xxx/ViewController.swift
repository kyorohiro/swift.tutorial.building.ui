//
//  ViewController.swift
//  Xxx
//
//  Created by kiyohiro kawamura on 2018/12/20.
//  Copyright © 2018 kiyohiro kawamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var ratingView: RatingControl!
    var textFieldDelegate:MealNameFieldDelegate? ;

    // 新しく init を定義した場合に必須
    required init?(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        self.textFieldDelegate = MealNameFieldDelegate(self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("called viewDidLoad")
        mealNameField.delegate = self.textFieldDelegate
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
}

class MealNameFieldDelegate : NSObject, UITextFieldDelegate {

    var target:ViewController?

    init(_ target:ViewController) {
        self.target = target
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("called ")
        textField.resignFirstResponder()
        target?.mealNameLabel.text = textField.text
        return true
    }
}

