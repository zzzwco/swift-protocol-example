//
//  Button.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/17.
//

import Foundation
import KZRazor

class Button<S: ButtonStyle>: UIButton {
  
  override var isHighlighted: Bool {
    didSet {
      self.alpha = isHighlighted ? 0.6 : 1.0
    }
  }
  
  private var style: S?
  
  @discardableResult
  func style(_ style: S) -> Self {
    self.style = style
    style.config(self)
    return self
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.kz.padding(top: 8, bottom: 8, left: 16, right: 16)
      .kz.backgroundColor(.white)
      .kz.cornerRadius(8)
      .kz.titleColor(.darkText)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if self.style is ShadowButtonStyle {
      self.kz.shadow(radius: 5, opacity: 0.1, color: .black, offset: .zero)
    }
  }
}

protocol ButtonStyle {
  
  func config(_ button: UIButton)
}

class DefaultButtonStyle: ButtonStyle {
  
  func config(_ button: UIButton) {}
}
extension ButtonStyle where Self == DefaultButtonStyle {
  static var automatic: Self { Self() }
}

class BlurButtonStyle: ButtonStyle {
  
  private var blurStyle: UIBlurEffect.Style
  
  init(blurStyle: UIBlurEffect.Style) {
    self.blurStyle = blurStyle
  }
  
  func config(_ button: UIButton) {
    let blurEffect = UIBlurEffect(style: blurStyle)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.isUserInteractionEnabled = false
    button.kz.addSubview(blurEffectView) { make in
      make.edges.equalToSuperview()
    }
  }
}
extension ButtonStyle where Self == BlurButtonStyle {
  static func blur(style: UIBlurEffect.Style) -> Self {
    Self.init(blurStyle: style)
  }
}

class ShadowButtonStyle: ButtonStyle {
  
  func config(_ button: UIButton) {}
}
extension ButtonStyle where Self == ShadowButtonStyle {
  static var shadow: Self { Self() }
}


