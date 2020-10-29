//
//  ContentView.swift
//  EnvironmentVariablesInSwiftUI
//
//  Created by Ramill Ibragimov on 29.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.locale) var locale
    @Environment(\.calendar) var calendar
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(describing: horizontalSizeClass))
                Text(String(describing: colorScheme))
                Text(String(describing: layoutDirection))
                Text(String(describing: locale))
                Text(String(describing: calendar.firstWeekday))
                if horizontalSizeClass == .compact {
                    VStack {
                        ColoredRectangle(color: UIColor(named: "DarkGreen")!)
                        ColoredRectangle(color: UIColor(named: "LightGreen")!)
                    }
                } else {
                    HStack {
                        ColoredRectangle(color: UIColor(named: "DarkGreen")!)
                        ColoredRectangle(color: UIColor(named: "LightGreen")!)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Environment Variables")
            .toolbar(content: {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showModal = true
                    }, label: {
                        Text("Show Modal")
                    })
                }
            })
            .fullScreenCover(isPresented: $showModal, content: {
                ModalView()
                    .preferredColorScheme(colorScheme == .light ? .dark : .light)
                    //.environment(\.colorScheme, colorScheme == .light ? .dark : .light)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
