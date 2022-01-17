//
//  ViewController.swift
//  Sound
//
//  Created by IMCS on 8/8/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var NameofSong: UILabel!
    
    let songsName = ["AgeOfWorry", "LeavingOnTheJetPlane", "HeyJude", "Bimbaakash4" , "Prayas5", "Aaudai6", "Syndicate7", "Gede8", "Baal9", "ApnaTime10"]
    
    let songsCount = 10
    
    var currentSong = 0
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    func Next() {
        currentSong += 1
        if currentSong>songsCount-1 {currentSong = songsCount-1}
        playSong(currentSong)
    }
    
    func Back() {
        currentSong -= 1
              print(currentSong)
        if currentSong<0 {
            
            currentSong = 0
            
        }
        playSong(currentSong)
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func pauseAction(_ sender: Any) {
        player.pause()
    }
    @IBAction func volumeSliderAction(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            print("Device was shaken.")
            
             playSong(Int.random(in: 0 ... songsCount))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        playSong(0)
        
    }
    
    func playSong(_ currentSong:Int) {
        
        print(currentSong)
        let audioPath = Bundle.main.path(forResource: songsName[currentSong], ofType: "mp3")
        do {
            player = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: audioPath!))
            NameofSong.text = songsName[currentSong]
        } catch {
            print("Error Page")
        }
        
        player.play()
    }
    
    
    @objc func swipped(gesture: UISwipeGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                Back()
                
            } else {
                Next()
            }
        }
    }


}

