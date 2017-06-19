#if os(iOS)
import XCTest
import ReusableKit
import RxReusableKit
import RxCocoa
import RxSwift

final class RxReusableCollectionViewTests: XCTestCase {
  func testCollectionView() {
    let reusableCell = ReusableCell<TestCollectionViewCell>()
    let collectionView = UICollectionView(
      frame: CGRect(x: 0, y: 0, width: 1, height: 1),
      collectionViewLayout: UICollectionViewFlowLayout()
    )
    collectionView.register(reusableCell)
    _ = Observable.just(["A", "B", "C"])
      .bind(to: collectionView.rx.items(reusableCell)) { i, item, cell in
        cell.value = item
      }
    XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 3)
    XCTAssertEqual(try collectionView.rx.model(at: IndexPath(item: 0, section: 0)), "A")
    XCTAssertEqual(try collectionView.rx.model(at: IndexPath(item: 1, section: 0)), "B")
    XCTAssertEqual(try collectionView.rx.model(at: IndexPath(item: 2, section: 0)), "C")
  }
}

private class TestCollectionViewCell: UICollectionViewCell {
  var value: String?
}
#endif
