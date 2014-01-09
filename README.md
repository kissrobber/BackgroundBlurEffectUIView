#BackgroundBlurEffectUIView

Background Blur Effect for iOS 7 UIView 

Since this is not a subclass of UIView but a category of UIView, you can blur the background of existing UIViews without replacing them with something subclassed.

##Screenshot
![Screenshot](https://raw.github.com/kissrobber/BackgroundBlurEffectUIView/master/screenshot.png "Example of BackgroundBlurEffectUIView")

##How is it done?

see https://github.com/JagCesar/iOS-blur

##Awesome! So, how do I use it?

```
#import "UIView+BackgroundBlurEffect.h"

view.backgroundColor = [UIColor clearColor];
[view setBlurTintColor:[UIColor colorWithRed:0. green:0.7 blue:0. alpha:0.05]];
```

##License
BackgroundBlurEffectUIView is released under the WTFPL-license (see the LICENSE file)
