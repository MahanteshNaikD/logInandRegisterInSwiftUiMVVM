//
//  RegisterViewModel.swift
//  LogInScreen
//
//  Created by Brigosha_Guest on 26/07/23.
//

import Foundation

class RegisterViewModel : ObservableObject {
    @Published var entryData :[RegisterModel] = []
    var logInStatus : Bool = false
    
    init(){
        
    }
    
    
    func addDataIntoEntryData(data:RegisterModel){
//        let newData = RegisterModel(firstName: data.firstName, middleName: data.middleName, lastName: data.lastName, phoneNumber: data.phoneNumber, address: data.address, district: data.district, pinCode: data.pinCode,state: data.state)
//
//
//        entryData.append(newData)
//
//
//
        
        let url = URL(string:NetWorkCall.baseUrl + "/registerUser" )
       
        var request = URLRequest(url: url!)
  
        request.httpMethod = "POST"
        
        let dataV = [
            "firstName":data.firstName,
            "middleName":data.middleName,
            "lastName":data.lastName,
            "state":data.state,
            "pinCode":data.pinCode,
            "phoneNumber":data.phoneNumber,
            "address":data.address,
            "district":data.district,
            "email":data.email
        ]  as [String:Any]
        let jsonData = try! JSONSerialization.data(withJSONObject: dataV,options: .fragmentsAllowed)
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let task1 = URLSession.shared.dataTask(with: request) {  data, uslResponse, error in
          
            guard data == data, error == nil else {
                
                print(data as Any)
                // handle error
                return
            }
            let stringFromData = String(data: data!, encoding: String.Encoding.ascii)
            
            print(stringFromData)
           
           
                 
        }
        
        task1.resume()
        
        
    }
    
    
    
    func getLogInStatus(email:String) -> Bool {
        let url = URL(string:NetWorkCall.baseUrl + "/logInUser")
       
        var request = URLRequest(url: url!)
        var boolValue : Bool = false
        request.httpMethod = "POST"
        
        let data = [
            "email":email
        ] as [String: Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: data,options: .fragmentsAllowed)
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request.description)
        let task1 = URLSession.shared.dataTask(with: request) {  data, uslResponse, error in
          
           
            if error == nil {
                do {
                    let data = try JSONDecoder().decode(respnose.self, from: data!)
                 
                    if(data.statusCode == 200) {
                        DispatchQueue.global().async {
                            DispatchQueue.main.async { [self] in
                                logInStatus = true
                            }
                        }
                       
                       
                        print("insdeeee\(boolValue)")
                    }else if (data.statusCode == 404){
                        DispatchQueue.global().async {
                            DispatchQueue.main.async { [self] in
                             logInStatus = false
                            }
                        }
                    }
                }catch{
                    
                }
            }else{
                print(error)
            }
               
        }
       
        task1.resume()
        print(boolValue)
        return logInStatus

    }
}
