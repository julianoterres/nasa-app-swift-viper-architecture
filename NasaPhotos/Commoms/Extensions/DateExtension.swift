//
//  DateExtension.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

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
