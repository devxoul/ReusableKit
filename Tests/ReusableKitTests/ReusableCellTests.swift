#if os(iOS)
import XCTest
import ReusableKit

final class ReusableCellTests: XCTestCase {
  override func setUp() {
    super.setUp()
  }

  func testReusableCell_class() {
    let cell = ReusableCell<TestCollectionViewCell>()
    XCTAssertTrue(cell.class === TestCollectionViewCell.self)
  }

  func testReusableCell_customIdentifier() {
    let cell = ReusableCell<TestCollectionViewCell>(identifier: "testCell")
    XCTAssertEqual(cell.identifier, "testCell")
  }

  func testReusableCell_identifierNotEqual() {
    let cell1 = ReusableCell<TestCollectionViewCell>()
    let cell2 = ReusableCell<TestCollectionViewCell>()
    XCTAssertNotEqual(cell1.identifier, cell2.identifier)
  }

  func testReusableCell_nibNil() {
    let cell = ReusableCell<TestCollectionViewCell>()
    XCTAssertNil(cell.nib)
  }
}
#endif
