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
    
    let channels = [ "ESPN", "HBO", "CNN", "NBC" ]
    
    @State private var selectedNameIndex = 0
    @State private var switchOn = false
    @State private var sliderValue = 0.0
    @State private var stepperValue = 0
    @State private var hiddenIndex = 1
    @State var imageT = "tv"
    @State var isActive = true
    @State var dvrI = "dvr"
    @State private var isAlertPresent = false
    @State private var username = ""
    @State private var password = ""
    @State var user = ""
    @State var loggedIn = false
    
    
    
    @State private var currentPage = Page.DVR
    
    var body: some View
    {
        let switch1 =  Toggle("Switch", isOn: $switchOn).labelsHidden()
        let switch2 =  Toggle("Switch", isOn: $switchOn).labelsHidden().disabled(!switchOn)
        let slider = Slider(value: $sliderValue, in: 0...100).disabled(!switchOn)
        let stepper = Stepper(value: $stepperValue, in: 0...100, label: {Text("Channel:  \(stepperValue)").padding()}).disabled(!switchOn)
        let picker = Picker("Favorites", selection: $selectedNameIndex)
            {
                ForEach(0 ..< channels.count)
                {
                    i in Text(channels[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle()).disabled(!switchOn)
        
        ZStack
        {
            if currentPage == .Remote
            {
                VStack
                {
                    Text("Remote Control").bold().padding()
                    
                    
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
                        Spacer(minLength: 155)
                        
                    }
                    
                    HStack
                    {
                        Spacer()
                        picker
                        Spacer()
                    }
                    
                    Text("Favorites").bold().padding()
                    Image(channels[selectedNameIndex]) .resizable().aspectRatio(contentMode: .fit)
                        //.frame(width: 150.0, height: 100.0)
                    
                    HStack
                    {
                        
                    }
                    
                    Spacer()
                    Spacer()
                    
                    
                  
                    
                    
                }.toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button(action: {
                            currentPage = .Remote
                        }) {
                            Text("Remote").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .DVR
                        }) {
                            Text("DVR").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .Favorites
                        }) {
                            Text("Favorites").padding()
                        }
                        Spacer()
                        
                    }
                })
                
                
            }
            
            if currentPage == .DVR
            {
                VStack
                {
                    Text("DVR").bold().padding()
                    
                    HStack
                    {
                        Text("Enter Login Information to Access DVR").bold().padding()
                    }
                    
                    HStack
                    {
                        TextField("Username: ", text: $username, onCommit:  {
                            UIApplication.shared.endEditing()
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding([.top, .leading, .trailing])
                    
                    HStack
                    {
                        SecureField("Password: ", text: $password, onCommit:  {
                            UIApplication.shared.endEditing()
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding([.top, .leading, .trailing])
                    
                    Spacer()
                    
                    HStack
                    {
                        Button(action: {
                            user = username
                            username = ""
                            password = ""
                            isAlertPresent = true
                            loggedIn = true
                        }) {
                            Text("Login").padding()
                        }.alert(isPresented: $isAlertPresent) {
                            Alert(title: Text("Welcome to your DVR!"),
                                  message: Text("""
                                    User:     \(user)
                                    """),
                                  dismissButton: nil)
                        }
                    }
                    
                    Spacer()
                    
                    HStack
                    {
                        Image(dvrI).resizable().frame(width: 250.0, height: 150.0)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: -6)
                    {
                        Text("Recordings").bold().padding()
                        Text("Breaking Bad Season 4 Episode 5").bold().padding().opacity(!loggedIn ? 0 : 1)
                        Text("Westworld Season 3 Episode 8").bold().padding().opacity(!loggedIn ? 0 : 1)

                        Text("Game of Thrones Season 1 Episode 6").bold().padding().opacity(!loggedIn ? 0 : 1)

                        Text("Steve Jobs").bold().padding().opacity(!loggedIn ? 0 : 1)

                    }
                    
                    
                    
                }.toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button(action: {
                            currentPage = .Remote
                        }) {
                            Text("Remote").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .DVR
                        }) {
                            Text("DVR").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .Favorites
                        }) {
                            Text("Favorites").padding()
                        }
                        Spacer()                    }
                })
                
            }
            
            if currentPage == .Favorites
            {
                VStack
                {
                    Text("Favorites").bold().padding()
                    
                }.toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button(action: {
                            currentPage = .Remote
                        }) {
                            Text("Remote").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .DVR
                        }) {
                            Text("DVR").padding()
                        }
                        Spacer()
                        Button(action: {
                            currentPage = .Favorites
                        }) {
                            Text("Favorites").padding()
                        }
                        Spacer()
                        
                    }
                })            }
        }
        
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
