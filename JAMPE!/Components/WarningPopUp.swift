//
//  WarningPopUp.swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct WarningPopUp: View {

    var body: some View {

        ZStack {

            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            WarningPopUpCard(
                title: "Aviso Importante",
                message: "Este aplicativo tem caráter instrutivo e não substitui avaliação profissional.",
                buttonTitle: "Entendi"
            ) {

                print("Botão clicado")

            }
        }
    }
}

struct WarningPopUpCard: View {

    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> Void

    var body: some View {

        VStack(spacing: 22) {

            Image(systemName: "exclamationmark.circle.fill")
                .font(.system(size: 52))
                .foregroundStyle(Color("TitleBlue"))

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color("WarningText"))
                .multilineTextAlignment(.center)

            Text(message)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color("WarningText"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)

            Button {

                action()

            } label: {

                Text(buttonTitle)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color("TitleBlue"))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                    )
            }
        }
        .padding(24)
        .frame(width: 320)
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 28
            )
        )
        .shadow(
            color: .black.opacity(0.15),
            radius: 20
        )
    }
}

#Preview {

    WarningPopUp()
}
