//
//  DateExtensionTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of APITests
class DateExtensionTests: QuickSpec {
  
  override func spec() {
    
    describe("When use date extension") {
      
      context("and call method convert_to_yyyy_mm_dd", {
        it("should return a date formated", closure: {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd/MM/yyyy"
          dateFormatter.timeZone = TimeZone(abbreviation: "GMT-4:00")
          if let date = dateFormatter.date(from: "02/04/2019") {
            expect(date.convert_to_yyyy_mm_dd) == "2019-04-02"
          } else {
            fail("Failed create date")
          }
        })
      })
      
    }
    
  }
  
}
