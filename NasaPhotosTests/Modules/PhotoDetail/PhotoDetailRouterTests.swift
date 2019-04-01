//
//  PhotoDetailRouterTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoDetailRouterTests
class PhotoDetailRouterTests: QuickSpec {
  
  var router: PhotoDetailRouter!
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance router") {
      
      beforeEach {
        self.photo = PhotoView(
          urlImage: "http://google.com",
          cameraName: "Nome Camera",
          cameraNameFull: "Nome Camera Full Name"
        )
        self.router = PhotoDetailRouter()
      }
      
      context("and call method", {
        
        it("build, should return a UIViewController", closure: {
          let viewController = self.router.build(photo: self.photo)
          expect(viewController).to(beAKindOf(UIViewController.self))
        })
        
      })
      
    }
    
  }
  
}

