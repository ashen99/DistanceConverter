//
//  ContentView.swift
//  DistanceConverterApp
//
//  Created by Gunarathna Deshan on 2023-03-13.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("distanceInMeter") private var distanceInMeter : String = ""
    @State private var attribute : String = "<<Unit>>"
    @State private var convertedValue : String = "<<Value>>"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Distance Converter").bold().font(.largeTitle)
            
            TextField("Unit in meters", text: $distanceInMeter).border(Color.black).textFieldStyle(.roundedBorder).keyboardType(.numberPad)
            
            HStack(spacing: 25) {
                Button("Ft"){
                    convertDistance(attributeName: "Ft")
                }.buttonStyle(.bordered).background(Color.purple).foregroundColor(Color.white).cornerRadius(8).controlSize(.large)
                Button("Cm"){
                    convertDistance(attributeName: "Cm")
                }.buttonStyle(.bordered).background(Color.blue).foregroundColor(Color.white).cornerRadius(8).controlSize(.large)
                Button("Yd"){
                    convertDistance(attributeName: "Yd")
                }.buttonStyle(.bordered).background(Color.brown).foregroundColor(Color.white).cornerRadius(8).controlSize(.large)
                Button("Km"){
                    convertDistance(attributeName: "Km")
                }.buttonStyle(.bordered).background(Color.cyan).foregroundColor(Color.white).cornerRadius(8).controlSize(.large)
            }
            
            Text("The Distance in \(attribute) is \(convertedValue)").bold().font(.system(size: 19))
            
            Image("logo").resizable().frame(width: 100, height: 100)
            
            Button("Reset"){
                reset()
            }.buttonStyle(.bordered).background(Color.red).foregroundColor(Color.white).cornerRadius(8).controlSize(.large)
            
            
            Spacer()
        }.padding()
    }
    
    func convertDistance(attributeName : String) {
        guard let value = Double(distanceInMeter) else {
            print("Invalid input")
            return
        }
        
        switch attributeName{
        case "Cm":
            let newDistance = value * 100
            convertedValue = String(format: "%.2f" , newDistance)
            attribute = attributeName
        case "Ft":
            let newDistance = value * 3.28
            convertedValue = String(format: "%.2f" , newDistance)
            attribute = attributeName
        case "Yd":
            let newDistance = value * 1.09
            convertedValue = String(format: "%.2f" , newDistance)
            attribute = attributeName
        default:
            let newDistance = value / 1000
            convertedValue = String(format: "%.2f" , newDistance)
            attribute = attributeName
        }
    }
    func reset() {
        distanceInMeter = ""
        attribute = "<<Unit>>"
        convertedValue = "<<Value>>"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
