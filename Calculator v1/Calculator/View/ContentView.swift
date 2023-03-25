//
//  ContentView.swift
//  Calculator
//
//  Created by Zachary Swoveland on 3/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.purple.opacity(0.3),.pink.opacity(0.5)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            KeyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
