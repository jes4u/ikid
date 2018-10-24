//
//  punJokeSwitchVC.swift
//  iKid
//
//  Created by iosdev on 10/24/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class punJokeSwitchVC: UIViewController {
    
    fileprivate var punJoke1 : punJoke1VC!
    fileprivate var punJoke2 : punJoke2VC!
    fileprivate var punJoke3 : punJoke3VC!
    fileprivate var punJoke4 : punJoke4VC!
    fileprivate var punJoke5 : punJoke5VC!
    
    fileprivate func punJoke1Builder() {
        if punJoke1 == nil {
            punJoke1 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "punJoke1")
                    as! punJoke1VC)
        }
    }
    fileprivate func punJoke2Builder() {
        if punJoke2 == nil {
            punJoke2 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "punJoke2")
                    as! punJoke2VC)
        }
    }
    fileprivate func punJoke3Builder() {
        if punJoke3 == nil {
            punJoke3 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "punJoke3")
                    as! punJoke3VC)
        }
    }
    fileprivate func punJoke4Builder() {
        if punJoke4 == nil {
            punJoke4 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "punJoke4")
                    as! punJoke4VC)
        }
    }
    fileprivate func punJoke5Builder() {
        if punJoke5 == nil {
            punJoke5 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "punJoke5")
                    as! punJoke5VC)
        }
    }
    

    @IBAction func punJokeForwardSwitchView(_ sender: Any) {
        punJoke1Builder()
        punJoke2Builder()
        punJoke3Builder()
        punJoke4Builder()
        punJoke5Builder()
        
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if punJoke1 != nil && punJoke1?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punJoke2.view.frame = view.frame
            punJokeSwitchViewController(punJoke1, to: punJoke2)
            
        } else if punJoke2 != nil && punJoke2?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punJoke3.view.frame = view.frame
            punJokeSwitchViewController(punJoke2, to: punJoke3)
            
        } else if punJoke3 != nil && punJoke3?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punJoke3.view.frame = view.frame
            punJokeSwitchViewController(punJoke3, to: punJoke4)
            
        } else if punJoke4 != nil && punJoke4?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punJoke4.view.frame = view.frame
            punJokeSwitchViewController(punJoke4, to: punJoke5)
            
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punJoke1.view.frame = view.frame
            punJokeSwitchViewController(punJoke5, to: punJoke1)
        }
        
        UIView.commitAnimations()
    }
    
    
    fileprivate func punJokeSwitchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        punJoke1Builder()
        punJokeSwitchViewController(nil, to: punJoke1)
    }
    


}
