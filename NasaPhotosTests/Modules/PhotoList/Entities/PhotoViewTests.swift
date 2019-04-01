//
//  PhotoViewTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

class PhotoViewTests: QuickSpec {
  
  override func spec() {
    
    describe("When instance a object PhotoView") {
      
      context("we need that", {
        
        it("the values be this", closure: {
          let photoView = PhotoView (
            urlImage: "http://google.com",
            cameraName: "Name",
            cameraNameFull: "Full Name"
          )
          expect(photoView.urlImage) == "http://google.com"
          expect(photoView.cameraName) == "Name"
          expect(photoView.cameraNameFull) == "Full Name"
        })
        
      })
      
    }
    
  }
  
}
