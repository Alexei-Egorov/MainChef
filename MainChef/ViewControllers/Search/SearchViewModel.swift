class SearchViewModel {
    
    let recipesRepository = RecipesRepository()
    
    var isSearching: Bool = false
    
    var loadedRecipes = [RecipeModel]()
    var presentedRecipes = [RecipeModel]()
    var allIngredeints = IngredientType.allCases
    
    func loadRecipes() {
        loadedRecipes = recipesRepository.loadRecipes()
        updateRecipes()
    }
    
    private func updateRecipes() {
        if isSearching {
            
        } else {
            presentedRecipes = loadedRecipes
        }
    }
}
