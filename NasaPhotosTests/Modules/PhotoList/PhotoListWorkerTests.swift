//
//  PhotoListWorkerTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListViewControllerTests
class PhotoListWorkerTests: QuickSpec {
  
  var worker: PhotoListWorkerOutputSpy!
  
  override func spec() {
    
    describe("When instance worker") {
      
      beforeEach {
        self.worker = PhotoListWorkerOutputSpy()
      }
      
      context("and call method input", {
        
        it("fetchPhotos, check if is called", closure: {
          self.worker.fetchPhotos(sonda: "", date: Date())
          expect(self.worker.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListWorkerSpy
final class PhotoListWorkerOutputSpy: PhotoListWorkerProtocolOutput {
  
  var api: API?
  var network: NetworkProtocolInput?
  var interactor: PhotoListInteractorProtocolInput?
  var functionCalled = false
  
  func fetchPhotos(sonda: String, date: Date) {
    self.functionCalled = true
  }
  
}
