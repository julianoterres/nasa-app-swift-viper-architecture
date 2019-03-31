
import Foundation
import UIKit

protocol PhotoDetailRouterWireframe: class {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
}
