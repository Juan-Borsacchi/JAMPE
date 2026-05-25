//
//  RecoveryTimeCard..swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct RecoveryTimeCard: View {

    let hours: Int

    var body: some View {

        HStack(spacing: 17) {

            Text("\(hours) h")
                .font(.system(size: 57, weight: .bold))
                .foregroundStyle(.white)
                .padding(.leading, 8)

            Text("Esse é o tempo estimado para que seu corpo se recupere adequadamente e reduza o risco de lesões.")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)

            Spacer()
        }

        .padding(.horizontal, 10)

        .frame(width: 358, height: 139)

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
