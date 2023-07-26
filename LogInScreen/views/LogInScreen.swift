//
//  ContentView.swift
//  LogInScreen
//
//  Created by Brigosha_Guest on 24/07/23.
//

import SwiftUI

struct LogInScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var registerViewModel : RegisterViewModel
    
    @State private var isNextViewActive = false
  
    var body: some View {
        ZStack{
            
            
            VStack(){
               
                VStack(alignment: .leading) {
        
                    plaseLoginTextView
             
                    loginImageView
                        
                }
               // .background(.white)
                
               
              
                VStack (alignment: .leading,spacing: 15){
                    userName
                  
                    passwordFiled
              
                    HStack {
                        
                        Text("Not Registered?")
                            .font(.subheadline)
                        
                        Text("Click")
                            .font(.subheadline)
                        
                        
                        NavigationLink(destination: RegistrationPage(), label: {
                            Text("here")
                                .font(.headline)
                                .background(Color("primaryColor"))
                                .foregroundColor(.black)
                        })
                        
                       
                           
                           
                            
                        Text("To Register")
                            .font(.subheadline)
                    }
                    
                    
                    logInButton
                  
                    
                }
                .padding(2)
                
            
            }
           
            .padding()
          
          
           
        }
        .navigationTitle("LogIn")
        .background(Color("primaryColor"))
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
  
    static var previews: some View {
        NavigationView(content: {
            LogInScreen()
                .navigationTitle("LogIn")
               // .environmentObject(RegisterViewModel())
        })
      
        
    }
}


extension LogInScreen {
    private var plaseLoginTextView : some View {
        Text("Please Login to Continue ")
            .font(.headline)
            .fontWeight(.semibold)
            .fontWeight(.medium)
            .multilineTextAlignment(.leading)
        
    }
    
    
    
    private var loginImageView : some View {
        Image("image1")
            .resizable()
           
            .clipped()
            .shadow(color: Color.black.opacity(0.3), radius: 20,x: 0,y: 10)
        
    }
    
    
    
    private var userName : some View {
        TextField("UserName or Email",
                text: $username
            )
        .padding(.horizontal)
        .frame(height: 55)
        .border(.black)
        .background(Color("primaryColor"))
        .cornerRadius(10)
    }
    
    
    private var passwordFiled : some View {
        TextField(
                "Password",
                text: $password
            )
        .padding(.horizontal)
        .frame(height: 55)
        .border(.black)
        .background(Color("primaryColor"))
        .cornerRadius(10)
    }
    
    
    
    private var logInButton : some View {
        
        Button("LOGIN", action: {
            
        
            
            let value =  registerViewModel.getLogInStatus(email: username)
            print(value)
            if(value == true){
                isNextViewActive = true
            }else{
                isNextViewActive = false
            }
           
        })
        .foregroundColor(.black)
        .font(.headline)
        .frame(maxWidth: .infinity)
        .frame(height: 54)
        .background(Color.accentColor)
        .cornerRadius(10)
//        .sheet(isPresented: $isNextViewActive) {
//            RegistrationPage().environmentObject(registerViewModel)
//        }
    }
    
    
  
}





