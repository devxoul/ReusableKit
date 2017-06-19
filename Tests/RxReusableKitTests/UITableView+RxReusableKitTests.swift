#if os(iOS)
import XCTest
import ReusableKit
import RxReusableKit
import RxCocoa
import RxSwift

final class RxReusableTableViewTests: XCTestCase {
  func testTableView() {
    let reusableCell = ReusableCell<TestTableViewCell>()
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    tableView.register(reusableCell)
    _ = Observable.just(["A", "B", "C"])
      .bind(to: tableView.rx.items(reusableCell)) { i, item, cell in
        cell.value = item
      }
    XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    XCTAssertEqual(try tableView.rx.model(at: IndexPath(row: 0, section: 0)), "A")
    XCTAssertEqual(try tableView.rx.model(at: IndexPath(row: 1, section: 0)), "B")
    XCTAssertEqual(try tableView.rx.model(at: IndexPath(row: 2, section: 0)), "C")
  }
}

private class TestTableViewCell: UITableViewCell {
  var value: String?
}
#endif
