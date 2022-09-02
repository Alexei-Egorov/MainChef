import RealmSwift

class CookbookRealm: Object {
    
    @objc dynamic var name: String = ""
    var recipesIds = List<String>()
}

extension CookbookRealm: DomainConvertableType {
    func asDomain() -> CookbookModel {
        var recipes = [String]()
        recipes.append(contentsOf: recipesIds)
        return CookbookModel(name: name, recipesIds: recipes)
    }
}




//import RealmSwift
//
//class IngredientRealm: Object {
//
//    @objc dynamic var ingredientType: String = ""
//    @objc dynamic var quantity: Float = 0.0
//}
//
//extension IngredientRealm: DomainConvertableType {
//    func asDomain() -> IngredientModel {
//        return IngredientModel(ingredient: IngredientType(rawValue: ingredientType)!, quantity: quantity)
//    }
//}


//let name: String
//let recipes: [RecipeModel]


//var ingredients = List<IngredientRealm>()
