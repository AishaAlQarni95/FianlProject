//
//  TextFieldDesign.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 20/01/2022.
//

import UIKit

extension UITextField {
  func setUnderLine() {
    let border = CALayer()
      let width = CGFloat(2.5)
    border.borderColor = UIColor.darkGray.cgColor
    border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 10, height: self.frame.size.height)
    border.borderWidth = width
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
  }
}
