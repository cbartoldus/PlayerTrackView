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
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var textVerticalSpaceConstraint: NSLayoutConstraint!
    
    var initialSkipButtonWidthConstraint: CGFloat = 0
    var initialMuteButtonWidthConstraint: CGFloat = 0
    var initialButtonWidth: CGFloat = 0
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
    
    func hideMuteAndSkip(hide: Bool){
        let muteTransform: CGAffineTransform
        let skipTransform: CGAffineTransform
        let alpha: CGFloat
        if (hide) {
            muteTransform = CGAffineTransform(scaleX: 0.2, y: 0.2).concatenating(CGAffineTransform.init(translationX: self.initialButtonWidth * 2, y: 0))
            skipTransform = CGAffineTransform(scaleX: 0.2, y: 0.2).concatenating(CGAffineTransform.init(translationX: self.initialButtonWidth, y: 0))
            alpha = 0
            growVerticalSpaceConstraint()
        } else {
            muteTransform = CGAffineTransform.identity
            skipTransform = CGAffineTransform.identity
            alpha = 1
            shrinkVerticalSpaceConstraint()
        }
        self.muteButton.transform = muteTransform
        self.skipButton.transform = skipTransform
        self.muteButton.alpha = alpha
        self.skipButton.alpha = alpha
        
    }
    
    func growVerticalSpaceConstraint() {
        textVerticalSpaceConstraint.constant = 5
    }
    
    func shrinkVerticalSpaceConstraint() {
        textVerticalSpaceConstraint.constant = 3
    }
    
    func setTitles(title: String, artist: String, addedBy: String) {
        self.songTitle.text = title
        self.artistName.text = artist
        self.reasonAdded.text = addedBy
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialButtonWidth = self.muteButton.frame.size.width
    }
    


}

