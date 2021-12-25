//
//  PopTransition.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/24.
//

import UIKit

final class PopTransition: NSObject, Transition {
  
  var animated: Bool = true
  var animator: Animator?
  
  private weak var toVc: UIViewController?
  
  private var navigationController: UINavigationController? {
    if toVc != nil {
      return toVc!.navigationController
    }
    return UIApplication.navigationController
  }
  
  init(animator: Animator?, animated: Bool) {
    self.animator = animator
    self.animated = animated
  }
  
  func close(_ viewController: UIViewController?, completion: (() -> Void)?) {
    self.toVc = viewController
    navigationController?.delegate = self
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    navigationController?.popViewController(animated: animated)
    CATransaction.commit()
  }
}

extension Transition where Self == PopTransition {
  
  static func pop(animator: Animator?, animated: Bool = true) -> Self {
    Self(animator: animator, animated: animated)
  }
}

extension PopTransition: UINavigationControllerDelegate {
  
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator
  }
}

