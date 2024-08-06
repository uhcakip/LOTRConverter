//
//  ExchangeInfoView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/6.
//

import SwiftUI

struct ExchangeInfoView: View {
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .scaleEffect(1.1)
                .ignoresSafeArea()

            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)

                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()


                HStack {
                    Image(.goldPiece)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)

                    Text("1 Gold Piece = 4 Gold Pennies")

                    Image(.goldPenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                }

                Button("Done") {

                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .foregroundColor(.white)
            }
        }
        .foregroundColor(.black)
    }
}

#Preview {
    ExchangeInfoView()
}
