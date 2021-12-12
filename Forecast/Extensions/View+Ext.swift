//
//  View+Ext.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/12/21.
//

import SwiftUI

extension View {
    func cornered(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) -> some View {
        return clipShape(FCRoundedCorner(radius: radius, corners: corners))
    }
}
