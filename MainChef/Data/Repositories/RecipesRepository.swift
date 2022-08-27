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
}
