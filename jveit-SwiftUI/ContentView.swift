//
//  ContentView.swift
//  jveit-SwiftUI
//
//  Created by Jeffrey Veit on 5/12/21.
//

import SwiftUI

struct ContentView: View {
    
    enum Page: String
    {
        case Remote = "Remote"
        case DVR = "DVR"
        case Favorites = "Favorites"
    }
    
    @State private var selectedNameIndex = 0
    @State private var switchOn = false
    @State private var sliderValue = 0.0
    @State private var stepperValue = 0
    @State private var hiddenIndex = 1
    @State var disableIndex = 1
    
    var hidden : Bool
    {
        hiddenIndex == 0
    }
    
    @State private var currentPage = Page.Remote
    
    var body: some View
    {
        let switch1 =  Toggle("Switch", isOn: $switchOn).labelsHidden().disabled(disableIndex == 0)
        let switch2 =  Toggle("Switch", isOn: $switchOn).labelsHidden().disabled(disableIndex == 0)
        let slider = Slider(value: $sliderValue, in: 0...100).disabled(disableIndex == 0)
        let stepper = Stepper(value: $stepperValue, in: 0...100, label: {Text("Channel:  \(stepperValue)").padding()})
            
            ZStack
        {
            if currentPage == .Remote
            {
                VStack
                {
                    Text("Remote Control").bold().padding()
                    
                    Spacer()
                    HStack
                    {
                        Text("Power: \(switchOn ? "On" : "Off")").frame(width: 100, height: 40, alignment: .leading).padding()
                        
                        switch1
                        Spacer()
                    }
                    
                    HStack
                    {
                        Text("Volume: \(Int(sliderValue))")
                            .frame(width: 100, height: 40, alignment: .leading).padding()
                        slider
                        Spacer()
                    }
                    
                    HStack
                    {
                        stepper
                        Spacer(minLength: 165)
                        
                    }
                    
                    Text("Channels").bold().padding()
                    
                    HStack
                    {
                        
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                  
                    
                    
                }
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
