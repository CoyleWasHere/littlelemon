//
//  Home.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/13/23.
//

import SwiftUI
import CoreData

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Text("Home Page")
                .tabItem({Label("Home", systemImage: "house")})
            Menu()
                .tabItem({Label("Menu", systemImage: "menucard")})
                .environment(\.managedObjectContext, persistence.container.viewContext)
            
            UserProfile()
                .tabItem({Label("Profile", systemImage: "person")})
        }
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
