//
//  UserProfile.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/13/23.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: "first name key")
    let lastName = UserDefaults.standard.string(forKey: "last name key")
    let email = UserDefaults.standard.string(forKey: "email key")
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                // MARK: Header with Logo and Profile Image
                HStack(alignment: .center){
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Text("Personal Information")
                    .bold()
                
                // MARK: Avatar
                HStack{
                    VStack(alignment: .leading){
                        Text("Avatar")
                            .foregroundColor(Color.gray)
                        Image("profile-image-placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                    Text("Change")
                        .foregroundColor(Color.white)
                        .padding(.all, 5.0)
                        .border(Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .background(Color.gray)
                        .cornerRadius(5)
                    Text("Remove")
                        .padding(.all, 5.0)
                        .border(Color.gray, width: 2)
                        .cornerRadius(5)
                    Spacer()
                }
                .padding()
                
                Form{
                    // MARK: User Information
                    VStack(alignment: .center){
                        Section{
                            Text("First Name")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text(firstName ?? "Placeholder")
                                .padding(.bottom)
                        }
                        
                        Section{
                            Text("Last Name")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text(lastName ?? "Placeholder")
                                .padding(.bottom)
                        }
                        
                        Section{
                            Text("Email")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text(email ?? "Placeholder")
                                .padding(.bottom)
                        }
                    }
                }
                
            }
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: loggedInKey)
                self.presentation.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
            .foregroundColor(Color.yellow)
            .background(Color.green)
            .cornerRadius(5)
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
