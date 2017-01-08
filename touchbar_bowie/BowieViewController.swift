//
//  ViewController.swift
//  touchbar_bowie
//
//  Created by Rogelio Alberto on 08/01/2017.
//  Copyright © 2017 rog. All rights reserved.
//

import Cocoa
import AVFoundation


class BowieViewController: NSViewController , NSTouchBarDelegate{
  
  var audio_player: AVAudioPlayer?
  
    @IBOutlet weak var muteBtn: NSButton!
  //NOTE: I fucking love Swift's computed properties!
  var sound: Bool = true {
    
    didSet{
      
      if sound {
        audio_player?.play()
        sound_btn.image = sound_btn_image_on
      }else{
        audio_player?.pause()
        sound_btn.image = sound_btn_image_off
      }

    }
    
  }
  
  var sound_btn_image_on: NSImage?
  var sound_btn_image_off: NSImage?
  
  @IBOutlet weak var sound_btn: NSButtonCell!
  @IBOutlet weak var bkg: NSImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.wantsLayer = true
    self.muteBtn.isHidden = true

    
    bkg.image = NSImage(named: "bowie.jpg”)
    bkg.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
    bkg.animates = true
  }
  
  
  @IBAction func toggle_sound(_ sender: Any) {
    
    //NOTE: Swift's computed properties FTW!
    sound = !sound
  }
  
  override func viewWillAppear() {
    
    //bkg.layer?.backgroundColor = NSColor(red:0.08, green:0.31, blue:0.55, alpha:1.00).cgColor
    
    sound_btn_image_on = NSImage(named: "ic_volume_up_3x.png")
    sound_btn_image_off = NSImage(named: "ic_volume_off_3x.png")

    
//    let bowie_music = URL(fileURLWithPath: Bundle.main.path(forResource: "bowie_music", ofType: "mp3")!)
//    
//    do {
//      
//      try audio_player = AVAudioPlayer(contentsOf: bowie_music)
//      audio_player?.numberOfLoops = -1
//      audio_player?.prepareToPlay()
//      
//    }catch{}
    
    //sound = true


  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

