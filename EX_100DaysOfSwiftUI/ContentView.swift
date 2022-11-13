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
            Form {
                Section("Project1") {
                    NavigationLink("Basic", destination: Project1View())
                    NavigationLink("Challenge", destination: Project1ChallengeView())
                }
                
                Section("Project2") {
                    NavigationLink("Basic", destination: Project2View())
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
