//
//  OCMTestModule.m
//  ObjCMixin
//
//  Created by Huan Du on 7/2/15.
//  Copyright (c) 2015 Huan Du. All rights reserved.
//

#import "OCMTestModule.h"

// Implement the module.
@module_implementation(OCMTestModule)

#pragma mark - Properties

- (void)setPrefix:(NSString *)prefix {
    module_ivar(self, prefix) = prefix;
}

- (NSString *)prefix {
    return module_ivar(self, prefix);
}

#pragma mark - Methods

- (void)hello {
    NSLog(@"Say hello!");
}

- (NSString *)concatOneString:(NSString *)one andAnotherString:(NSString *)another {
    NSString *prefix = module_ivar(self, prefix);
    
    if (prefix == nil) {
        prefix = @"PREFIX";
    }
    
    NSNumber *count = module_ivar(self, count);
    
    if (count == nil) {
        count = [NSNumber numberWithInt:1];
    } else {
        count = [NSNumber numberWithInt:count.intValue + 1];
    }
    
    module_ivar(self, count) = count;

    return [NSString stringWithFormat:@"%@: %@ %@ %@", prefix, one, another, count];
}

- (NSInteger)duplicatedMethod {
    return 10;
}

@end
