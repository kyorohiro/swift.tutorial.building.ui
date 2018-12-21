//
//  Meal.swift
//  Xxx
//
//  Created by kiyohiro kawamura on 2018/12/21.
//  Copyright © 2018 kiyohiro kawamura. All rights reserved.
//

import UIKit

class Meal: NSObject {
    var name: String
    var photo: UIImage?
    var rating: Int

    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0  {
            return nil
        }

        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
