//
//  AController.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/18.
//

import Foundation
import UIKit
import KZRazor

class AController: BaseController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "A"
    
    KZLabel().kz.text("无参数")
      .kz.addToView(view) { make in
        make.center.equalToSuperview()
      }
  }
}
