//
//  HomeViewModelTests.swift
//  SamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//  swiftlint:disable implicitly_unwrapped_optional

import XCTest
@testable import Samples

final class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    var navigator: MockHomeNavigator!
    
    override func setUpWithError() throws {
        navigator = MockHomeNavigator()
        sut = HomeViewModel(navigator: navigator)
    }
    
    func testShouldNavigateToNetworkWhenItemTypeIsNetwork() {
        // Given
        navigator = MockHomeNavigator()
        sut = HomeViewModel(navigator: navigator)
        
        // When
        sut.navigate(to: .network)
        
        // Then
        XCTAssertEqual(navigator.callCount, 1)
    }
}

class MockHomeNavigator: HomeNavigator {
    var callCount: Int = 0
    
    func navigateToNetwork() {
        callCount += 1
    }
}
