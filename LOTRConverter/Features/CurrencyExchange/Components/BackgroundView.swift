//
//  BackgroundView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/19.
//

import SwiftUI
import Inject

struct BackgroundView: View {
    enum BackgroundType {
        case main
        case parchment
    }

    let type: BackgroundType

    var body: some View {
        switch type {
        case .main:
            Image(.background)
                .resizable()
                .ignoresSafeArea()
        case .parchment:
            Image(.parchment)
                .resizable()
                .scaleEffect(1.1)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundView(type: .parchment)
}
