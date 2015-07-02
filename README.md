# ObjCMixin

[![CI Status](http://img.shields.io/travis/huandu/ObjCMixin.svg?style=flat)](https://travis-ci.org/huandu/ObjCMixin)
[![Version](https://img.shields.io/cocoapods/v/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)
[![License](https://img.shields.io/cocoapods/l/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)
[![Platform](https://img.shields.io/cocoapods/p/ObjCMixin.svg?style=flat)](http://cocoapods.org/pods/ObjCMixin)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

There is a test case in `Example/Tests/Tests.m`. It's a good start to understand how to write mixin in Object-C.

### Import ObjCMixin

```objc
#import <ObjCMixin/ObjCMixin.h>
```

### Define and implement a module

Declare a module.

```objc
@module(MyModule)
@property(nonatomic, strong) NSString *prefix;
- (void)saySomething:(NSString *)something;
@end
```

Implement module methods in a `.m` file.

```objc
@module_implementation(MyModule)

// Module must implement methods required by property explicitly.
- (NSString *)prefix {
  // Use `module_ivar` to retrieve a variable in module.
  return module_ivar(self, prefix);
}

- (void)setPrefix:(NSString *)prefix {
  // Update module instance variable.
  module_ivar(self, prefix) = prefix;
}

// Implement method as usual.
- (void)saySomething:(NSString *)something {
  NSString *prefix = _prefix;
  NSLog(@"%@: %@", prefix, something);
}

@end
```

### Mixin an interface with module

Declare an interface.

```objc
@interface Foo : NSObject<MyModule>
- (void)foo;
@end
```

Implement Foo's method and mixin it with `MyModule` in a `.m` file.

```objc
@mixin(Foo, MyModule)

@implementation Foo

- (void)foo {
    NSLog(@"Foo");
}

@end
```

### Use mixed interface

Use `Foo` to call methods in `MyModule`.

```objc
Foo *f = [[Foo alloc] init];
[f hello];
[f foo];
f.prefix = @"Hey";
NSLog(@"%@, you!", f.prefix);
```

### Helper macros

ObjCMixin provides following macros to make mixin cool.

- `@module(ModuleName)`: Declare a module.
- `@module_implementation(ModuleName)`: Implement module methods.
- `@mixin(TargetClass, ModuleName)`: Copy all methods from module to `TargetClass`.
- `module_ivar(self, ivar)`: Get or set a variable binded with module instance.

## Limitation

ObjCMixin uses Object-C runtime api to hack classes. Due to runtime api limitations, ObjCMixin can only copy module methods to target class. Instance variables and synthesized properties cannot be copied from module class to target class.

Basically, a module can be considered as a [category](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html#//apple_ref/doc/uid/TP40011210-CH6-SW1). The only difference between a module and a category is that code in module can be shared among more than one interface.

## Installation

ObjCMixin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ObjCMixin", "~> 0.1.0"
```

## Author

Huan Du, i@huandu.me

## License

ObjCMixin is available under the MIT license. See the LICENSE file for more info.
