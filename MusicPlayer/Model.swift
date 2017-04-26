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
    init(title:String,artist:String,album:String,file:String) {
        self.songTitle = title
        self.songArtist = artist
        self.songAlbum = album
        self.songFile = file
    }
    
    class func generateModelArray() -> [Model]{
        var modelArray = [Model]()
        
        for i in 0 ... 3 {
            var name = ""
            var artist = ""
            var album = ""
            var file = ""
            
            switch i {
            case 0:
                name = "Immigrant Song"
                artist = "Led Zeppelin"
                album = "Led Zeppelin III"
                file = "01"
                break
                
            case 1:
                name = "Feel Good Inc."
                artist = "Gorillaz"
                album = "Demon Days"
                file = "02"
                break
                
            case 2:
                name = "Catgroove"
                artist = "Parov Stelar"
                album = "Coco"
                file = "03"
                break
                
            case 3:
                name = "Love Will Tear Us Apart"
                artist = "Joy Division"
                album = "The Peel Sessions"
                file = "04"
                break
            default:
                break
            }
            let  song:Model = Model(title: name, artist: artist, album: album, file: file)
        
            modelArray.append(song)
        }
        
        return modelArray
    }
}
