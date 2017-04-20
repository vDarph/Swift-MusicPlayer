//
//  Model.swift
//  MusicPlayer
//
//  Created by Studente on 20/04/17.
//  Copyright © 2017 Studente. All rights reserved.
//

import UIKit

class Model: NSObject {
    var songTitle:String = ""
    var songArtist:String = ""
    var songAlbum:String = ""
    var songFile:String = ""
    
    override init() {
        
        super.init()
    }
    init(title:String,artist:String,album:String) {
        self.songTitle = title
        self.songArtist = artist
        self.songAlbum = album
    }
    
    class func generateModelArray() -> [Model]{
        var modelArray = [Model]()
        
        for i in 0 ... 3 {
            var name = ""
            var artist = ""
            var album = ""
            
            switch i {
            case 0:
                name = ""
                artist = ""
                album = ""
            default:
                break
            }
        let  song:Model = Model(title: name, artist: artist, album: album)
        
            modelArray.append(song)
        }
        
        return modelArray
    }
}
