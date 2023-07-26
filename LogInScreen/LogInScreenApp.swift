//
//  LogInScreenApp.swift
//  LogInScreen
//
//  Created by Brigosha_Guest on 24/07/23.
//

import SwiftUI

@main
struct LogInScreenApp: App {
    @StateObject var registerViewModel : RegisterViewModel = RegisterViewModel()
    var body: some Scene {
        
       
        
        WindowGroup {
            NavigationView(content: {
                LogInScreen()
            })
            .environmentObject(registerViewModel)
           
        }
    }
}
