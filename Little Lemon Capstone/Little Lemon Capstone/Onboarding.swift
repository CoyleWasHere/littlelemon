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
                // MARK: Header with logo
                HStack(alignment: .center){
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                Spacer()
                
                // MARK: Little Lemon Description
                Group {
                    VStack {
                        HStack{
                            VStack(alignment: .leading){
                                Text("Little Lemon")
                                    .font(.title)
                                    .foregroundColor(Color.yellow)
                                    .bold()
                                Text("Chicago")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .padding(.bottom)
                                Text("We are a family owned Mediterranean restauraunt, focused on traditional recipes served with a modern twist")
                                    .font(.body)
                                    .foregroundColor(Color.white)
                            }
                            
                            Image("Hero image")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                        }
                    }
                }
                .padding()
                .background(.green)
                Spacer()
                
                // MARK: Form
                Text("Please Create an Account to Continue")
                VStack(alignment: .leading) {
                    Text("First Name*")
                        .foregroundColor(Color.gray)
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Last Name*")
                        .foregroundColor(Color.gray)
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Email*")
                        .foregroundColor(Color.gray)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                Spacer()

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
                .buttonStyle(.bordered)
                .foregroundColor(Color.yellow)
                .background(Color.green)
                .cornerRadius(5)
                Spacer()

                
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
