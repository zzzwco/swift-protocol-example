//
//  BController.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/18.
//

import Foundation
import KZRazor

class BController: BaseController {
  
  private var params: String = ""
  
  init(params: String) {
    self.params = params
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "B"
    
    KZLabel().kz.numberOfLines(0)
      .kz.text(params)
      .kz.addToView(view) { make in
        make.center.equalToSuperview()
      }
  }
}
