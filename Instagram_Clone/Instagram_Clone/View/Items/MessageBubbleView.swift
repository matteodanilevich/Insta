//
//  MessageBubbleView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct MessageBubbleView: Shape {
    
    var yourAccount: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, yourAccount ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}
