//
//  Animator.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/23.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
  
  var duration: TimeInterval { get set }
}
