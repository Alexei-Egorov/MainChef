import UIKit

enum IngredientType: String, CaseIterable {
    case chicken, pasta, potatoes, banana, beef, broccoli, pork, eggs, lemon, cheese, peppers, salmon, chocolate, fish
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
    
    var quantityType: String {
        switch self {
        case .eggs, .lemon, .peppers: return "units"
        case .cheese, .chocolate: return "g"
        default: return "kg"
        }
    }
}

class IngredientModel {
    let ingredientType: IngredientType
    let quantity: Float
    
    init(ingredient: IngredientType,
         quantity: Float) {
        self.ingredientType = ingredient
        self.quantity = quantity
    }
}

extension IngredientModel: RealmDataConvertableType {
    func asRealmData() -> IngredientRealm {
        let ingredientRealm = IngredientRealm()
        ingredientRealm.ingredientType = ingredientType.rawValue
        ingredientRealm.quantity = quantity
        return ingredientRealm
    }
}
