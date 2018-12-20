//
//  ViewController.swift
//  Xxx
//
//  Created by kiyohiro kawamura on 2018/12/20.
//  Copyright © 2018 kiyohiro kawamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("called didReceiveMemoryWarning")
    }
    
    //MARK: Properties
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameField: UITextField!
    @IBAction func onClickButton(_ sender: Any) {
        mealNameLabel.text = "XXX"
      //  mealNameField.delegate =
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

