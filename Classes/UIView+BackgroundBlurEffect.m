#import "UIView+BackgroundBlurEffect.h"
#import <objc/runtime.h>

static void *BackgroundBlurEffectUIViewToolbarKey;

@implementation UIView (BackgroundBlurEffect)

- (void) setBlurTintColor:(UIColor *)blurTintColor
{
    [self setClipsToBounds:YES];
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake([self bounds].origin.x, [self bounds].origin.y, [self bounds].size.width, [self bounds].size.height)];
    [toolbar setBarTintColor: blurTintColor];
    [self.layer insertSublayer:[toolbar layer] atIndex:0];
    if([self BBEView_getToolbar] == nil){
        [[self class] BBEView_overrideLayoutSubViews];
    }
    [self BBEView_setToolbar:toolbar];
}

+ (void) BBEView_overrideLayoutSubViews
{
    SEL originalSelector = @selector(layoutSubviews);
    SEL overrideSelector = @selector(BBEView_layoutSubviews);
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method overrideMethod = class_getInstanceMethod(self, overrideSelector);
    method_exchangeImplementations(originalMethod, overrideMethod);
}

- (void)BBEView_layoutSubviews
{
    [self BBEView_layoutSubviews];
    UIToolbar *toolbar = [self BBEView_getToolbar];
    if(toolbar != nil){
        [toolbar setFrame:[self bounds]];
    }
}

- (void)BBEView_setToolbar:(UIToolbar*)toolbar
{
    objc_setAssociatedObject(self, &BackgroundBlurEffectUIViewToolbarKey, toolbar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIToolbar*)BBEView_getToolbar
{
    return objc_getAssociatedObject(self, &BackgroundBlurEffectUIViewToolbarKey);
}

@end
