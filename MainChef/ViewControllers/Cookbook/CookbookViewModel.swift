class CookbookViewModel {
    
    let recipesRepository = RecipesRepository()
    let userRepository = UserRepository()
    var recipesToShow = [RecipeModel]()
    var usersCookbooks = [CookbookModel]()
    var selectedCookBook: CookbookModel?
    
    init() {
        self.updateUsersCookbooks()
    }
    
    func updateUsersCookbooks() {
        usersCookbooks = CommonResources.shared.logedInUser.cookbooks
    }
    
    func loadCookbookRecipes() {
        if let cookbook = selectedCookBook {
            recipesToShow = recipesRepository.loadCookbookRecipes(cookBook: cookbook)
        }
    }
    
    func createCookbook(name: String) {
        print("jopta creating new cookbook with name: \(name)")
        let newCookbook = CookbookModel(name: name, recipesIds: [])
        CommonResources.shared.logedInUser.cookbooks.append(newCookbook)
        updateUsersCookbooks()
        userRepository.updateUserInformation()
    }
}
