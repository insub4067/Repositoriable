//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/13/23.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Button("Button") {
            viewModel.didTap()
        }
    }
}

#Preview {
    ContentView()
}
