import RealmSwift

class UserRepository {
    let realm = try! Realm()
    
    public func createUser(user: UserModel) {
        do {
            try realm.write {
                realm.add(user.asRealmData())
            }
        } catch {
            print("Error saving user: \(error)")
        }
    }
    
    public func getUser(email: String) -> UserModel? {
        let users = realm.objects(UserRealm.self)
        print("jopta list of all users: \(users)")
        if let foundUser = users.first(where: { $0.email == email }) {
            return foundUser.asDomain()
        }
        return nil
    }
    
    public func updateUserInformation() {
        let user = CommonResources.shared.logedInUser!
        let users = realm.objects(UserRealm.self)
        if var foundRealmUser = users.first(where: { $0.email == user.email }) {
            do {
                try realm.write {
                    foundRealmUser = user.asRealmData()
                }
            } catch {
                print("Error updating user data: \(error)")
            }
        }
        
    }
}




//import RealmSwift
//import SwiftUI
//
//class RecipesRepository {
//
//    let realm = try! Realm()
//
//    public func saveRecipe(recipe: RecipeModel) {
//        do {
//            try realm.write {
//                realm.add(recipe.asRealmData())
//            }
//        } catch {
//            print("Error saving recipe: \(error)")
//        }
//    }
//
//    public func loadRecipes() -> [RecipeModel] {
//        let recipes = realm.objects(RecipeRealm.self)
//        return recipes.mapToDomain()
//    }
//}
