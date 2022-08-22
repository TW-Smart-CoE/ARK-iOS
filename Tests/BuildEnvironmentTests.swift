//
//  BuildEnvironmentTests.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

@testable import ARK
import XCTest

class BuildEnvironmentTests: XCTestCase {
    let bundleIdentifier = "com.thoughtworks.ark"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    func test_givenABuildEnvironmentWithDebug_whenGetBundleIdentifier_thenReturnedValueShouldBeWithDebugSuffix() {
        /// given
        let debugEnvironment = BuildEnvironment(configuration: .debug)

        /// when
        let bundleIdentifier = debugEnvironment.bundleIdentifier

        /// then
        XCTAssertEqual(bundleIdentifier, self.bundleIdentifier + ".debug")
    }
}
