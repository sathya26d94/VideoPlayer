//
//  ViewController.swift
//  VideoPlayer
//
//  Created by SaTHYa on 24/04/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let videoViewController:VideoViewController = VideoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.view.addSubview(videoViewController.view)
        setConstraint()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
       setConstraint()
    }
    
    func setConstraint() {
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            landscapeConstraint()
        } else {
            portairtConstraint()
        }
    }

}

extension ViewController {
    
    func portairtConstraint(){
        videoViewController.view.removeConstraints()
        videoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        let leftEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let rightEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let topEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 110)
        self.view.addConstraints([leftEdgeConstraint,rightEdgeConstraint,topEdgeConstraint,heightConstraint])
    }
    
    func landscapeConstraint(){
        videoViewController.view.removeConstraints()
        videoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        let leftEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let rightEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let topEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let BottomEdgeConstraint = NSLayoutConstraint(item: videoViewController.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        self.view.addConstraints([leftEdgeConstraint,rightEdgeConstraint,topEdgeConstraint,BottomEdgeConstraint])
    }
}

extension UIView {
    
    func removeConstraints() {
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []
        self.superview?.removeConstraints(constraints)
        self.removeConstraints(self.constraints)
    }
}