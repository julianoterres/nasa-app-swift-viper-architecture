
import UIKit
import Kingfisher

class PhotoListCell: UICollectionViewCell {
  
  private let img = UIImageView()
  
  func setup(photo: PhotoEntityView) {
    self.createElements()
    self.configElements(photo: photo)
    self.setContrainsInElemens()
  }
  
  private func createElements() {
    self.contentView.addSubview(self.img)
  }
  
  private func configElements(photo: PhotoEntityView) {
    self.contentView.backgroundColor = .red
    self.contentView.clipsToBounds = true
    self.img.contentMode = .scaleAspectFill
    if let urlImage = photo.urlImage, let url = URL(string: urlImage) {
      self.img.kf.setImage(with: url)
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
