//
//  ContentView.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Project1", destination: Project1View())
                NavigationLink("Project1-Challenge", destination: Project1ChallengeView())
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
