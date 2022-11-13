//
//  Project3View.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/13.
//

import SwiftUI

struct Project3View: View {
    var body: some View {
        VStack {
            Text("SwiftUI is 🥰")
                .modifier(Custom1())
            
            Text("RxSwift is 😡")
                .modifier(Custom2())
            
            Button("First", action: {})
                .modifier(Custom3())
            
            Button("Second", action: {})
                .modifier(Custom3())
        }
    }
}

struct Project3View_Previews: PreviewProvider {
    static var previews: some View {
        Project3View()
    }
}

struct Custom1: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
            .cornerRadius(20)
    }
}

struct Custom2: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 200, height: 200)
            .background(.red)
            .cornerRadius(20)
    }
}

struct Custom3: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

