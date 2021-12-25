//
//  Transition.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/23.
//

import UIKit

protocol Transition {
  
  var animated: Bool { get set }
  var animator: Animator? { get set }
  
  func open(_ viewController: UIViewController, fromVc: UIViewController?, completion: (() -> Void)?)
  func close(_ viewController: UIViewController?, completion: (() -> Void)?)
}

extension Transition {
  
  func open(_ viewController: UIViewController, fromVc: UIViewController?, completion: (() -> Void)?) {}
  func close(_ viewController: UIViewController?, completion: (() -> Void)?) {}
}
