//
//  PhotoListCell.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Methods of PhotoListCell
class PhotoListCell: UICollectionViewCell {
  
  // MARK: Elements of class
  private let img = UIImageView()
  
  // MARK: Methods of class
  func setup(photo: PhotoView) {
    self.createElements()
    self.configElements(photo: photo)
    self.setContrainsInElemens()
  }
  
  private func createElements() {
    self.contentView.addSubview(self.img)
  }
  
  private func configElements(photo: PhotoView) {
    self.contentView.clipsToBounds = true
    self.img.contentMode = .scaleAspectFill
    self.img.kf.indicatorType = .activity
    if let urlImage = photo.urlImage, let url = URL(string: urlImage) {
      self.img.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
  }
  
  private func setContrainsInElemens() {
    self.img.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.img.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
      self.img.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
      self.img.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
      self.img.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
    ])
  }
  
}
