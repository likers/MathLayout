# MathLayout
Make Swift Auto Layout in a most straightforward way. Just like you are doing linear equations.

```
import UIKit

class ViewController: UIViewController {

    let topView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        
        topView.topAnchor == self.view.topAnchor + 50
        topView.leftAnchor == self.view.leftAnchor + 50
        topView.widthAnchor == 100
        topView.heightAnchor == 100
    }
  
}
```
##Requirements
- iOS 9.0+
- Swift 2.0+
- Xcode 7.0+

> - MathLayout is based on iOS 9.0's new [NSLayoutAnchor](https://developer.apple.com/library/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/) 
class, which requires iOS 9.0+. 
- We recommend to use Apple's native properties like `leftAnchor`,`widthAnchor`, we also offer you the shorter version: `mlLeft`,
`mlWidth`.

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
  
topView.translatesAutoresizingMaskIntoConstraints = false
self.view.addSubview(topView)

topView.topAnchor == self.view.topAnchor + 50
topView.leftAnchor == self.view.leftAnchor + 50
topView.bottomAnchor == self.view.bottomAnchor - 50
topView.rightAnchor == self.view.rightAnchor - 50
```

or even shorter with MathLayoutShortCut:

```
let topView = UIView()
	
topView.translatesAutoresizingMaskIntoConstraints = false
self.view.addSubview(topView)
	
topView.mlAll == self.view.mlAll + 50
```

##We have more shortcuts
- **mlAll**: All four edges, top, left, botom and right
- **mlTopLeft**, **mlLeftBottom**, **mlBottomRight**, **mlTopRight**: Four corners of a retangular, respectively
- **mlCenter**: Horizontal and vertical center

##Notes
- MathLayout is a syntax sugar based on operator overloading, if you don't like it then [SnapKit](https://github.com/SnapKit/SnapKit) is a better choice.
- Please remember to set `view.translatesAutoresizingMaskIntoConstraints = false` before adding constraints.