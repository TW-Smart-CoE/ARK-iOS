//
//  ImageSampleView.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

struct IconSampleView: View {
    @State var collectBtnIcon: IconName = .commonBtnUncollected
    
    var body: some View {
        VStack {
            Label {
                Text("Settings icon")
            } icon: {
                Image(IconName.commonIconSetting)
            }
            HStack {
                Button {
                    collectBtnIcon = (collectBtnIcon == .commonBtnUncollected) ? .commonBtnCollected : .commonBtnUncollected
                } label: {
                    Image(collectBtnIcon)
                }
                
                Text("Collect button")
            }
        }
    }
}

struct ImageSampleView_Previews: PreviewProvider {
    static var previews: some View {
        IconSampleView()
    }
}
