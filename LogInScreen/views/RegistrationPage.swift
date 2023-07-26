//
//  RegistrationPage.swift
//  LogInScreen
//
//  Created by Brigosha_Guest on 25/07/23.
//

import SwiftUI

struct RegistrationPage: View {
    
    var CountyCodes : Array = ["code","91","92","93","94","95"]
    
    
    @State var showAlert:Bool = false
    
    @EnvironmentObject var registerViewModel : RegisterViewModel
    
    @State var firstName : String = ""
    @State var middleName : String = ""
    @State var lastName : String = ""
    @State var phoneNumber : String = ""
    @State var email : String = ""
    @State var countyCode : String = ""
    @State var Address : String = ""
    @State var state : String = ""
    @State var District : String = ""
    @State var PinCode : String = ""
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ScrollView(){
               
                VStack (spacing: 20){
                  
                   
                    Text("Plase Fill Your Information")
                        .font(.headline)
                        .fontWeight(.medium)
                  
                    
                    TextField("Enter Your Email",text: $email)
                      
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                       
                    
                    
                    
                    TextField("Enter Your First Name",text: $firstName)
                      
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                   
                
                    
                    TextField("Enter Your Middle Name",text: $middleName)
                       
                        .frame(height: 55)
                       
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
              
                  
                    
                    TextField("Enter Your Last Name",text: $lastName)
                        .frame(height: 55)
                      
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                  
                 
             
                 
                   
                   
                    HStack(spacing: 20) {
                        
                       
                        
                        Picker("Code", selection: $countyCode, content: {
                            ForEach(CountyCodes,id: \.self ,content: {code in
//                                Text("").tag("")
                                Text(code)
                                    .foregroundColor(.gray)
                                    .font(.system(.body).bold())
                              })
                        })
                        .frame(width:  80)
                      
                        .frame(height: 55)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)

                        
                        TextField("Enter Your Phone Number",text: $phoneNumber)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .background(Color("primaryColor"))
                            .border(.black)
                            .cornerRadius(10)
                    
                    }
                    
                    
                    TextField("Enter Your Address",text: $Address)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                    
                    
                    TextField("Enter Your State",text:$state )
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
//
                    
                    
                    TextField("Enter Your District",text: $District)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                    
                    
                    TextField("Enter Your PinCode",text: $PinCode)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("primaryColor"))
                        .border(.black)
                        .cornerRadius(10)
                       
                    
               
                }
                .padding()
              
                
               
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("primaryColor"))
            
          
            
            VStack() {
                Button("Register", action: {
                    registerViewModel.addDataIntoEntryData(data: RegisterModel(email: email, firstName: firstName, middleName: middleName, lastName: lastName, phoneNumber: countyCode + phoneNumber , address: Address, district: District, pinCode: PinCode,state: state))
                    
                    self.showAlert = true
                })
                .foregroundColor(.black)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(20)
               
            }
        }
        .navigationTitle("Registration Page")
        .alert(isPresented: $showAlert, content: getAlert)
        
        
        
    }
    
    
    func getAlert ()-> Alert {
        return Alert(title: Text("Registered Successfull"))
    }
}

struct RegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
       
        NavigationView(content: {
            RegistrationPage()
                .navigationTitle("RegistrationPage")
        })
        .environmentObject(RegisterViewModel())
       
       
    }
}
