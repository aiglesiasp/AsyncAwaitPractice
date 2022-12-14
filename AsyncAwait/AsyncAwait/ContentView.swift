//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Aitor Iglesias Pubill on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = viewModelTest()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .task {
                    //llamada
                    viewModel.loadImagenes()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
