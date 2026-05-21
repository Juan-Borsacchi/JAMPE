//
//  ContentView.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 18/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var hour: Int = 0
    @State private var minute: Int = 0
    var body: some View {
        NavigationStack{
            VStack{
                TimePicker(hour: $hour, minute: $minute)
                    .padding(15)
                    .background(.white, in: .rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
            }
            .padding(15)
            .navigationTitle(Text("JAMPE!"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.15))
        }
        
    }
}

#Preview {
    ContentView()
}
