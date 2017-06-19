#if os(iOS)
import XCTest
import ReusableKit

final class CollectionViewTests: XCTest {
  func testCollectionView_cell() {
    let collectionView = UICollectionView()
    let reusableCell = ReusableCell<TestCollectionViewCell>()
    collectionView.register(reusableCell)
    let cell = collectionView.dequeue(reusableCell, for: IndexPath(row: 0, section: 0))
    XCTAssertTrue(type(of: cell) === TestCollectionViewCell.self)
  }

  func testCollectionView_view() {
    let collectionView = UICollectionView()
    let reusableView = ReusableView<TestTableHeaderView>()
    collectionView.register(reusableView, kind: .header)
    let view = collectionView.dequeue(reusableView, kind: .header, for: IndexPath(row: 0, section: 0))
    XCTAssertNotNil(view)
    XCTAssertTrue(type(of: view) === TestTableHeaderView.self)
  }
}
#endif
