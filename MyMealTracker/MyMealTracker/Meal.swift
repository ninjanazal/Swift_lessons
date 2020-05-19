//
//  Meal.swift
//  MyMealTracker
//
//  Created by Journey Tendency on 07/05/2020.
//  Copyright © 2020 Daniela da Cruz. All rights reserved.
//

import UIKit
// para guardar valores em ficheiros
class Meal : NSObject,NSCoding
{
    // indica o caminha para a directoria do ficheiro, documentos do utilizador atual
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    // guarda o url para o ficheiro meals no dir criado anteriormente
    static let FileURL = DocumentDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    // estrutura com as propriedades em string
    struct PropertyKey{
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: Fields
    var name : String
    var photo : UIImage?
    var rating : Int
    
    init?(name: String, photo: UIImage?, rating: Int)
    {
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating >= 0 && rating <= 5 else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    // indica como é feita a codificaçao
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(photo, forKey: PropertyKey.photo)
        coder.encode(rating,forKey: PropertyKey.rating)
      }
      
      required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else{
            print("Name Can't be empty")
            return nil
        }
        let photo = coder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = coder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, photo: photo, rating: rating)
      }
}
