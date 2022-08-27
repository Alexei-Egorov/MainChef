import UIKit

class RecipeModel {
    
    let id: String
    let name: String
    let photo: UIImage?
    let dishType: String
    let description: String
    let ingredients: [IngredientModel]
    var stages: [String]
    
    init(id: UUID,
         name: String,
         photo: UIImage? = nil,
         dishType: String,
         description: String,
         ingredients: [IngredientModel],
         stages: [String]) {
        self.id = id.uuidString
        self.name = name
        self.photo = photo
        self.dishType = dishType
        self.description = description
        self.ingredients = ingredients
        self.stages = stages
    }
    
    init(id: String,
         name: String,
         photo: UIImage? = nil,
         dishType: String,
         description: String,
         ingredients: [IngredientModel],
         stages: [String]) {
        self.id = id
        self.name = name
        self.photo = photo
        self.dishType = dishType
        self.description = description
        self.ingredients = ingredients
        self.stages = stages
    }
}

extension RecipeModel: RealmDataConvertableType {
    func asRealmData() -> RecipeRealm {
        let recipeRealm = RecipeRealm()
        recipeRealm.id = id
        recipeRealm.name = name
        recipeRealm.photo = NSData(data: photo!.pngData()!)
        recipeRealm.dishType = dishType
        recipeRealm.dishDescription = description
        recipeRealm.ingredients.append(objectsIn: ingredients.mapToRealm())
        recipeRealm.stages.append(objectsIn: stages)
        
        return recipeRealm
    }
}
