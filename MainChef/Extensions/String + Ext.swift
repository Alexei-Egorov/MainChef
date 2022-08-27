import Foundation

extension String {
    var floatValue: Float {
        var str = self
        if self.contains(",") {
            str = self.replacingOccurrences(of: ",", with: ".")
        }
        return (str as NSString).floatValue
    }
}
