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
    let height: CGFloat = 6
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
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
                    .font(isIpad ? .title2 : .subheadline)
                    .foregroundColor(progress <= 0.5 ? .titleBlue : .gray)
                
                Spacer()
                
                Text("Etapa 2")
                    .font(isIpad ? .title2 : .subheadline)
                    .foregroundColor(progress <= 0.5 ? .gray : .titleBlue)
            }
        }
        .padding(.horizontal, isIpad ? 32 : 16)
    }
    
    func progressWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 30
        return screenWidth * CGFloat(progress)
    }
}

#Preview {
    ProgressBar(progress: 0.5)
}
