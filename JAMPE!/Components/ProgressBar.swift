//
//  ProgressBar.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    var color: Color = .titleBlue
    let height: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: height)
                
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(color)
                    .frame(width: progressWidth(), height: height)
            }
            
            HStack{
                Text("Etapa 1")
                    .font(.subheadline)
                    .foregroundColor(progress <= 0.5 ? .titleBlue : .gray)
                
                Spacer()
                
                Text("Etapa 2")
                    .font(.subheadline)
                    .foregroundColor(progress <= 0.5 ? .gray : .titleBlue)
            }
        }
        .padding(.horizontal, 16)
    }
    
    func progressWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 30
        return screenWidth * CGFloat(progress)
    }
}

#Preview {
    ProgressBar(progress: 0.5)
}
