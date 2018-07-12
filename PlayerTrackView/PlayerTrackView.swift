//
//  PlayerTrackView.swift
//  PlayerTrackView
//
//  Created by Chris Bartoldus on 7/10/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import UIKit

class PlayerTrackView: NibView {
    
    
    @IBOutlet var playerProgressBar: UIProgressView!
    
    @IBOutlet weak var currentSongTime: UILabel!
    
    @IBOutlet weak var songDuration: UILabel!
    
    
    func setDuration(duration: Int) {
        let durationDouble = Double(duration)
        
        self.songDuration.text = doubleToStringTimeFormatting(duration: durationDouble)
    }
    
    @objc func setCurrentTimeValues(currentSongTimeFloat: Float, duration: Int, animated: Bool) {
        
        var currentSongTimeDouble: Double = Double(currentSongTimeFloat) * Double(duration)
        
        if currentSongTimeFloat < 0 {
            playerProgressBar.setProgress(0.0, animated: animated)
            currentSongTimeDouble = 0.0
        } else if currentSongTimeFloat > 1 {
            playerProgressBar.setProgress(1.0, animated: animated)
            currentSongTimeDouble = Double(duration)
        } else {
            playerProgressBar.setProgress(currentSongTimeFloat, animated: animated)
        }
        

        self.currentSongTime.text = doubleToStringTimeFormatting(duration: currentSongTimeDouble)
    }
    
    func doubleToStringTimeFormatting(duration: Double) -> String {
        let formatter = DateComponentsFormatter()
        
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [ .pad ]
        if duration > 3600.0 {
            formatter.allowedUnits = [.hour, .minute, .second ]
        } else {
            formatter.allowedUnits = [ .minute, .second ]
        }
        
        return formatter.string(from: duration)!
    }
    
}
