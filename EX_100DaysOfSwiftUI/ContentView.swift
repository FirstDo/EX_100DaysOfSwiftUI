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
                Section("Project") {
                    NavigationLink("Project1", destination: Project1View())
                    NavigationLink("Project2", destination: Project2View())
                    NavigationLink("Project3", destination: Project3View())
                    
                    NavigationLink("Project4", destination: Project4View())
                }
                
                Section("Challenage") {
                    NavigationLink("Challenge1", destination: Project1ChallengeView())
                    
                    NavigationLink("Challenge3", destination: Project3ChallengeView())
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
