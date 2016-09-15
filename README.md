ReusableKit
===========

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/ReusableKit.svg)](https://travis-ci.org/devxoul/ReusableKit)
[![CocoaPods](http://img.shields.io/cocoapods/v/ReusableKit.svg)](https://cocoapods.org/pods/ReusableKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Generic reusables for Cocoa. Currently supports `UITableView` and `UICollectionView`.


At a Glance
-----------

##### UITableView

```swift
struct Reusable {
  static let headerView = ReusableCell<SectionHeaderView>()
  static let userCell = ReusableCell<UserCell>()
}

tableView.register(Reusable.headerView)
tableView.register(Reusable.userCell)

tableView.dequeue(Reusable.headerView, for: indexPath)
tableView.dequeue(Reusable.userCell, for: indexPath)
```

##### UICollectionView

```swift
struct Reusable {
  static let headerView = ReusableCell<SectionHeaderView>()
  static let photoCell = ReusableCell<PhotoCell>()
}

collection.register(Reusable.headerView, kind: .header)
collection.register(Reusable.photoCell)

collection.dequeue(Reusable.headerView, kind: .header, for: indexPath)
collection.dequeue(Reusable.photoCell, for: indexPath)
```

##### Anything Else?

Pull requests are welcomed 💖


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'ReusableKit', '~> 1.0'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/ReusableKit" ~> 1.0
    ```

- **For iOS 7 projects** with [CocoaSeeds](https://github.com/devxoul/CocoaSeeds):

    ```ruby
    github 'devxoul/ReusableKit', '1.0.0', :files => 'Sources/*.swift'
    ```


License
-------

**ReusableKit** is under MIT license. See the [LICENSE](LICENSE) file for more info.
