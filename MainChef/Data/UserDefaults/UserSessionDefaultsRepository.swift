import Foundation

class UserSessionDefaultsRepository {
    
    let defaults = UserDefaults.standard
    
    func saveUser(user: UserModel) {
        defaults.set(user.id, forKey: "UserKey")
        defaults.synchronize()
    }
    
    func clearUser(user: UserModel) {
        defaults.set("", forKey: "UserKey")
    }
    
    // return "" if thre is no user
    func getUserId() -> String {
        if let userId = defaults.string(forKey: "UserKey") {
            return userId
        }
        return ""
    }
}
