//
//  ViewController.swift
//  PlayerTrackView
//
//  Created by Chris Bartoldus on 7/10/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerTrackView: PlayerTrackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        playerTrackView.setTitles(title: "Hi", artist: "Artist", addedBy: "Added By Me", duration: 300)
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: 0.3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

