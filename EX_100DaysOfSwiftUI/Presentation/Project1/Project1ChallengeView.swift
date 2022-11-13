//
//  Project1ChallengeView.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/13.
//

import SwiftUI

struct Project1ChallengeView: View {
    @State var inputText: Double = .zero
    @State var inputUnit = UnitLength.meters
    @State var outputUnit = UnitLength.kilometers
    
    @FocusState private var isActive
    
    private let formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        
        return formatter
    }()
    
    private let units: [UnitLength] = [.meters, .kilometers, .yards, .miles, .feet]
    
    private var result: String {
        let input = Measurement(value: inputText, unit: inputUnit)
        let output = input.converted(to: outputUnit)
        
        return formatter.string(from: output)
    }
    
    var body: some View {
        Form {
            Section("Input") {
                TextField("단위를 입력하세요", value: $inputText, format: .number)
                    .focused($isActive)
            }
            
            Section {
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit.symbol)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit.symbol)
                    }
                }
            }
            
            Section("Output") {
                Text(result)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isActive = false
                }
            }
        }
        .navigationTitle("Converter")
    }
}

struct Project1ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        Project1ChallengeView()
    }
}
