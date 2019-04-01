//
//  PhotoApiTests.swift
//  PhotoApiTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

class PhotoApiTests: QuickSpec {
  
  override func spec() {
    
    describe("When instance a object PhotoApiTests") {
      
      context("we need that", {
        
        it("the values be this", closure: {
          let photoCameraApi = PhotoCameraApi(
            id: 1,
            rover_id: 2,
            full_name: "Full Name",
            name: "Name"
          )
          let photoApi = PhotoApi(
            sol: 1,
            id: 2,
            earth_date: "2019-04-02",
            camera: photoCameraApi,
            img_src: "http://google.com"
          )
          expect(photoApi.sol) == 1
          expect(photoApi.id) == 2
          expect(photoApi.earth_date) == "2019-04-02"
          expect(photoApi.img_src) == "http://google.com"
          expect(photoApi.camera?.id) == 1
          expect(photoApi.camera?.rover_id) == 2
          expect(photoApi.camera?.full_name) == "Full Name"
          expect(photoApi.camera?.name) == "Name"
        })
        
      })
      
    }
    
  }
  
}

