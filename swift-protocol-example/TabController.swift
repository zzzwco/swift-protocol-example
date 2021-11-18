//
//  TabController.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/17.
//

import Foundation
import UIKit

class TabController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let vc1 = ButtonController()
    vc1.tabBarItem = .init(title: "Button", image: UIImage(systemName: "rectangle.fill"), tag: 0)
    
    let vc2 = RouterController()
    vc2.tabBarItem = .init(title: "Router", image: UIImage(systemName: "arrow.triangle.turn.up.right.circle.fill"), tag: 1)
    
    self.viewControllers = [vc1, vc2].map { BaseNavigationController(rootViewController: $0) }
  }
}

class BaseNavigationController: UINavigationController {}

class BaseController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }
}
