//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Studente on 18/04/17.
//  Copyright © 2017 Studente. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        let canzone = defaults.integer(forKey: "selectedSong") //0...n-1

        
        let song:Model = Model();
        song.songFile = String(canzone)
        
        do {
            let musicPath = Bundle.main.path(forResource: song.songFile, ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: musicPath!) as URL)
        }
        catch{
            print("error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var audioIsPlaying = false
    
    @IBAction func playButton(_ sender: UIButton) {
        print("play tapped")
        audioPlayer.play()
        audioIsPlaying = true
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        audioPlayer.volume = volumeSlider.value
    }
    
    
    
}


