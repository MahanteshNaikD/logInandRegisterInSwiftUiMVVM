//
//  RegistrationModel.swift
//  LogInScreen
//
//  Created by Brigosha_Guest on 26/07/23.
//

import Foundation

struct RegisterModel {
    let email : String
    let firstName :  String
    let middleName : String
    let lastName : String
    let phoneNumber  : String
    let address  : String
    let state : String
    let district : String
    let pinCode : String
    
    
    
    init (email:String,firstName : String, middleName : String,lastName : String,phoneNumber  : String,address  : String, district : String,pinCode : String,state : String){
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.address = address
        self.district = district
        self.pinCode = pinCode
        self.state = state
        
    }
    
}
