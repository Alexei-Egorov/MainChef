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
    
    public func getUser(id: String) -> UserModel? {
        let users = realm.objects(UserRealm.self)
        print("jopta list of all users: \(users)")
        if let foundUser = users.first(where: { $0.id == id }) {
            return foundUser.asDomain()
        }
        return nil
    }
    
    public func updateUserInformation() {
        print("jopta updating user information")
        let user = CommonResources.shared.logedInUser!
        let users = realm.objects(UserRealm.self)
        if var foundRealmUser = users.first(where: { $0.email == user.email }) {
            print("jopta foundedRealsUser: \(foundRealmUser)")
            do {
                try realm.write {
                    print("jopta writing user data to realm: \(user.cookbooks.count)")
//                    let cookbooks = List<CookbookRealm>()
//                    cookbooks.append(objectsIn: user.cookbooks.mapToRealm())
//                    foundRealmUser.cookbooks = cookbooks
//                    realm.add(user.asRealmData(), update: true)
                    realm.add(user.asRealmData(), update: .all)
                    
                    print("finished writing user data with new user: \(foundRealmUser)")
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
