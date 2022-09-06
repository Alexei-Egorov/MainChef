class CookbookModel {
    let name: String
    let recipesIds: [String]
    
    init(name: String, recipesIds: [String]) {
        self.name = name
        self.recipesIds = recipesIds
    }
}

extension CookbookModel: RealmDataConvertableType {
    func asRealmData() -> CookbookRealm {
        let cookbookRealm = CookbookRealm()
        cookbookRealm.name = name
        cookbookRealm.recipesIds.append(objectsIn: recipesIds)
        return cookbookRealm
    }
}


//extension IngredientModel: RealmDataConvertableType {
//    func asRealmData() -> IngredientRealm {
//        let ingredientRealm = IngredientRealm()
//        ingredientRealm.ingredientType = ingredientType.rawValue
//        ingredientRealm.quantity = quantity
//        return ingredientRealm
//    }
//}
