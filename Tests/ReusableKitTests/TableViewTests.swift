#if os(iOS)
import XCTest
import ReusableKit

final class TableViewTests: XCTest {
  func testTableView_cell() {
    let tableView = UITableView()
    let reusableCell = ReusableCell<TestTableViewCell>()
    tableView.register(reusableCell)
    let cell = tableView.dequeue(reusableCell)
    XCTAssertNotNil(cell)
    XCTAssertTrue(type(of: cell!) === TestTableViewCell.self)
  }

  func testTableView_cellWithIndexPath() {
    let tableView = UITableView()
    let reusableCell = ReusableCell<TestTableViewCell>()
    tableView.register(reusableCell)
    let cell = tableView.dequeue(reusableCell, for: IndexPath(row: 0, section: 0))
    XCTAssertTrue(type(of: cell) === TestTableViewCell.self)
  }

  func testTableView_view() {
    let tableView = UITableView()
    let reusableView = ReusableView<TestTableHeaderView>()
    tableView.register(reusableView)
    let view = tableView.dequeue(reusableView)
    XCTAssertNotNil(view)
    XCTAssertTrue(type(of: view!) === TestTableHeaderView.self)
  }
}
#endif
