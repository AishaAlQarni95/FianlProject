//
//  ButtonBorderDesign.swift
//  FinalProject
//
//  Created by Aisha Al-Qarni on 18/01/2022.
//

import UIKit

extension UIButton {
    func yellowButton(){
        layer.cornerRadius = 13
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        layer.backgroundColor = #colorLiteral(red: 0.9922359586, green: 0.8986359239, blue: 0.009163131937, alpha: 1)
        clipsToBounds = true
    }
    func greenButton(){
        layer.cornerRadius = 13
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        layer.backgroundColor = #colorLiteral(red: 0.2711555362, green: 0.651453793, blue: 0.6299153566, alpha: 1)
        clipsToBounds = true
    }
    func redFloatButton(){
        layer.cornerRadius = frame.height / 2
        layer.shadowRadius = 5
        layer.backgroundColor = #colorLiteral(red: 0.9843555093, green: 0.5423229337, blue: 0.5544133186, alpha: 1)
        clipsToBounds = true
        }
    func yellowFloatButton(){
        layer.cornerRadius = frame.height / 2
        layer.shadowRadius = 5
        layer.backgroundColor = UIColor.yellow.cgColor
        clipsToBounds = true
    }
}
