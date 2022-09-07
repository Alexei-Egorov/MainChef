import Foundation

class CommonResources {
    let userRepository = UserRepository()
    let userDefaultsRepository = UserSessionDefaultsRepository()
    
    var isUserLoggedIn = false
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
    
    func checkDefaults() {
        let currentUserId = userDefaultsRepository.getUserId()
        guard !currentUserId.isEmpty else {
            print("There is no current user")
            return
        }
        if let user = userRepository.getUser(id: currentUserId) {
            isUserLoggedIn = true
            logedInUser = user
        }
    }
    
    func setUser() {
        userDefaultsRepository.saveUser(user: logedInUser)
    }
    
    func updateUser() {
        userRepository.updateUserInformation(user: logedInUser)
    }
    
}
