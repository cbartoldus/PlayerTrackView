//
//  PlayerTrackViewText.swift
//  PlayerTrackView
//
//  Created by Chris Bartoldus on 7/11/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import UIKit

class PlayerTrackViewText: NibView {
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var reasonAdded: UILabel!
    
    @IBOutlet weak var textVerticalSpaceConstraint: NSLayoutConstraint!
    
    func updateVerticalSpaceConstraint() {
        textVerticalSpaceConstraint.constant = 3
    }
    
    func setTitles(title: String, artist: String, addedBy: String) {
        self.songTitle.text = title
        self.artistName.text = artist + "  •"
        self.reasonAdded.text = addedBy
        
    }
    
    
    


}
