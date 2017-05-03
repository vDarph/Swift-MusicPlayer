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
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionArtist: UILabel!
    @IBOutlet weak var descriptionCover: UIImageView!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var sliderContainerView: UIView!
    
    var sliderView:PRGRoundSlider?
    
    var songCollection = [Model()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songCollection = Model.generateModelArray()
        
        //take song from previous viewController
        let defaults = UserDefaults.standard
        let canzoneNomeFile:String = defaults.string(forKey: "selectedSong")! //songFile name
        
        // set var song as the song array
        var song:Model = Model()
        
        for canzone:Model in songCollection {
            if canzone.songFile == canzoneNomeFile {
                song = canzone
                break;
            }
        }
       
        do {
            let musicPath = Bundle.main.path(forResource: song.songFile, ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: musicPath!) as URL)
            audioPlayer.play()
            audioPlayer.volume = 0.3
            
            switchAudioStatusBtn()
        }
        catch{
            print("error: song not found")
        }
        
        //set background image
        backgroundImg.image = song.songCover
        
        descriptionTitle.text = song.songTitle
        descriptionArtist.text = song.songArtist
        descriptionCover.image = song.songCover
        
        /*descriptionCover.layer.borderWidth = 1
        descriptionCover.layer.masksToBounds = false
        descriptionCover.layer.borderColor = UIColor.black.cgColor
        descriptionCover.layer.cornerRadius = descriptionCover.frame.height/2
        descriptionCover.clipsToBounds = true*/
        
        //UILabel for song duration
        let minuti:Int = Int(audioPlayer.duration)/60
        let secondi:Int = Int(audioPlayer.duration)%60
        let min = minuti < 10 ? "0\(minuti)" : "\(minuti)"
        let sec = secondi < 10 ? "0\(secondi)" : "\(secondi)"
        totalTime.text = "\(min):\(sec)"
        
        setupSliderProgrammatically(startText: "00:00", endText:totalTime.text!)
        
        //set UISlider to match song duration
        timeSlider.maximumValue = Float(audioPlayer.duration)
        
        //link update function to UISlider
        _ = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(ViewController.updateTimeSlider), userInfo: nil, repeats: true)
        
        //ascolta la notifica che generi nello slider, ed invoca una funzione che cambia la posizione della traccia audio (tempo == 0...1%)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        audioPlayer.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func switchAudioStatusBtn() {
        if audioPlayer.isPlaying {
            playBtn.isHidden = true
            pauseBtn.isHidden = false
        }
        else {
            playBtn.isHidden = false
            pauseBtn.isHidden = true
        }
    }
    
    func setupSliderProgrammatically(startText:String, endText:String){
        sliderView = PRGRoundSlider(
            frame: sliderContainerView.bounds,
            value: 0.5,
            strokeColor: SliderKit.darkBlueColor,
            strokeWidth: 3,
            gradientColor: SliderKit.darkPinkColor,
            startAngle: 210,
            endAngle: -30,
            startText: startText,
            endText: endText)
        { (value) in
            return "\(Int(value*100))%"
        }
        
        
        sliderContainerView.addSubview(sliderView!)
        
    }

    
    //press button to play
    @IBAction func playButton(_ sender: Any) {
        audioPlayer.play()
        switchAudioStatusBtn()
    }
    
    //press button to pause
    @IBAction func pauseButton(_ sender: Any) {
        audioPlayer.pause()
        switchAudioStatusBtn()
    }
    
    //UISlider gets song currentTime
    @IBAction func timeSlider(_ sender: Any) {
        audioPlayer.currentTime = TimeInterval(timeSlider.value)
    }
    
    //update UISlider status while song is playing
    func updateTimeSlider() {
        timeSlider.value = Float(audioPlayer.currentTime)
       // sliderView!.value =  (CGFloat(audioPlayer.currentTime)/100)/CGFloat(audioPlayer.duration)
        
        //set current time on the UILabel in "mm:ss"
        let minuti:Int = Int(audioPlayer.currentTime)/60
        let secondi:Int = Int(audioPlayer.currentTime)%60
        let min = minuti < 10 ? "0\(minuti)" : "\(minuti)"
        let sec = secondi < 10 ? "0\(secondi)" : "\(secondi)"
        currentTime.text = "\(min):\(sec)"
        
    }

    
    
    
}
