//
//  ProfileStats.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI

struct ProfileStats: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 14, weight: .semibold))
            Text(title)
                .font(.system(size: 14))
        }
        .frame(width: 80, alignment: .center)
    }
}
