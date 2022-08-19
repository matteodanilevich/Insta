//
//  UIApplication+Extension.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
