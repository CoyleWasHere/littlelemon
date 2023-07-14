import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            let dish = Dish(context: context)
            dish.title = menuItem.title
            dish.price = menuItem.price
            dish.image = menuItem.image
            
            try? context.save()
        }
    }
    
}
