//
//  PhotoDetailViewControllerTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoDetailViewControllerTests
class PhotoDetailViewControllerTests: QuickSpec {
  
  var viewController: PhotoDetailViewController!
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance PhotoDetailViewController") {
      
      beforeEach {
        self.photo = PhotoView(urlImage: "http://google.com", cameraName: "Nome Camera", cameraNameFull: "Nome Camera Full Name")
        self.viewController = PhotoDetailViewController()
        self.viewController.photo = self.photo
        self.viewController.viewDidLoad()
      }
      
      context("and after method viewDidLoad", {
        it("shpuld labels have text", closure: {
          expect(self.viewController.label.text) == self.photo?.cameraName ?? ""
        })
      })
      
      context("and call method changeCameraName", {
        it("should label have change text", closure: {
          self.viewController.changeCameraName()
          expect(self.viewController.label.text) == self.photo?.cameraNameFull ?? ""
          expect(self.viewController.label.isUserInteractionEnabled) == false
        })
      })
      
    }
    
  }
  
}
