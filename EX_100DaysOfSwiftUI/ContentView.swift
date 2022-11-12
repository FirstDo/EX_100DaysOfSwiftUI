//
//  ContentView.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    private let projects = (1...10).map {"Project\($0)"}
    var body: some View {
        NavigationView {
            List {
                ForEach(projects, id: \.self) { item in
                    NavigationLink {
                        Text(item)
                    } label: {
                        Text(item)
                    }

                }
            }
            .navigationTitle("100 DAYS OF SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
