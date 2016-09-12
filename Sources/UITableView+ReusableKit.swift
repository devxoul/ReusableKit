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

extension UITableViewCell: CellType {
}

extension UITableView {

  // MARK: Cell

  /// Registers a generic cell for use in creating new table cells.
  public func register<Cell: CellType>(_ cell: ReusableCell<Cell>) {
    self.register(Cell.self, forCellReuseIdentifier: cell.identifier)
  }

  /// Returns a generic reusable cell located by its identifier.
  public func dequeue<Cell: CellType>(_ cell: ReusableCell<Cell>) -> Cell? {
    return self.dequeueReusableCell(withIdentifier: cell.identifier) as? Cell
  }

  /// Returns a generic reusable cell located by its identifier.
  public func dequeue<Cell: CellType>(_ cell: ReusableCell<Cell>, for indexPath: IndexPath) -> Cell {
    return self.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as! Cell
  }

  // MARK: View

  /// Registers a generic view for use in creating new table header or footer views.
  public func register<View: ViewType>(_ cell: ReusableView<View>) {
    self.register(View.self, forHeaderFooterViewReuseIdentifier: cell.identifier)
  }

  /// Returns a generic reusable header of footer view located by its identifier.
  public func dequeue<View: ViewType>(_ view: ReusableView<View>) -> View? {
    return self.dequeueReusableHeaderFooterView(withIdentifier: view.identifier) as? View
  }
  
}

#endif
