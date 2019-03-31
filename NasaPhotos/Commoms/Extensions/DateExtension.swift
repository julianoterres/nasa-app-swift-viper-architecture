
import Foundation

extension Date {
  
  var convert_to_yyyy_mm_dd: String {
    let df = DateFormatter()
    df.locale = Locale(identifier: "pt_BR")
    df.dateFormat = "yyyy-MM-dd"
    return df.string(from: self)
  }
  
  func adding(_ comp: Calendar.Component, _ value: Int) -> Date {
    return Calendar.current.date(byAdding: comp, value: value, to: self)!
  }
  
}
