# WTSegmentView
An animated two Segment View for UIViewController.

![Demo](https://user-images.githubusercontent.com/30927369/38416447-2719d680-39ae-11e8-9ee6-3c63ee5cf760.gif)

# Usage
 let segmentAnimationView = WTSegmentAnimationView(colors: [CAConstants.CAColors.primaryColor, CAConstants.CAColors.secondaryColor], titles: ["Login","Signup"], textColor: UIColor.white, textFont: UIFont(name: "HelveticaNeue-Bold", size: 20.0)!)
 self.view.addSubView(segmentAnimationView)
 
 # Delegate
 for tracking the change of segment , conform the WTSegmentAnimationViewDelegate to your ViewController and implement the method  didTapSegmentAtIndex(index: Int)
 
 segmentAnimationView.delegate = self
 
func didTapSegmentAtIndex(index: Int)
{
  self.updateView()
}

# Installation
Just drag the WTSegmentAnimationView.swift class in your project and you are ready to go ;)
