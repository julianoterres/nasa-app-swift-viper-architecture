//
//  PhotoCameraApiTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

class PhotoCameraApiTests: QuickSpec {
  
  override func spec() {
    
    describe("When instance a object PhotoCameraApi") {
      
      context("we need that", {
        
        it("the values be this", closure: {
          let photoCameraApi = PhotoCameraApi(
            id: 1,
            rover_id: 2,
            full_name: "Full Name",
            name: "Name"
          )
          expect(photoCameraApi.id) == 1
          expect(photoCameraApi.rover_id) == 2
          expect(photoCameraApi.full_name) == "Full Name"
          expect(photoCameraApi.name) == "Name"
        })
        
      })
      
    }
    
  }
  
}


