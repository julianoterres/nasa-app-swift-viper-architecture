import UIKit

// MARK: Methods of PhotoDetailViewController

class PhotoDetailViewController: UIViewController {
  
  // MARK: Elements of class
  private let label = UILabel()
  
  // MARK: Variables of class
  
  
  // MARK: Methods of init
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("\(#file) \(#function) not implemented")
  }
  
  // MARK: Methods of life cicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.createElements()
    self.configElements()
    self.setContrainsInElemens()
  }
  
  // MARK: Methods of class
  
  private func createElements() {
    self.view.addSubview(self.label)
  }
  
  private func configElements() {
    self.title = "Detalhes da foto"
    self.view.backgroundColor = .white
    self.label.text = "Tela de detalhes da foto"
  }
  
  private func setContrainsInElemens() {
    self.label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
  }
  
}
