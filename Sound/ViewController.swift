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
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func pauseAction(_ sender: Any) {
        player.pause()
    }
    @IBAction func volumeSliderAction(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let audioPath = Bundle.main.path(forResource: "AgeOfWorry", ofType: "mp3")
        do {
            player = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            print("Error Page")
        }
    }


}

