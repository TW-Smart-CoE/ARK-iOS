//
//  TypographySampleView.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

struct TypographySampleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Header Content")
                    .typographyStyle(as: .h5)

                Text("Subtitle Content")
                    .typographyStyle(as: .subtitle1)
                    .foregroundColor(Colors.gray900.color)
            }

            Spacer()

            Text("Custom Font")
                .scaledFont(fontWeight: .thinItalic, size: 20)
                .foregroundColor(Colors.gray600.color)
        }.padding(.standardPadding)
    }
}

struct TypographySampleView_Previews: PreviewProvider {
    static var previews: some View {
        TypographySampleView()
    }
}
