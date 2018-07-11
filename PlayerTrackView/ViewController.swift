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
    
    @IBOutlet weak var songTitleField: UITextField!
    
    @IBOutlet weak var artistField: UITextField!
    
    @IBOutlet weak var reasonAddedField: UITextField!
    
    @IBOutlet weak var durationField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var currentTimeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTrackView.setTitles(title: "Hi", artist: "Artist", addedBy: "Added By Me", duration: 300)
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: 0.3, duration: 300)
        
        
    }
    
    @IBAction func doneButtonPress(_ sender: UIButton) {
        guard let songTitle = songTitleField.text, let artistName = artistField.text, let reasonAdded = reasonAddedField.text else {
            
            return
        }
        guard let duration = durationField.text, let durationValue = Int(duration) else {
            return
        }
        playerTrackView.setTitles(title: songTitle, artist: artistName, addedBy: reasonAdded, duration: durationValue)

    }
    
    @IBAction func currentTimeButtonPress(_ sender: UIButton) {
        guard let currentTime = currentTimeField.text, let currentTimeValue = Float(currentTime), let duration = durationField.text, let durationValue = Int(duration) else {
            return
        }
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: currentTimeValue, duration: durationValue)
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

