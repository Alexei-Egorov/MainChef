import RealmSwift

class RecipeRealm: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var photo: NSData = NSData()
    @objc dynamic var dishType: String = ""
    @objc dynamic var dishDescription: String = ""
    var ingredients = List<IngredientRealm>()
    var stages = List<String>()
}

extension RecipeRealm: DomainConvertableType {
    func asDomain() -> RecipeModel {
        var stages = [String]()
        stages.append(contentsOf: self.stages)
        return RecipeModel(id: id, name: name, photo: UIImage(data: photo as Data), dishType: dishType, description: dishDescription, ingredients: ingredients.mapToDomain(), stages: stages)
    }
}



//let recipes = realm.objects(RecipeRealm.self)
//var answer = [RecipeModel]()
//
//for recipe in recipes {
//    var ingredients = [String]()
//    ingredients.append(contentsOf: recipe.ingredients)
//    var stages = [String]()
//    stages.append(contentsOf: recipe.stages)
//    answer.append(RecipeModel(id: recipe.id, name: recipe.name, photo: UIImage(data: recipe.photo as Data), dishType: recipe.dishType, description: recipe.dishDescription, ingredients: ingredients, stages: stages))
//}
//
//return answer
