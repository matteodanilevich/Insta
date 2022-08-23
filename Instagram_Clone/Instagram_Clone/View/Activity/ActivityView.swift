//
//  ActivityView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) {_ in
                    ActivityCell()
                        .padding(.top)
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
