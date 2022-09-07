import RealmSwift

class UserRealm: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var photo: NSData = NSData()
    var cookbooks = List<CookbookRealm>()
    var shoppingList = List<IngredientRealm>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension UserRealm: DomainConvertableType {
    func asDomain() -> UserModel {
        var cookbooksModel = [CookbookModel]()
        cookbooksModel.append(contentsOf: cookbooks.mapToDomain())
        var ingredients = [IngredientModel]()
        ingredients.append(contentsOf: shoppingList.mapToDomain())
        return UserModel(id: id,
                         name: name,
                         surname: surname,
                         username: username,
                         email: email,
                         password: password,
                         photo: UIImage(data: photo as Data),
                         cookbooks: cookbooksModel,
                         shoppingList: ingredients
        )
    }
}





//import RealmSwift
//
//class RecipeRealm: Object {
//
//    @objc dynamic var id: String = ""
//    @objc dynamic var name: String = ""
//    @objc dynamic var photo: NSData = NSData()
//    @objc dynamic var dishType: String = ""
//    @objc dynamic var dishDescription: String = ""
//    var ingredients = List<IngredientRealm>()
//    var stages = List<String>()
//}
//
//extension RecipeRealm: DomainConvertableType {
//    func asDomain() -> RecipeModel {
//        var stages = [String]()
//        stages.append(contentsOf: self.stages)
//        return RecipeModel(id: id, name: name, photo: UIImage(data: photo as Data), dishType: dishType, description: dishDescription, ingredients: ingredients.mapToDomain(), stages: stages)
//    }
//}


//let id: UUID
//let name: String
//let surname: String
//let username: String
//let email: String
//let password: String
//var photo: UIImage?
//var cookbooks: [CookbookModel]
//var shoppiongList: [IngredientModel]
