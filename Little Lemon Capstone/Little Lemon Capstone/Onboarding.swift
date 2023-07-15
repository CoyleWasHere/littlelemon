//
//  Onboarding.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/13/23.
//

import SwiftUI

let firstNameKey = "first name key"
let lastNameKey = "last name key"
let emailKey = "email key"
let loggedInKey = "logged in key"


struct Onboarding: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    return EmptyView()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Register") {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        return
                    } else {
                        UserDefaults.standard.set(firstName, forKey: firstNameKey)
                        UserDefaults.standard.set(lastName, forKey: lastNameKey)
                        if isValidEmail(email){
                            UserDefaults.standard.set(email, forKey: emailKey)
                        }
                        UserDefaults.standard.set(true, forKey: loggedInKey)
                        isLoggedIn = true
                    }
                }
            }
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: loggedInKey) {
                    isLoggedIn = true
                }
            })
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
