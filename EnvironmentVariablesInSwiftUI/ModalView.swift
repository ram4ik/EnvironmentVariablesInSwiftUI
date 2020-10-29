//
//  ModalView.swift
//  EnvironmentVariablesInSwiftUI
//
//  Created by Ramill Ibragimov on 29.10.2020.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSize: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    Text("This is some text")
                        .font(.title)
                    Text("Current Size is \(String(describing: ContentSizeCategory.allCases[currentSize]))")
                    Text("This is some other large text...")
                }
                .environment(\.sizeCategory, ContentSizeCategory.allCases[currentSize])
                .padding()
                
                HStack(spacing: 20) {
                    Button(action: {
                        if currentSize > 0 {
                            currentSize -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.magnifyingglass")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    })
                    Button(action: {
                        if currentSize < ContentSizeCategory.allCases.count - 1 {
                            currentSize += 1
                        }
                    }, label: {
                        Image(systemName: "plus.magnifyingglass")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    })
                }
            }.navigationTitle("Modal Screen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }.onAppear() {
            currentSize = ContentSizeCategory.allCases.firstIndex { $0 == sizeCategory }!
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
