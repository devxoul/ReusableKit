ReusableKit
===========

![Swift](https://img.shields.io/badge/Swift-2.2-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/ReusableKit.svg)](https://travis-ci.org/devxoul/ReusableKit)
[![CocoaPods](http://img.shields.io/cocoapods/v/ReusableKit.svg)](https://cocoapods.org/pods/ReusableKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Generic reusables for Cocoa. Currently supports `UITableView` and `UICollectionView`.


At a Glance
-----------

##### UITableView

```swift
struct Reusable {
    static let headerView = GenericCell<SectionHeaderView>()
    static let userCell = GenericCell<UserCell>()
}

tableView.registerView(Reusable.headerView)
tableView.registerCell(Reusable.userCell)

tableView.dequeueView(Reusable.userCell)
tableView.dequeueCell(Reusable.userCell)
```

##### UICollectionView

```swift
struct Reusable {
    static let headerView = GenericCell<SectionHeaderView>()
    static let photoCell = GenericCell<PhotoCell>()
}

collection.registerView(Reusable.headerView, kind: .Header)
collection.registerCell(Reusable.photoCell)

collection.dequeueView(Reusable.headerView, kind: .Header)
collection.dequeueCell(Reusable.photoCell, forIndexPath: indexPath)
```

##### Anything Else?

Pull requests are welcomed 💖


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'ReusableKit', '~> 0.2.0'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/ReusableKit" ~> 0.2.0
    ```

- **For iOS 7 projects** with [CocoaSeeds](https://github.com/devxoul/CocoaSeeds):

    ```ruby
    github 'devxoul/ReusableKit', '0.2.0', :files => 'Sources/*.swift'
    ```


License
-------

**ReusableKit** is under MIT license. See the [LICENSE](LICENSE) file for more info.
