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
    @IBOutlet weak var playerTrackViewText: PlayerTrackViewText!
    @IBOutlet weak var songTitleField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var reasonAddedField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var currentTimeField: UITextField!
    @IBOutlet weak var startSongTimerButton: UIButton!
    @IBOutlet weak var hideButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    var timer = Timer()
    var startDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerTrackViewText.delegate = self
        
        playerTrackViewText.setTitles(title: "Song Title", artist: "Artist Name", addedBy: "Reason Added")
        playerTrackView.setDuration(duration: 300)
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: 0.5, duration: 300, animated: true)
    }

    
    @IBAction func startSongTimer(_ sender: UIButton) {
        guard let duration = durationField.text, let durationValue = Int(duration) else {
            return
        }
        self.startDate = Date()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: #selector(self.timerFired(_:)), userInfo: nil, repeats: true)
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: 0.3, duration: durationValue, animated: true)
        //figure out seconds left n
        //call every tenth of a second for n seconds
    }
    
    @IBAction func hideButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.playerTrackViewText.hideMuteAndSkip(hide: true)
            self.playerTrackViewText.layoutIfNeeded()
        }) { (finished: Bool) in
        }
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.playerTrackViewText.hideMuteAndSkip(hide: false)
            self.playerTrackViewText.layoutIfNeeded()
        }
    }
    
    @objc private func timerFired(_ timer: Timer) {
        guard let startDate = startDate else {
            return
        }
        let millisecondsSinceStart = -startDate.timeIntervalSinceNow
        guard let duration = durationField.text, let durationValue = Float(duration) else {
            return
        }
        let progress: Float = Float(millisecondsSinceStart) / durationValue
        self.playerTrackView.setCurrentTimeValues(currentSongTimeFloat: progress, duration: Int(durationValue), animated: false)
    }
    
    @IBAction func doneButtonPress(_ sender: UIButton) {
        guard let songTitle = songTitleField.text, let artistName = artistField.text, let reasonAdded = reasonAddedField.text else {
            
            return
        }
        guard let duration = durationField.text, let durationValue = Int(duration) else {
            return
        }
        playerTrackViewText.setTitles(title: songTitle, artist: artistName, addedBy: reasonAdded)
        playerTrackView.setDuration(duration: durationValue)
    }
    
    @IBAction func currentTimeButtonPress(_ sender: UIButton) {
        guard let currentTime = currentTimeField.text, let currentTimeValue = Float(currentTime), let duration = durationField.text, let durationValue = Int(duration) else {
            return
        }
        playerTrackView.setCurrentTimeValues(currentSongTimeFloat: currentTimeValue, duration: durationValue, animated: true)
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

extension ViewController: PlayerTrackViewTextDelegate {
    func muteTapped() {
        print("mute button tapped")
    }
    
    func skipTapped() {
        print("skip button tapped")
    }
    
    func moreTapped() {
        print("more button tapped")
    }
}
