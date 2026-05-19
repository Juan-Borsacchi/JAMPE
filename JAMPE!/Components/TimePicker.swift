//
//  TimePicker 2.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 19/05/26.
//

import SwiftUI

// Juan
struct TimePicker: View{
    
    @State var hour: Int
    @State var minute: Int
    
    @State var selectedTime = Date()
    
    
    var body: some View {
        VStack {
            Text("Selecione o tempo de treino:\n")
            HStack {
                Text("Hora  :  Minuto")
            }
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
        }
        
        
        HStack {
            CustomPicker("H", 0...24, $hour)
            CustomPicker("Min", 0...59, $minute)
        }
        .padding()
        
    }
    private func CustomPicker(_ title: String, _ range: ClosedRange<Int>, _ selection: Binding<Int>) -> some View {
        Time(selection: $hour){
            ForEach(range, id: \.self) { value in
                Text("\(value)")
                    .tag(value)
            }
        }
        .overlay{
            Text(title)
                .font(.callout)
                .frame(width: 50, alignment: .leading)
                .lineLimit(1)
                .offset(x: 50)
        }
    }
}



struct Time<Content: View, Selection: Hashable>: View {
    @Binding var selection: Selection
    @ViewBuilder var content: Content
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                content
            }
            .pickerStyle(.wheel)
        }
    }
}


#Preview {
    TimePicker(hour: 0, minute: 0)
}
