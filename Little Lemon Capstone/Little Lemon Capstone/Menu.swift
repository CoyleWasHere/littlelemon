//
//  Menu.swift
//  Little Lemon Capstone
//
//  Created by Daniel Coyle on 7/13/23.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    @State var descriptions = ["Fantastic", "Delish", "Yummy", "Sooooo Goooooood", "My Favorite"]
    @State var randomInt = Int.random(in: 0...4)
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Search Menu", text: $searchText)
                    .multilineTextAlignment(TextAlignment.center)
                    .textFieldStyle(.roundedBorder)
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            HStack{
                                Spacer()
                                NavigationLink {
                                    Text("This food is \(descriptions[randomInt])")
                                } label: {
                                    VStack(alignment: .leading){
                                        Text(dish.title ?? "")
                                            .font(.title3)
                                            .bold()
                                        Text("Try our delicious food")
                                            .font(.body)
                                            .foregroundColor(Color.gray)
                                        Text("$" + (dish.price ?? ""))
                                            .font(.title3)
                                            .foregroundColor(Color.gray)
                                    }
                                    
                                }
                                Spacer()
                                AsyncImage(url: URL(string: dish.image ?? ""))
                                    .frame(width: 100, height: 100)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .onAppear{
                getMenuData()
            }
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let menu = try? decoder.decode(MenuList.self, from: data)
                let fullMenuArray = menu?.menu
                
                for menuItems in fullMenuArray! {
                    // guard let _ = exists(name: menuItems.title, viewContext) else {continue}
                    let dish = Dish(context: viewContext)
                    dish.title = menuItems.title
                    dish.price = menuItems.price
                    
                    print(dish.price!)
                    try? viewContext.save()
                }
                
            }
        }
        dataTask.resume()
    }
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    struct Menu_Previews: PreviewProvider {
        static var previews: some View {
            Menu()
        }
    }
}
