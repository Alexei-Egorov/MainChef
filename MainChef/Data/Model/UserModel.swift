import UIKit

class UserModel {
    
    let id: String
    let name: String
    let surname: String
    let username: String
    let email: String
    let password: String
    var photo: UIImage?
    var cookbooks: [CookbookModel]
    var shoppiongList: [IngredientModel]
    
    init(id: String,
         name: String,
         surname: String,
         username: String,
         email: String,
         password: String,
         photo: UIImage?,
         cookbooks: [CookbookModel],
         shoppingList: [IngredientModel]) {
        self.id = id
        self.name = name
        self.surname = surname
        self.username = username
        self.email = email
        self.password = password
        self.photo = photo
        self.cookbooks = cookbooks
        self.shoppiongList = shoppingList
    }
}

extension UserModel: RealmDataConvertableType {
    func asRealmData() -> UserRealm {
        print("jopta mapping user data to realm with cookbooks count: \(cookbooks.count)")
        let userRealm = UserRealm()
        userRealm.id = id
        userRealm.name = name
        userRealm.surname = surname
        userRealm.username = username
        userRealm.email = email
        userRealm.password = password
        userRealm.photo = NSData(data: photo?.pngData() ?? Data())
        userRealm.cookbooks.append(objectsIn: cookbooks.mapToRealm())
        userRealm.shoppingList.append(objectsIn: shoppiongList.mapToRealm())
        
        return userRealm
    }
}


//extension RecipeModel: RealmDataConvertableType {
//    func asRealmData() -> RecipeRealm {
//        let recipeRealm = RecipeRealm()
//        recipeRealm.id = id
//        recipeRealm.name = name
//        recipeRealm.photo = NSData(data: photo!.pngData()!)
//        recipeRealm.dishType = dishType
//        recipeRealm.dishDescription = description
//        recipeRealm.ingredients.append(objectsIn: ingredients.mapToRealm())
//        recipeRealm.stages.append(objectsIn: stages)
//
//        return recipeRealm
//    }
//}
