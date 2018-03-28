//
//  WTSegmentAnimationView.swift
//  LoginAnimation
//
//  Created by Vozye SMC on 3/28/18.
//  Copyright © 2018 Vozye SMC. All rights reserved.
//

import UIKit

protocol WTSegmentViewDelegate {
    func didTapSegmentAtIndex(index : Int)
}


class WTSegmentAnimationView : UIView {
    
    private struct Y  {
     
        static let value = 20
    }
    
    private struct X
    {
        static let selected = 50
        static let unselected = 50
    }
    
    
    var colors = [UIColor]()
    var titles = [String]()
    var delegate : WTSegmentViewDelegate?
    
    private var currentSelectedIndex = 0
    private var firstView : CircleView?
    private var secondView : CircleView?
    
    var textColor = UIColor.black
    var textFont = UIFont(name: "HelveticaNeue", size: 12.0)
    
    init(colors : [UIColor] , titles : [String]  , textColor : UIColor , textFont : UIFont)
    {
        
        self.colors = colors
        self.titles = titles
        self.textColor = textColor
        self.textFont = textFont
        
        super.init(frame: CGRect(x: -150, y: -230, width: 350, height: 300))
        
        self.configureViews()
    }
    
    init(colors : [UIColor] , titles : [String])
    {
        self.colors = colors
        self.titles = titles
        
        super.init(frame: CGRect(x: -100, y: -300, width: 300, height: 300))

        self.configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapatView(view:)))
        
        firstView = CircleView(frame: CGRect(x : X.selected , y : Y.value , width : 350 , height : 300), color: self.colors[0], title: self.titles[0], textColor : self.textColor , textFont : self.textFont!)
        secondView = CircleView(frame: CGRect(x : X.unselected , y : Y.value , width : 350 , height : 300), color: self.colors[1], title: self.titles[1], textColor : self.textColor , textFont : self.textFont!)
        
        secondView?.transform = CGAffineTransform(translationX: 30, y: -10)
        
        firstView!.tag = 0

        secondView!.tag = 1
       
        
        self.addSubview(secondView!)
        self.addSubview(firstView!)
        

        self.addGestureRecognizer(tap)
    }
    
    @objc private func didTapatView(view : UIView)
    {
        currentSelectedIndex = (currentSelectedIndex + 1)%2
        self.animateViews()
        self.delegate?.didTapSegmentAtIndex(index: currentSelectedIndex)
    }
    
    
    private func animateViews()
    {
        var selectedView : CircleView?
        var backgroundView : CircleView?
        
        switch self.currentSelectedIndex
        {
            
        case 0:
            selectedView = firstView
            backgroundView = secondView
            break
            
        case 1:
            selectedView = secondView
            backgroundView = firstView
            break
            
        default :
            break
            
        }
        
        
        backgroundView?.transform = CGAffineTransform(translationX: 0, y: 20)
        self.bringSubview(toFront: selectedView!)

        UIView.animate(withDuration: 0.3) {
            selectedView?.transform = CGAffineTransform.identity
            backgroundView?.transform = CGAffineTransform(translationX: 30, y: 0 )
        }
    }
    
}


private class CircleView : UIView
{
    var title : String
    var textColor : UIColor
    var textFont : UIFont
    
    init(frame : CGRect , color : UIColor , title : String , textColor : UIColor , textFont :  UIFont)
    {
        self.title = title
        self.textColor = textColor
        self.textFont = textFont
        
        super.init(frame: frame)
        
        self.backgroundColor = color
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
        
        self.configureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel()
    {
        let label = UILabel(frame: CGRect(x: 100, y: 210, width: 150, height: 70))
        label.text = self.title
        label.font = self.textFont
        label.textAlignment = .center
        label.textColor = self.textColor
        
        self.addSubview(label)
    }
    
}

