//
//  PhotoListApiTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

class PhotoListApiTests: QuickSpec {
  
  override func spec() {
    
    describe("When instance a object PhotoListApi") {
      
      context("we need that", {
        it("the values be this", closure: {
          let photoCameraApiOne = PhotoCameraApi(
            id: 1,
            rover_id: 2,
            full_name: "Full Name",
            name: "Name"
          )
          let photoApiOne = PhotoApi(
            sol: 1,
            id: 2,
            earth_date: "2019-04-02",
            camera: photoCameraApiOne,
            img_src: "http://google.com"
          )
          let photoListApi = PhotoListApi(
            photos: [photoApiOne]
          )
          expect(photoListApi.photos.count) == 1
          expect(photoListApi.photos[0].sol) == 1
          expect(photoListApi.photos[0].id) == 2
          expect(photoListApi.photos[0].earth_date) == "2019-04-02"
          expect(photoListApi.photos[0].img_src) == "http://google.com"
          expect(photoListApi.photos[0].camera?.id) == 1
          expect(photoListApi.photos[0].camera?.rover_id) == 2
          expect(photoListApi.photos[0].camera?.full_name) == "Full Name"
          expect(photoListApi.photos[0].camera?.name) == "Name"
        })
      })
      
    }
    
  }
  
}
