//
//  RecoveryTimeCard..swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct RecoveryTimeCard: View {

    let hours: Int
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {

        HStack(spacing: 20) {

            Text("\(hours) h")
                .font(.system(size: isIpad ? 96 : 57, weight: .bold))
                .foregroundStyle(.white)
                .padding(.leading)

            Text("Esse é o tempo estimado para que seu corpo se recupere adequadamente e reduza o risco de lesões.")
                .font(isIpad ? .title : .subheadline)

                //.font(.system(size: 13, weight: .medium))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)

            Spacer()
        }
        .padding(.horizontal, isIpad ? 20 : 4)
        .frame(maxWidth: .infinity)
        .frame(height: isIpad ? 240 : 139 )
        .background(Color("RestBlue"))
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}

#Preview {

    ZStack {

        Color(.systemGray6)
            .ignoresSafeArea()

        RecoveryTimeCard(hours: 72)
    }
}
