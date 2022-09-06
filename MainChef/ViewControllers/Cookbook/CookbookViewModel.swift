class CookbookViewModel {
    
    let recipesRepository = RecipesRepository()
    let userRepository = UserRepository()
    var recipesToShow = [RecipeModel]()
    var usersCookbooks: [CookbookModel]
    var selectedCookBook: CookbookModel!
    
    init() {
        usersCookbooks = CommonResources.shared.logedInUser.cookbooks
    }
    
    func loadCookbookRecipes() {
        recipesToShow = recipesRepository.loadCookbookRecipes(cookBook: selectedCookBook)
    }
    
    func createCookbook(name: String) {
        let newCookbook = CookbookModel(name: name, recipesIds: [])
        CommonResources.shared.logedInUser.cookbooks.append(newCookbook)
        userRepository.updateUserInformation()
    }
}
