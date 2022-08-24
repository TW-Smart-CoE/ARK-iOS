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

    func testShouldReturnBundleIdentifuerWithDebugSuffix_whenGetBundleIdentifierUnderDebugEnv() {
        /// when
        let debugEnvironment = BuildEnvironment(configuration: .debug)
        let bundleIdentifier = debugEnvironment.bundleIdentifier

        /// should
        XCTAssertEqual(bundleIdentifier, self.bundleIdentifier + ".debug")
    }
}
