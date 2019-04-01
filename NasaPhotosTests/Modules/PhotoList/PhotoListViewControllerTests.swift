//
//  PhotoListViewControllerTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListViewControllerTests
class PhotoListViewControllerTests: QuickSpec {
  
  var viewController: PhotoListViewControllerSpy!
  
  override func spec() {
    
    describe("When instance viewController") {
      
      beforeEach {
        self.viewController = PhotoListViewControllerSpy()
      }
      
      context("and call method input", {
        
        it("createElements, check if is called", closure: {
          self.viewController.createElements()
          expect(self.viewController.functionCalled) == true
        })
        
        it("configElements, check if is called", closure: {
          self.viewController.configElements()
          expect(self.viewController.functionCalled) == true
        })
        
        it("setContrainsInElemens, check if is called", closure: {
          self.viewController.setContrainsInElemens()
          expect(self.viewController.functionCalled) == true
        })
        
        it("fetchPhotos, check if is called", closure: {
          self.viewController.fetchPhotos()
          expect(self.viewController.functionCalled) == true
        })
        
        it("reloadPhotos, check if is called", closure: {
          self.viewController.reloadPhotos(photos: [])
          expect(self.viewController.functionCalled) == true
        })
        
        it("errorFound, check if is called", closure: {
          self.viewController.errorFound()
          expect(self.viewController.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListPresenterInputSpy
final class PhotoListViewControllerSpy: PhotoListViewControllerProtocol {
  
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
  
  func fetchPhotos() {
    self.functionCalled = true
  }
  
  func reloadPhotos(photos: [PhotoView]) {
    self.functionCalled = true
  }
  
  func errorFound() {
    self.functionCalled = true
  }
  
}
