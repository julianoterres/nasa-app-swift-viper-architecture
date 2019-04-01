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
  
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance PhotoDetailViewController") {
      
      beforeEach {
        self.photo = PhotoView(urlImage: "http://google.com", cameraName: "Nome Camera", cameraNameFull: "Nome Camera Full Name")
      }
      
      context("the method", {
        
        it("createElements can call", closure: {
          let viewController = PhotoDetailViewControllerSpy()
          viewController.createElements()
          expect(viewController.functionCalled) == true
        })
        
        it("configElements can call", closure: {
          let viewController = PhotoDetailViewControllerSpy()
          viewController.configElements()
          expect(viewController.functionCalled) == true
        })
        
        it("setContrainsInElemens can call", closure: {
          let viewController = PhotoDetailViewControllerSpy()
          viewController.setContrainsInElemens()
          expect(viewController.functionCalled) == true
        })
        
        it("changeCameraName can call", closure: {
          let viewController = PhotoDetailViewControllerSpy()
          viewController.changeCameraName()
          expect(viewController.functionCalled) == true
        })
        
      })
      
      context("and after viewDidLoad be execute", {
        
        it("the elements not be nil", closure: {
          let viewController = PhotoDetailViewController()
          viewController.photo = self.photo
          viewController.viewDidLoad()
          expect(viewController.img).toNot(beNil())
          expect(viewController.label).toNot(beNil())
        })
        
        it("the elements should have the values", closure: {
          let viewController = PhotoDetailViewController()
          viewController.photo = self.photo
          viewController.viewDidLoad()
          expect(viewController.img.kf.webURL)  == URL(string: "http://google.com")!
          expect(viewController.label.text) == "Nome Camera"
          expect(viewController.label.isUserInteractionEnabled) == true
        })
        
      })
      
      context("and after tap in label", {
        
        it("the elements should have the values", closure: {
          let viewController = PhotoDetailViewController()
          viewController.photo = self.photo
          viewController.viewDidLoad()
          viewController.changeCameraName()
          expect(viewController.label.text) == "Nome Camera Full Name"
          expect(viewController.label.isUserInteractionEnabled) == false
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoDetailViewControllerSpy
final class PhotoDetailViewControllerSpy: PhotoDetailViewControllerProtocol {
  
  var photo: PhotoView?
  var functionCalled = false
  
  func createElements() {
    self.functionCalled = true
  }
  
  func configElements() {
    self.functionCalled = true
  }
  
  func setContrainsInElemens() {
    self.functionCalled = true
  }
  
  func changeCameraName() {
    self.functionCalled = true
  }
  
}


