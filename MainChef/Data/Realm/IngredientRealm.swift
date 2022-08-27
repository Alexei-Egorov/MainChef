import RealmSwift

class IngredientRealm: Object {
    
    @objc dynamic var ingredientType: String = ""
    @objc dynamic var quantity: Float = 0.0
}

extension IngredientRealm: DomainConvertableType {
    func asDomain() -> IngredientModel {
        return IngredientModel(ingredient: IngredientType(rawValue: ingredientType)!, quantity: quantity)
    }
}


//enum IngredientType: String, CaseIterable {
//    case chicken, pasta, potatoes, banana, beef, broccoli, pork, eggs, lemon, cheese, peppers, salmon, chocolate, fish
//
//    var image: UIImage {
//        return UIImage(named: self.rawValue)!
//    }
//
//    var quantityType: String {
//        switch self {
//        case .eggs, .lemon, .peppers: return "units"
//        case .cheese, .chocolate: return "g"
//        default: return "kg"
//        }
//    }
//}
//
//class IngredientModel {
//    let ingredientType: IngredientType
//    let quantity: Float
//
//    init(ingredient: IngredientType,
//         quantity: Float,
//         measurment: String) {
//        self.ingredientType = ingredient
//        self.quantity = quantity
//    }
//}
