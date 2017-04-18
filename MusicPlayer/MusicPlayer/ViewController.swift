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


    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        print("play tapped")
       /* var player: AVAudioPlayer?
        
        func playSound() {
            guard let sound = NSDataAsset(name: "Led Zeppelin - Immigrant Song") else {
                print("asset not found")
                return
            }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
                
                player!.play()
            } catch let error as NSError {
                print("error: \(error.localizedDescription)")
            }
        }*/
    }

}

