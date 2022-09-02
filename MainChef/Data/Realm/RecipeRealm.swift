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
