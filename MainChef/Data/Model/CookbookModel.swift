class CookbookModel {
    let name: String
    var recipesIds: [String]
    
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
