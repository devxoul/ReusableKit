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

#if os(iOS)

import UIKit

/// An enumeration that represents UICollectionView supplementary view kind.
public enum SupplementaryViewKind: String {
  case header, footer

  public init?(rawValue: String) {
    switch rawValue {
    case UICollectionElementKindSectionHeader: self = .header
    case UICollectionElementKindSectionFooter: self = .footer
    default: return nil
    }
  }

  public var rawValue: String {
    switch self {
    case .header: return UICollectionElementKindSectionHeader
    case .footer: return UICollectionElementKindSectionFooter
    }
  }
}

extension UICollectionViewCell: CellType {
}

extension UIView: ViewType {
}

extension UICollectionView {

  // MARK: Cell

  /// Registers a generic cell for use in creating new collection view cells.
  public func register<Cell: CellType>(_ cell: ReusableCell<Cell>) {
    if let nib = cell.nib {
      self.register(nib, forCellWithReuseIdentifier: cell.identifier)
    } else {
      self.register(Cell.self, forCellWithReuseIdentifier: cell.identifier)
    }
  }

  /// Returns a generic reusable cell located by its identifier.
  public func dequeue<Cell: CellType>(_ cell: ReusableCell<Cell>, for indexPath: IndexPath) -> Cell {
    return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as! Cell
  }

  // MARK: Supplementary View

  /// Registers a generic view for use in creating new supplementary views for the collection view.
  public func register<View: ViewType>(_ view: ReusableView<View>, kind: SupplementaryViewKind) {
    self.register(view, kind: kind.rawValue)
  }

  /// Registers a generic view for use in creating new supplementary views for the collection view.
  public func register<View: ViewType>(_ view: ReusableView<View>, kind: String) {
    if let nib = view.nib {
      self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: view.identifier)
    } else {
      self.register(View.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: view.identifier)
    }
  }

  /// Returns a generic reusable supplementary view located by its identifier and kind.
  public func dequeue<View: ViewType>(_ view: ReusableView<View>, kind: String, for indexPath: IndexPath) -> View {
    return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: view.identifier, for: indexPath) as! View
  }

  /// Returns a generic reusable supplementary view located by its identifier and kind.
  public func dequeue<View: ViewType>(_ view: ReusableView<View>, kind: SupplementaryViewKind, for indexPath: IndexPath) -> View {
    return self.dequeue(view, kind: kind.rawValue, for: indexPath)
  }
  
}

#endif
