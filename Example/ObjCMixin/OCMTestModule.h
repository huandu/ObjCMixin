//
//  OCMTestModule.h
//  ObjCMixin
//
//  Created by Huan Du on 7/2/15.
//  Copyright (c) 2015 Huan Du. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ObjCMixin/ObjCMixin.h>

// Declare a module.
@module(OCMTestModule)

@property(nonatomic, strong) NSString *prefix;

- (void)hello;
- (NSString *)concatOneString:(NSString *)one andAnotherString:(NSString *)another;
- (NSInteger)duplicatedMethod;

@end
