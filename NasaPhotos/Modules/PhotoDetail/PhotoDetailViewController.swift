//
//  PhotoDetailViewController.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//


import UIKit

// MARK: Methods of PhotoDetailViewController
class PhotoDetailViewController: UIViewController {
  
  // MARK: Elements of class
  var img = UIImageView()
  var label = UILabel()
  
  // MARK: Variables of class
  var photo: PhotoView?
  var presenter: PhotoDetailPresenterProtocolOutput?
  
  // MARK: Methods of life cicle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.createElements()
    self.configElements()
    self.setContrainsInElemens()
  }
  
  // MARK: Methods of class
  func createElements() {
    self.view.addSubview(self.label)
    self.view.addSubview(self.img)
  }
  
  func configElements() {
    self.view.backgroundColor = .white
    let tap = UITapGestureRecognizer(target: self, action: #selector(changeCameraName))
    self.label.text = self.photo?.cameraName ?? ""
    self.label.textAlignment = .left
    self.label.numberOfLines = 0
    self.label.textColor = .black
    self.label.isUserInteractionEnabled = true
    self.label.addGestureRecognizer(tap)
    self.img.contentMode = .scaleAspectFill
    self.img.clipsToBounds = true
    if let urlImage = self.photo?.urlImage, let url = URL(string: urlImage) {
      self.img.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
  }
  
  func setContrainsInElemens() {
    self.label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
      self.label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
      self.label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15)
      ])
    self.img.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.img.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 15),
      self.img.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
      self.img.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
      self.img.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
      ])
  }

}

// MARK: Methods of PhotoDetailViewControllerProtocol
extension PhotoDetailViewController: PhotoDetailViewControllerProtocol {
  
  @objc func changeCameraName() {
    self.label.isUserInteractionEnabled = false
    self.label.text = self.photo?.cameraNameFull ?? ""
  }
  
}
