//
//  PushTransition.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/23.
//

import UIKit

final class PushTransition: NSObject, Transition {
  
  var animated: Bool = true
  var animator: Animator?
  
  private weak var fromVc: UIViewController?
  
  private var navigationController: UINavigationController? {
    if fromVc != nil {
      return fromVc!.navigationController
    }
    return UIApplication.navigationController
  }
  
  init(animator: Animator?, animated: Bool) {
    self.animator = animator
    self.animated = animated
  }
  
  func open(_ viewController: UIViewController, fromVc: UIViewController?, completion: (() -> Void)?) {
    self.fromVc = fromVc
    navigationController?.delegate = self
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    navigationController?.pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
}

extension Transition where Self == PushTransition {
  
  static func push(animator: Animator?, animated: Bool = true) -> Self {
    Self(animator: animator, animated: animated)
  }
}

extension PushTransition: UINavigationControllerDelegate {
  
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator
  }
}
