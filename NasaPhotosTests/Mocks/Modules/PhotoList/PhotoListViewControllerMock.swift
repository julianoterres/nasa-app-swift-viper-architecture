//
//  PhotoListViewControllerMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import UIKit

// MARK: Methods of PhotoListViewControllerMock
class PhotoListViewControllerMock: UIViewController {
  
  var functionCalled = false
  
}

// MARK: Methods of PhotoListViewControllerProtocol
extension PhotoListViewControllerMock: PhotoListViewControllerProtocol {
  
  // MARK: Methods of class
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
