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
                    
                    NavigationLink(destination: Project4View()) {
                        Text("~Project4는 안했음~").foregroundColor(.red)
                    }
                    
                    NavigationLink("Project5", destination: Project5View())
                    NavigationLink("Project6", destination: Project6View())
                    NavigationLink("Project7", destination: Project7View())
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
