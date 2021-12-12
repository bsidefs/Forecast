//
//  FCLoadingView.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/10/21.
//

import SwiftUI

struct FCLoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.regularMaterial)
            .tint(.white)
    }
}

struct FCLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        FCLoadingView()
            .preferredColorScheme(.dark)
    }
}
