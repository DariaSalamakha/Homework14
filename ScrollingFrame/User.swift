//
//  User.swift
//  ScrollingFrame
//
//  Created by Daria Salamakha on 14.02.2022.
//

import Foundation

struct User {
    let name: String
    let surname: String
    let adress1: String
    let adress2: String
    let city: String
    let state: String
    let zipCode: String
    let phoneNumber: String
    let somethingEmpty: Bool
    
    var description: String {
        if somethingEmpty {
            return "Please fill in the value."
        } else {
            return """
        User: \(name) \(surname)
        Address: \(adress1) \(adress2) city \(city), \(state)
        Zip code: \(zipCode)
        Phone number: \(phoneNumber)
        """
        }
    }
}
