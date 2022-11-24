//
//  ExampleHomeViewModel.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//
import Combine

class ExampleHomeViewModel: ObservableObject {
    @Published var itemList: [HomeItem] = [HomeItem(title: "Network", itemType: .network)]
    private weak var navigator: HomeNavigator?
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    
    func navigate(to type: HomeItemType) {
        switch type {
        case.network:
            navigator?.navigateToNetwork()
        }
    }
}
