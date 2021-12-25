//
//  CardController.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/17.
//

import Foundation
import KZRazor

class ButtonController: BaseController {
  
  private let container = UIStackView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Button"
    
    container.kz.axis(.vertical)
      .kz.alignment(.center)
      .kz.spacing(30)
      .kz.addToView(self.view) { make in
        make.center.equalToSuperview()
      }
    
    createGroupView(
      button: Button().style(.automatic).kz.title("Hello World!"),
      descLabel: createDescL(text: ".style(.automatic)"))
    
    createGroupView(
      button: Button().style(.blur(style: .systemThickMaterialLight)).kz.title("Hello World!"),
      descLabel: createDescL(text: ".style(.blur(style: .systemUltraThinMaterialDark))"))
    
    createGroupView(
      button: Button().style(.blur(style: .systemUltraThinMaterialDark)).kz.title("Hello World!"),
      descLabel: createDescL(text: ".style(.blur(style: .systemUltraThinMaterialDark))"))
    
    createGroupView(
      button: Button().style(.shadow).kz.title("Hello World!"),
      descLabel: createDescL(text: ".style(.shadow)"))
  }
  
  func createGroupView(button: UIButton, descLabel: KZLabel) {
    UIStackView().kz.axis(.vertical).kz.alignment(.center).kz.spacing(10)
      .kz.addArrangedSubviews([button, descLabel])
      .kz.addToStackView(container)
  }
  
  func createDescL(text: String) -> KZLabel {
    KZLabel().kz.font(.kz.size(10)).kz.textColor(.lightGray).kz.text(text)
  }
  
}
