//
//  GenericCell.swift
//  RxStyleShare
//
//  Created by Suyeol Jeon on 5/25/16.
//  Copyright © 2016 StyleShare. All rights reserved.
//

import Foundation

public protocol CellType: class {
}

/// A generic class that represents reusable cells.
public struct GenericCell<Cell: CellType> {
    public typealias Class = Cell

    let identifier: String

    /// Create and returns a new `GenericCell` instance.
    ///
    /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
    init(identifier: String? = nil) {
        self.identifier = identifier ?? NSUUID().UUIDString
    }
}

public protocol ViewType: class {
}

/// A generic class that represents reusable views.
public struct GenericView<View: ViewType> {
    public typealias Class = View

    let identifier: String

    /// Create and returns a new `GenericView` instance.
    ///
    /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
    init(identifier: String? = nil) {
        self.identifier = identifier ?? NSUUID().UUIDString
    }
}
