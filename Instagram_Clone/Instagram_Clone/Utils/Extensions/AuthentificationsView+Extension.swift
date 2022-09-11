//
//  AuthentificationsView+Extension.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/11/22.
//

import Foundation
import SwiftUI

extension View {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isPasswordValid(_ password : String) -> Bool{
           let passwordFormat = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,10}$"
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
           return passwordTest.evaluate(with: password)
       }
}
