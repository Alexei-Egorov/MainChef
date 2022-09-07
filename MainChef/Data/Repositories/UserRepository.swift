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
        if let foundUser = users.first(where: { $0.email == email }) {
            return foundUser.asDomain()
        }
        return nil
    }
    
    public func getUser(id: String) -> UserModel? {
        let users = realm.objects(UserRealm.self)
        if let foundUser = users.first(where: { $0.id == id }) {
            print("jopta foud user: \(foundUser)")
            return foundUser.asDomain()
        }
        return nil
    }
    
    public func updateUserInformation(user: UserModel) {
        var item = realm.object(ofType: UserRealm.self, forPrimaryKey: user.id)
        do {
            try realm.write {
                realm.add(user.asRealmData(), update: .modified)
            }
        } catch {
            print("Error updating user")
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
