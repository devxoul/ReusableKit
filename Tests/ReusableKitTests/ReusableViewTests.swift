#if os(iOS)
import XCTest
import ReusableKit

final class ReusableViewTests: XCTestCase {
  override func setUp() {
    super.setUp()
  }

  func testReusableView_class() {
    let view = ReusableView<TestCollectionHeaderView>()
    XCTAssertTrue(view.class === TestCollectionHeaderView.self)
  }

  func testReusableView_customIdentifier() {
    let view = ReusableView<TestCollectionHeaderView>(identifier: "testView")
    XCTAssertEqual(view.identifier, "testView")
  }

  func testReusableView_identifierNotEqual() {
    let view1 = ReusableView<TestCollectionHeaderView>()
    let view2 = ReusableView<TestCollectionHeaderView>()
    XCTAssertNotEqual(view1.identifier, view2.identifier)
  }

  func testReusableView_nibNil() {
    let view = ReusableView<TestCollectionHeaderView>()
    XCTAssertNil(view.nib)
  }
}
#endif
