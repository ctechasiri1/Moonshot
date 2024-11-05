//
//  DividerView.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 11/4/24.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
