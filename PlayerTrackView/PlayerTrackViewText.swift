//
//  PlayerTrackViewText.swift
//  PlayerTrackView
//
//  Created by Chris Bartoldus on 7/11/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import UIKit

protocol PlayerTrackViewTextDelegate {
    func muteTapped ()
    func skipTapped ()
    func moreTapped ()
}

class PlayerTrackViewText: NibView {
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var reasonAdded: UILabel!
    
    @IBOutlet weak var textVerticalSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var muteButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var moreButton: UIButton!
    
    var delegate: PlayerTrackViewTextDelegate?
    
    //Button Actions
    @IBAction func muteTapped(_ sender: UIButton) {
        self.delegate?.muteTapped()
    }
    
    @IBAction func skipTapped(_ sender: UIButton) {
        self.delegate?.skipTapped()
    }
    
    @IBAction func moreTapped(_ sender: UIButton) {
        self.delegate?.moreTapped()
    }
    
    func hideMuteAndSkip(){
        self.muteButton.isHidden = true
        self.skipButton.isHidden = true
        //growVerticalSpaceConstraint()
    }
    
    func showMuteAndSkip(){
        self.muteButton.isHidden = false
        self.skipButton.isHidden = false
        //shrinkVerticalSpaceConstraint()
    }
    
    func growVerticalSpaceConstraint() {
        textVerticalSpaceConstraint.constant = 5
    }
    
    func shrinkVerticalSpaceConstraint() {
        textVerticalSpaceConstraint.constant = 3
    }
    
    func setTitles(title: String, artist: String, addedBy: String) {
        self.songTitle.text = title
        self.artistName.text = artist + "  •"
        self.reasonAdded.text = addedBy
        
    }
    
    
    


}

