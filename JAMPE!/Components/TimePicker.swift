//
//  TimePicker 2.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 19/05/26.
//

import SwiftUI

// Juan
struct TimePicker: View{
    //Duas views para simular toggle e dois corpos
    var style: AnyShapeStyle = .init(.bar)
    @Binding var hour: Int
    @Binding var minute: Int
    @State var selectedTime = Date()
    var body: some View {
        /*VStack {
            Text("Selecione o tempo de treino:\n")
            HStack {
                Text("Hora  :  Minuto")
            }
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
        }*/
        
        HStack(spacing: 0){
            CustomPicker(hour <= 1 ? "hour" : "hours", 0...10, $hour)
            CustomPicker(minute <= 1 ? "min" : "mins", 0...59, $minute)
        }
        .offset(x: -25)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(style)
                .frame(height: 35)
        }
        
    }
    @ViewBuilder
    private func CustomPicker(_ title: String, _ range: ClosedRange<Int>, _ selection: Binding<Int>) -> some View {
        Time(selection: selection){
            ForEach(range, id: \.self) { value in
                Text("\(value)")
                    .frame(width: 35, alignment: .trailing)
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
    @State private var isHidden: Bool = false
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                if !isHidden {
                    IndicatorRemove {
                        isHidden = true
                    }
                }
                content
            }
            .pickerStyle(.wheel)
        }
    }
}

fileprivate
struct IndicatorRemove: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.async{
            if let pickerView = view.pickerView {
                if pickerView.subviews.count >= 2 {
                    pickerView.subviews[1].backgroundColor = .clear
                }
                result()
            }
        }
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

fileprivate
extension UIView {
    var pickerView: UIPickerView? {
        if let view = superview as? UIPickerView {
            return view
        }
        
        return superview?.pickerView
    }
}

#Preview {
    ContentView()
}
