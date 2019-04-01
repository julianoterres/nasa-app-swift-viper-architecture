//
//  PhotoListInteractorTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListInteractorTests
class PhotoListInteractorTests: QuickSpec {
  
  override func spec() {
    
    describe("When instance interactor") {
      
      context("and call methods input", {
        
        it("photosDidFetch, check if is called", closure: {
          let interactorInput = PhotoListInteractorInputSpy()
          interactorInput.photosDidFetch(photos: [])
          expect(interactorInput.functionCalled) == true
        })
        
        it("errorPhotosDidFetch, check if is called", closure: {
          let interactorInput = PhotoListInteractorInputSpy()
          interactorInput.errorPhotosDidFetch(message: "")
          expect(interactorInput.functionCalled) == true
        })
        
      })
      
      context("and call methods output", {
        
        it("photosDidFetch, check if is called", closure: {
          let interactorOutput = PhotoListInteractorOutputSpy()
          interactorOutput.photosDidFetch(sonda: "")
          expect(interactorOutput.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListInteractorInputSpy
final class PhotoListInteractorInputSpy: PhotoListInteractorProtocolInput {
  
  var functionCalled = false
  
  func photosDidFetch(photos: [PhotoApi]) {
    self.functionCalled = true
  }
  
  func errorPhotosDidFetch(message: String) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of PhotoListInteractorInputSpy
final class PhotoListInteractorOutputSpy: PhotoListInteractorProtocolOutput {
  
  var functionCalled = false
  var worker: PhotoListWorkerProtocolOutput?
  var presenter: PhotoListPresenterProtocolInput?
  
  func photosDidFetch(sonda: String) {
    self.functionCalled = true
  }
  
}
