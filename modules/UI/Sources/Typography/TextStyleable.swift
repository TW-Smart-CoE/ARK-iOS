//
//  TextStyleable.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public protocol TextStyleable {}

extension Text: TextStyleable {}

extension SwiftUI.ButtonStyleConfiguration.Label: TextStyleable {}
