//
//  Mixin.m
//
//  Created by Huan Du on 6/3/15.
//  Copyright (c) 2015 Huan Du. All rights reserved.
//

#import <objc/runtime.h>

#import "ObjCMixin.h"

@interface ObjCMixin()

+ (void)copyMethodsFromClass:(Class)cls toTargetClass:(Class)targetCls;

@end

@implementation ObjCMixin

+ (void)mixClass:(Class)cls toTargetClass:(Class)targetCls {
    [self copyMethodsFromClass:cls toTargetClass:targetCls];
}

+ (void)copyMethodsFromClass:(Class)cls toTargetClass:(Class)targetCls {
    unsigned int cnt = 0;
    Method *methods = class_copyMethodList(cls, &cnt);
    
    if (!methods) {
        NSLog(@"Mixin: fail to mix %s to %s", class_getName(cls), class_getName(targetCls));
        return;
    }
    
    for (unsigned int i = 0; i < cnt && methods[i]; i++) {
        Method m = methods[i];
        SEL sel = method_getName(m);
        IMP imp = class_getMethodImplementation(cls, sel);
        const char *types = method_getTypeEncoding(m);
        class_addMethod(targetCls, sel, imp, types);
        
        NSLog(@"Mixin: added method %s", sel_getName(sel));
    }
    
    free(methods);
}

+ (NSMutableDictionary *)associatedDictionaryForInstance:(id)inst withPrefix:(const char *)prefix {
    id assoc = objc_getAssociatedObject(inst, prefix);
    
    if (assoc == nil) {
        assoc = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(inst, prefix, assoc, OBJC_ASSOCIATION_RETAIN);
    }
    
    return (NSMutableDictionary *)assoc;
}

@end

