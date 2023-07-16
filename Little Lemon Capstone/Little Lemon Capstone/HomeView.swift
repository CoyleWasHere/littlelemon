//
//  HomeView.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/15/23.
//

import SwiftUI

struct HomeView: View {
    
    let persistence = PersistenceController.shared
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                // MARK: Header with Logo and Profile Image
                HStack(alignment: .center){
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    NavigationLink(destination: UserProfile()) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                // TODO: Adjust colors to proper rgb
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
                        /*TextField("Search Menu", text: $searchText)
                         .multilineTextAlignment(TextAlignment.center)
                         .textFieldStyle(.roundedBorder)*/
                    }
                }
                .padding()
                .background(Color.green)
                
                // TODO: Horizontal Scrollview and clickable buttons
                Group {
                    VStack(alignment: .leading){
                        Text("Order for Delivery")
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                        HStack{
                            Spacer()
                            Text("Starters")
                                .padding(.all, 5.0)
                                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color.gray)
                                .cornerRadius(5)
                            Spacer()
                            Text("Mains")
                                .padding(.all, 5.0)
                                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color.gray)
                                .cornerRadius(5)
                            Spacer()
                            Text("Deserts")
                                .padding(.all, 5.0)
                                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color.gray)
                                .cornerRadius(5)
                            Spacer()
                            Text("Drinks")
                                .padding(.all, 5.0)
                                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color.gray)
                                .cornerRadius(5)
                            Spacer()
                        }
                        .padding(.vertical, 3.0)
                        .frame(maxWidth: .infinity)
                        
                    }
                }
                
                // TODO: Import List of actual meals and adjust spacing
                /* Group {
                 HStack (){
                 VStack{
                 Text("Item 1")
                 Text("Item Description")
                 Text("Price 1")
                 }
                 Spacer()
                 Text("Image 1")
                 }
                 .padding()
                 .frame(maxWidth: .infinity)
                 
                 HStack{
                 VStack{
                 Text("Item 2")
                 Text("Item Description")
                 Text("Price 2")
                 }
                 Spacer()
                 Text("Image 2")
                 }
                 .padding()
                 .frame(maxWidth: .infinity)
                 
                 HStack{
                 VStack{
                 Text("Item 3")
                 Text("Item Description")
                 Text("Price 3")
                 }
                 Spacer()
                 Text("Image 3")
                 }
                 .padding()
                 .frame(maxWidth: .infinity)
                 
                 } */
                
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
