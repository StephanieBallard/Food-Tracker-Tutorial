//
//  Meal.swift
//  FoodTracker
//
//  Created by Stephanie Ballard on 2/23/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage
    var rating: Int
    
    // MARK: Types
    
    struct PropertyKey: Codable {
        var name: String
        var photo: UIImage
        var rating: Int

        enum CodingKeys: CodingKey {
            case name
            case photo
            case rating
        }

        init(name: String, photo: UIImage, rating: Int) {
            self.name = name
            self.photo = photo
            self.rating = rating
        }

        func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(name, forKey: .name)
          try container.encode(photo, forKey: .photo)
            try container.encode(rating, forKey: .rating)
        }
        init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          name = try container.decode(String.self, forKey: .name)
            photo = try container.decode(UIImage.self, forKey: .photo)
          rating = try container.decode(Int.self, forKey: .rating)
        }
    }
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
//        if name.isEmpty || rating < 0 {
//            return nil
//        }
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
         
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // Mark: NSCoding
    
    // Persistence

    //func encode(to encoder: Encoder) throws {
        //aCoder.encode(name, forKey: PropertyKey.name)
    //}
}
