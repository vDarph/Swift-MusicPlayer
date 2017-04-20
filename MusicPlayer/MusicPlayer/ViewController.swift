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
    @IBOutlet weak var timeSlider: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var song:Model = Model();
        song.songFile = "Immigrant Song"
        
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
    
    @IBAction func playButton(_ sender: UIButton) {
        print("play tapped")
        audioPlayer.play()
    }
    
    
}


