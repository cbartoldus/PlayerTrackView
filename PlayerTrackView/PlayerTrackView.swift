//
//  PlayerTrackView.swift
//  PlayerTrackView
//
//  Created by Chris Bartoldus on 7/10/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import UIKit

class PlayerTrackView: NibView {
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var reasonAdded: UILabel!
    
    @IBOutlet var playerProgressBar: UIProgressView!
    
    @IBOutlet weak var currentSongTime: UILabel!
    
    @IBOutlet weak var songDuration: UILabel!
    
    func setTitles(title: String, artist: String, addedBy: String, duration: Int) {
        self.songTitle.text = title
        self.artistName.text = artist
        self.reasonAdded.text = addedBy
        let durationDouble = Double(duration)
        
        self.songDuration.text = doubleToStringTimeFormatting(duration: durationDouble)
    }
    
    
    func setCurrentTimeValues(currentSongTimeFloat: Float, duration: Int) {
        playerProgressBar.setProgress(currentSongTimeFloat, animated: true)
        
        let currentSongTimeDouble: Double = Double(currentSongTimeFloat) * Double(duration)
        

        self.currentSongTime.text = doubleToStringTimeFormatting(duration: currentSongTimeDouble)
    }
    
    func doubleToStringTimeFormatting(duration: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        return formatter.string(from: duration)!
    }
    
    
}
