//
//  LaunchView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/8/22.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading your app...".map({ String($0) })
    @State private var showLoadText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLauchView: Bool
    
    private let timer = Timer.self.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("insta_logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            ZStack {
                if showLoadText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.purple)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 80)
            
            VStack {
                    Text("from")
                        .font(.custom("Optima Regular", size: 24))
                        .foregroundColor(.gray)
                    
                    Text("Mateo Danilevich")
                        .font(.custom("Zapfino", size: 17))
                        .padding(.top, -20)
                        .foregroundColor(.pink)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .onAppear {
            showLoadText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLauchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLauchView: .constant(true))
    }
}
