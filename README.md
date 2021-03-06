# MathLayout
Make Swift Auto Layout in a most straightforward way. Just like you are doing simple linear equations and get rid of annoying syntaxes.

```
import UIKit

class ViewController: UIViewController {

    let topView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(topView)
        
        topView.top ==== self.view.top + 50
        topView.left ==== self.view.left + 50
        topView.width ==== 100
        topView.height ==== 100
    }
}
```
##Requirements
- iOS 9.0+
- Swift 2.0+
- Xcode 7.0+

> - MathLayout is based on iOS 9.0's new [NSLayoutAnchor](https://developer.apple.com/library/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/) 
class, which requires iOS 9.0+. 
- We use like `left`, `right`, `top` annotations for shortcut. I know that will be conflict with some self defined position properties. You can easliy change them to whatever you prefer in MathLayout.swift file if you want to.

##Installing
Just add `MathLayout.swift` into your project and start having fun.

##Usage
MathLayout is designed to get rid of all the complex syntax of programmatically auto layout 
([Layout Anchors](https://developer.apple.com/library/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/), 
[NSLayoutConstraint](https://developer.apple.com/library/ios/documentation/AppKit/Reference/NSLayoutConstraint_Class/index.html#//apple_ref/occ/cl/NSLayoutConstraint) and 
[Visual Format Language](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH27-SW1)).

Let's say we want to layout a view that is constrained to it's superview's edges with 50pts of padding.

```
let topView = UIView()
  
self.view.addSubview(topView)

topView.topAnchor ==== self.view.topAnchor + 50
topView.leftAnchor ==== self.view.leftAnchor + 50
topView.bottomAnchor ==== self.view.bottomAnchor - 50
topView.rightAnchor ==== self.view.rightAnchor - 50
```

or:

```
topView.top ==== self.view.top + 50
topView.left ==== self.view.left + 50
topView.bottom ==== self.view.bottom - 50
topView.right ==== self.view.right - 50
```


or even shorter with MathLayoutShortCut:

```
topView.all ==== self.view.all + 50
```

###Using multiplier

```
topView.width ==== 0.5*self.view.width + 50
topView.height ==== 100
```

###Center Alignment

```
topView.centerX ==== self.view.centerX + 50
topView.centerY ==== self.view.centerY
```

or center X and Y axis, with/without offset

```
topView.centerXY ==== self.view.centerXY + 50
```

##We have more shortcuts
- **all**: All four edges, top, left, botom and right
- **topLeft**, **leftBottom**, **bottomRight**, **topRight**: Four corners of a retangular, respectively
- **centerXY**: Horizontal and vertical center

##Notes

- MathLayout is a syntax sugar based on operator overloading, if you don't like it then [SnapKit](https://github.com/SnapKit/SnapKit) is a better choice.

- I use the weird "====" to do the same thing as "=", or "equal to", while you don't need to worry about conflicts. What's more the longest operator in iOS history will let you find your autolayout codes much easier :)

