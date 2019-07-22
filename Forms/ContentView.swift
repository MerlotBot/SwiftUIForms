//
//  ContentView.swift
//  Forms
//
//  Created by Antonakakis Nikolaos on 22.07.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var scheduled: Bool =  false
    @State private var manuallyEnableUntilTomorrow: Bool = false
    @State private var colorTemperature: CGFloat = 0.5
    @State private var selectedDay = 0
    @State private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Night shift automatically colors during the night so as to protect your eyesight")
                    .lineLimit(nil)
                    .padding(5)) {
                        Toggle(isOn: $scheduled) {
                            Text("Scheduled")
                        }
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text("From")
                                Text("To")
                            }
                            Spacer()
                            NavigationLink(destination: Text("Scheduled Settings")) {
                                
                                VStack {
                                    Text("Sunset").color(.blue)
                                    Text("Sunrise").color(.blue)
                                }
                            }.fixedSize()
                        }
                }
                
                Section(header: Text("").padding()) {
                    Toggle(isOn: $manuallyEnableUntilTomorrow) {
                        Text("Manually enable until tomorrow")
                    }
                }
                
                Section(header: Text("COLOR TEMPERATURE").padding([.top, .bottom], 7)) {
                    
                    VStack {
                        HStack {
                            Text("Less Warm")
                            Spacer()
                            Text("More Warm")
                        }
                        Slider(value: $colorTemperature, from: 0.0, through: 1.0, by: 0.1)
                    }
                }
                
                Section(header: Text("")) {
                    Picker(selection: $selectedDay, label: Text("Pick a day")) {
                        ForEach(0..<days.count) {
                            Text(self.days[$0]).tag($0)
                        }
                    }//.pickerStyle(.wheel)
                }
                
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
