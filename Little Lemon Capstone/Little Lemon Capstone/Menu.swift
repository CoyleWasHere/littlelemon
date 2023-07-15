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
    
    var body: some View {
        
        VStack {
            TextField("Search Menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            Text(dish.title ?? "TITLE")
                            Text(dish.price ?? "PRICE")
                            AsyncImage(url: URL(string: dish.image ?? ""))
                        }
                    }
                }
        }
        .onAppear{
            getMenuData()
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
