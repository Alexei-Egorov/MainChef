import RealmSwift
import SwiftUI

class RecipesRepository {
    
    let realm = try! Realm()
    
    public func saveRecipe(recipe: RecipeModel) {
        do {
            try realm.write {
                realm.add(recipe.asRealmData())
            }
        } catch {
            print("Error saving recipe: \(error)")
        }
    }
    
    public func loadRecipes() -> [RecipeModel] {
        let recipes = realm.objects(RecipeRealm.self)
        return recipes.mapToDomain()
    }
    
    public func loadCookbookRecipes(cookBook: CookbookModel) -> [RecipeModel] {
        var loadedRecipes = [RecipeModel]()
        cookBook.recipesIds.forEach { recipeId in
            let allRecipes = loadedRecipes
            if let foundedRecipe = allRecipes.first(where: {$0.id == recipeId}) {
                loadedRecipes.append(foundedRecipe)
            }
        }
        return loadedRecipes
    }
}


//public func getUser(email: String) -> UserModel? {
//    let users = realm.objects(UserRealm.self)
//    print("jopta list of all users: \(users)")
//    if let foundUser = users.first(where: { $0.email == email }) {
//        return foundUser.asDomain()
//    }
//    return nil
//}
