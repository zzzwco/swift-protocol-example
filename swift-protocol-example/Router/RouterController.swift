//
//  RouterController.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/17.
//

import Foundation
import UIKit
import KZRazor

class RouterController: BaseController {
  
  private let textView = UITextView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Router"
    
    let container = UIStackView()
      .kz.axis(.vertical)
      .kz.spacing(10)
      .kz.alignment(.center)
      .kz.addToView(self.view) { make in
        make.centerX.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
      }
    
    textView.kz.cornerRadius(8)
      .kz.border(width: 1, color: .lightGray)
      .kz.addToStackView(container) { make in
        make.width.equalTo(240)
        make.height.equalTo(160)
      }
      .kz.font(.kz.size(18))
      .kz.text("请输入参数...")
    
    let btnA = createButton(tag: 0, title: "Push to page A")
    let btnB = createButton(tag: 1, title: "Push to page B")
    
    container.kz.addArrangedSubview(btnA, customSpacing: 50)
    container.kz.addArrangedSubviews([textView, btnB])
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    UIApplication.dismissKeyboard()
  }
  
  func createButton(tag: Int, title: String) -> UIButton {
    Button().style(.blur(style: .extraLight))
      .kz.font(.kz.size(20).kz.weight(.medium))
      .kz.titleColor(.systemBlue)
      .kz.tag(tag)
      .kz.title(title)
      .kz.addTarget(self, action: #selector(self.push(sender:)), for: .touchUpInside)
  }
  
  @objc func push(sender: UIButton) {
    switch sender.tag {
    case 0:
      Router.shared.open(Router1.pageA, transition: .automatic(.present), fromVc: nil, completion: nil)
    case 1:
      Router.shared.open(Router1.pageB(params: textView.text),
                         transition: .push(animator: FadeAnimator(duration: 2)), fromVc: nil) {
        print("Did push")
      }
    default:
      break
    }
  }
}
