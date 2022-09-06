import Foundation

class CommonResources {
    
    var isUserLoggedIn = true
    var logedInUser: UserModel!
    
    let ingredients = ["Chicken",
                       "Pasta",
                       "Potatoes",
                       "Banana",
                       "Beef",
                       "Broccoli",
                       "Pork",
                       "Eggs",
                       "Lemon",
                       "Cheese",
                       "Peppers",
                       "Salmon",
                       "Chocolate",
                       "Fish"].sorted(by: {$0 < $1})
    //Strawberry
    //Beakon
    
    let dishTypes = ["Soap", "Dinner", "Breakfast", "Bread", "Main Dish", "Dessert", "Salad", "Appetizer", "Beverage"]
    
    
    static let shared: CommonResources = {
        let overall = CommonResources()
        return overall
    }()
    
}
