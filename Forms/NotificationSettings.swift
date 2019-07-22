//
//  NotificationSettings.swift
//  Forms
//
//  Created by Antonakakis Nikolaos on 22.07.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import SwiftUI

struct NotificationSettings : View {
    
    @State private var images =
    ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙"]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("")) {
                    
                    HStack {
                        Text("Show Previews")
                        Spacer()
                        NavigationLink(destination: Text("")) {
                            Text("Always").color(.gray)
                        }.fixedSize()
                    }
                }
                Section(header: Text("Notification previews will be shown whether the iPhone is locked or unlocked").color(.secondary).lineLimit(nil).padding(10)) {
                    HStack {
                        NavigationLink(destination: Text("")) {
                            Text("Siri Suggestions")
                        }
                    }
                }
                
                Section(header: VStack(alignment: .leading) {
                    Text("Choose while apps can suggest chortcuts on the lock screen").color(.secondary).lineLimit(nil).padding(10)
                    Text("NOTIFICATION STYLE").color(.secondary).lineLimit(nil).padding(10)
                }) {
                    Group {
                        ForEach(self.images.identified(by: \.self)) { img in
                            HStack {
                                Text(img).font(.largeTitle)
                                Text("Notification")
                            }
                        }
                    }
                }
            }.navigationBarTitle("Notification Settings", displayMode: .inline)
        }
    }
}

#if DEBUG
struct NotificationSettings_Previews : PreviewProvider {
    static var previews: some View {
        NotificationSettings()
    }
}
#endif
