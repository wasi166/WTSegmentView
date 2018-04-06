# WTSegmentView
An animated two Segment View for UIViewController.

# Usage
 let segmentAnimationView = WTSegmentAnimationView(colors: [CAConstants.CAColors.primaryColor, CAConstants.CAColors.secondaryColor], titles: ["Login","Signup"], textColor: UIColor.white, textFont: UIFont(name: "HelveticaNeue-Bold", size: 20.0)!)
 self.view.addSubView(segmentAnimationView)
 
 # Delegated
 for tracking the change of segment , conform the WTSegmentAnimationViewDelegate to your ViewController and implement the method  didTapSegmentAtIndex(index: Int)
 
 segmentAnimationView.delegate = self
 
func didTapSegmentAtIndex(index: Int)
{
  self.updateView()
}

