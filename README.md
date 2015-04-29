# RPSViewControllerPresenter

[![Version](https://img.shields.io/cocoapods/v/RPSViewControllerPresenter.svg?style=flat)](http://cocoapods.org/pods/RPSViewControllerPresenter)
[![License](https://img.shields.io/cocoapods/l/RPSViewControllerPresenter.svg?style=flat)](http://cocoapods.org/pods/RPSViewControllerPresenter)
[![Platform](https://img.shields.io/cocoapods/p/RPSViewControllerPresenter.svg?style=flat)](http://cocoapods.org/pods/RPSViewControllerPresenter)


Present your view controller from anywhere with ease!

![](Images/sample.gif?raw=true)

## Usage

Just call `presentViewControllerToTop:animated` from `[RPSViewControllerPresenter presenter]`, and subscribe to the returned `RACSignal` to receive the completion.

```objc
UIViewController *viewController = [UIViewController new];
[[[RPSViewControllerPresenter presenter] presentViewControllerToTop:viewController animated:YES] subscribeNext:^(id x){
	NSLog(@"Presenting completed!");
}];
```

## Installation

RPSViewControllerPresenter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RPSViewControllerPresenter"
```

## Author

Ricardo Pramana Suranta, ricardo.pramana@gmail.com

## License

RPSViewControllerPresenter is available under the MIT license. See the LICENSE file for more info.
