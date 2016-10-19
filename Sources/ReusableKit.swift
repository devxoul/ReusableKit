// The MIT License (MIT)
//
// Copyright (c) 2016 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public protocol CellType: class {
  var reuseIdentifier: String? { get }
}

/// A generic class that represents reusable cells.
public struct ReusableCell<Cell: CellType> {
  public typealias Class = Cell

  public let identifier: String
  public let nib: UINib?

  /// Create and returns a new `ReusableCell` instance.
  ///
  /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
  /// - parameter nib: A `UINib` instance. Use this when registering from xib.
  public init(identifier: String? = nil, nib: UINib? = nil) {
    self.identifier = nib?.instantiate(withOwner: nil, options: nil).lazy
      .flatMap { ($0 as? CellType)?.reuseIdentifier }
      .first ?? identifier ?? UUID().uuidString
    self.nib = nib
  }

  /// A convenience initializer.
  ///
  /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
  /// - parameter nibName: A name of nib.
  public init(identifier: String? = nil, nibName: String) {
    let nib = UINib(nibName: nibName, bundle: nil)
    self.init(identifier: identifier, nib: nib)
  }
}

public protocol ViewType: class {
}

/// A generic class that represents reusable views.
public struct ReusableView<View: ViewType> {
  public typealias Class = View

  public let identifier: String
  public let nib: UINib?

  /// Create and returns a new `ReusableView` instance.
  ///
  /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
  /// - parameter nib: A `UINib` instance. Use this when registering from xib.
  public init(identifier: String? = nil, nib: UINib? = nil) {
    self.identifier = identifier ?? UUID().uuidString
    self.nib = nib
  }

  /// A convenience initializer.
  ///
  /// - parameter identifier: A reuse identifier. Use random UUID string if identifier is not provided.
  /// - parameter nibName: A name of nib.
  public init(identifier: String? = nil, nibName: String) {
    let nib = UINib(nibName: nibName, bundle: nil)
    self.init(identifier: identifier, nib: nib)
  }
}
