
import Foundation

extension Date {
  
  var convert_to_yyyy_mm_dd: String {
    let df = DateFormatter()
    df.locale = Locale(identifier: "pt_BR")
    df.dateFormat = "yyyy-MM-dd"
    return df.string(from: self)
  }
  
}
