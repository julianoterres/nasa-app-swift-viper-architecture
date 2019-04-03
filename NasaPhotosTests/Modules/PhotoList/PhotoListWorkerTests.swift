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
  
  var worker: PhotoListWorker!
  var interactor: PhotoListInteractorMock?
  var network: NetworkInputMock?
  var api: APIMock?
  
  override func spec() {
    
    describe("When instance worker") {
      
      beforeEach {
        self.interactor = PhotoListInteractorMock()
        self.network = NetworkInputMock()
        self.api = APIMock()
        self.worker = PhotoListWorker()
        self.worker.interactor = self.interactor
        self.worker.network = self.network
        self.worker.api = self.api
      }
      
      context("and call method fetchPhotos", {
        it("should call the request of network", closure: {
          self.worker.fetchPhotos(sonda: "", date: Date())
          expect(self.network?.functionCalled) == true
        })
      })
      
    }
    
  }
  
}
