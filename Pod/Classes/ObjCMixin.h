//
//  ObjCMixin.h
//  Pods
//
//  Created by Huan Du on 7/2/15.
//
//

#define module(m) interface __Module__##m : NSObject \
@end \
@protocol m

#define module_category(m, ...) interface __Module__##m ()

#define module_implementation(m) interface __Module__##m (ModuleImplementation) <m> \
@end \
\
@implementation __Module__##m

#define mixin(target, m) interface target () <m> \
@end \
\
__attribute__((constructor)) \
static void __mixin_register_##__LINE__() { \
    extern Class objc_getClass(const char *); \
    [ObjCMixin mixClass:objc_getClass("__Module__" #m) toTargetClass:[target class]]; \
}

#define module_ivar(self, ivar) (([ObjCMixin associatedDictionaryForInstance:self withPrefix:"__mixin_custom_class__"])[@(#ivar)])

@interface ObjCMixin : NSObject

+ (void)mixClass:(Class)cls toTargetClass:(Class)targetCls;
+ (NSMutableDictionary *)associatedDictionaryForInstance:(id)inst withPrefix:(const char *)prefix;

@end
