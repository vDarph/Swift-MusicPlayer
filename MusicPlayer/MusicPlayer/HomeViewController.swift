//
//  HomeViewController.swift
//  MusicPlayer
//
//  Created by Studente on 19/04/17.
//  Copyright © 2017 Studente. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var songList: UITableView!

    var songCollection = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        songCollection = Model.generateModelArray()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let defaults = UserDefaults.standard
        defaults.set((songCollection[indexPath.row]).songFile, forKey: "selectedSong")
       
        
        var playList:[String] = []
        
        for song:Model in songCollection {
            
            playList.append(song.songFile)
        }
        
        defaults.set(playList, forKey: "playList")
        
        defaults.synchronize()
        
        self.performSegue(withIdentifier: "mostraCanzoneSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return songCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songPlace")
        
        let riga:Model = songCollection[indexPath.row]
        
        //cell?.textLabel?.text = riga.songTitle
        //cell?.detailTextLabel?.text = riga.songArtist
        
        let cover:UIImageView = cell?.viewWithTag(1) as! UIImageView
        cover.image = riga.songCover
        
        let title:UILabel = cell?.viewWithTag(2) as! UILabel
        title.text = riga.songTitle
        
        let artist:UILabel = cell?.viewWithTag(3) as! UILabel
        artist.text = riga.songArtist
        
        return cell!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
