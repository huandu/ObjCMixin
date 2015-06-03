//
//  Mixin.h
//
//  Created by Huan Du on 6/3/15.
//  Copyright (c) 2015 Huan Du. All rights reserved.
//

#define module(m) interface __Module__##m : NSObject \
    @end \
    @protocol m

#define module_category(m, ...) interface __Module__##m ()

#define module_implementation(m) interface __Module__##m (ModuleImplementation) <m>  \
    @end \
    @implementation __Module__##m

#define mixin(target, m) interface target () <m> \
    @end \
    __attribute__((constructor)) \
    static void __mixin_register_##__LINE__() { \
        extern Class objc_getClass(const char *name); \
        [Mixin mixClass:objc_getClass("__Module__" #m) toTargetClass:[target class]]; \
    }

@interface Mixin : NSObject

+(void)mixClass:(Class)cls toTargetClass:(Class)targetCls;

@end
