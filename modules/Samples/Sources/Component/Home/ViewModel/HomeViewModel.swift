//
//  HomeViewModel.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//
import Combine

public class HomeViewModel: ObservableObject {
    @Published var itemList: [HomeItem] = [HomeItem(title: "Network", itemType: .network)]
    private weak var navigator: HomeNavigator?
    
    public init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    
    func navigate(to type: HomeItemType) {
        switch type {
        case .network:
            navigator?.navigateToNetwork()
        }
    }
}
