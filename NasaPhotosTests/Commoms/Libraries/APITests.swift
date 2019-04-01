//
//  APITests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of APITests
class APITests: QuickSpec {
  
  let api = API()
  
  override func spec() {
    
    describe("When instance API") {
      
      context("and call method", {
        
        it("urlRoversPhotos", closure: {
          let url = self.api.urlRoversPhotos(sonda: "curiosity")
          expect(url) == URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos")
        })
        
      })
      
    }
    
  }
  
}
