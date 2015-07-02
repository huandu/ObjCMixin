//
//  ObjCMixinTests.m
//  ObjCMixinTests
//
//  Created by Huan Du on 07/02/2015.
//  Copyright (c) 2015 Huan Du. All rights reserved.
//

#import <objc/runtime.h>

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#import "OCMTestModule.h"

@interface MyClass : NSObject<OCMTestModule>
@end

@mixin(MyClass, OCMTestModule)

@implementation MyClass

- (NSInteger)duplicatedMethod {
    return 3;
}

@end

SpecBegin(UsingMixinInClassSpecs)

describe(@"Use a module as mixin", ^{
    MyClass *mc = [[MyClass alloc] init];

    it(@"MyClass can response `hello`", ^{
        expect(mc).to.respondTo(@selector(hello));
        [mc hello];
    });

    it(@"MyClass can response `concatOneString:andAnotherString:`", ^{
        expect(mc).to.respondTo(@selector(concatOneString:andAnotherString:));
        expect([mc concatOneString:@"One" andAnotherString:@"Another"]).to.equal(@"PREFIX: One Another 1");
        expect([mc concatOneString:@"One" andAnotherString:@"Another"]).to.equal(@"PREFIX: One Another 2");
    });
    
    it(@"MyClass has a property `prefix`", ^{
        expect(class_getProperty([MyClass class], "prefix")).notTo.beNil();
        mc.prefix = @"FOO";
        expect(mc.prefix).to.equal(@"FOO");
    });
    
    it(@"If a method is implemented in MyClass, it shadows the method in mixin.", ^{
        expect([mc duplicatedMethod]).to.equal(3);
    });
});

SpecEnd
