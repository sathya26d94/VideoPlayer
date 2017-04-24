//
//  VideoViewController.swift
//  VideoPlayer
//
//  Created by SaTHYa on 24/04/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("dhoni", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        let player = AVPlayer(URL: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}