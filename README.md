# ObjCMixin

[![CI Status](http://img.shields.io/travis/huandu/ObjCMixin.svg?style=flat)](https://travis-ci.org/huandu/ObjCMixin)
[![Version](https://img.shields.io/cocoapods/v/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)
[![License](https://img.shields.io/cocoapods/l/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)
[![Platform](https://img.shields.io/cocoapods/p/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Define and implement a module

Declare a module.

```objc
@module(MyModule)
-(void)hello;
@end
```

Implement module methods in a `.m` file.

```objc
@module_implementation(MyModule)

-(void)hello
{
    NSLog(@"Hello, world!");
}

@end
```

### Mixin an interface with module

Declare an interface.

```objc
@interface Foo : NSObject<MyModule>
-(void)foo;
@end
```

Implement Foo's method and mixin it with `MyModule` in a `.m` file.

```objc
@mixin(Foo, MyModule)

@implementation Foo

-(void)foo
{
    NSLog(@"Foo");
}

@end
```

### Use mixed interface

Use `Foo` to call methods in `MyModule`.

```objc
Foo *f = [[Foo alloc] init];
[f hello];
```

## Requirements

## Installation

ObjCMixin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ObjCMixin"
```

## Author

Huan Du, i@huandu.me

## License

ObjCMixin is available under the MIT license. See the LICENSE file for more info.
