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
    var songCover:UIImage!
    var songFile:String = ""
    
    override init() {
        
        super.init()
    }
    init(title:String,artist:String,album:String,cover:UIImage,file:String) {
        self.songTitle = title
        self.songArtist = artist
        self.songAlbum = album
        self.songCover = cover
        self.songFile = file
    }
    
    class func generateModelArray() -> [Model]{
        var modelArray = [Model]()
        
        for i in 0 ... 3 {
            var name = ""
            var artist = ""
            var album = ""
            var cover = UIImage()
            var file = ""
            
            switch i {
            case 0:
                name = "Immigrant Song"
                artist = "Led Zeppelin"
                album = "Led Zeppelin III"
                cover = UIImage.init(named: "\(0)")!
                file = "0"
                break
                
            case 1:
                name = "Feel Good Inc."
                artist = "Gorillaz"
                album = "Demon Days"
                cover = UIImage.init(named: "\(1)")!
                file = "1"
                break
                
            case 2:
                name = "Catgroove"
                artist = "Parov Stelar"
                album = "Coco"
                cover = UIImage.init(named: "\(2)")!
                file = "2"
                break
                
            case 3:
                name = "Love Will Tear Us Apart"
                artist = "Joy Division"
                album = "The Peel Sessions"
                cover = UIImage.init(named: "\(3)")!
                file = "3"
                break
            default:
                break
            }
            let  song:Model = Model(title: name, artist: artist, album: album, cover: cover, file: file)
        
            modelArray.append(song)
        }
        
        modelArray.sort { (a, b) -> Bool in
            return a.songTitle.compare(b.songTitle) == .orderedAscending
        }
        
        return modelArray
    }
}
