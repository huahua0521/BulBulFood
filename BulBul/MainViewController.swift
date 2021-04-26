//
//  MainViewController.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/20.
//

import UIKit
import AVKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var mainImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        startPlayer()
        
//        https://api.airtable.com/v0/appEyb6PJIhBrKOQz/Fruit?api_key=keygHTQcnAknXc3jJ&sort[][field]=rating&sort[][direction]=desc
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
 
    var player = AVPlayer()
    var looper: AVPlayerLooper?
    func startPlayer() {
        
        if let url = URL(string: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview114/v4/a0/f3/b5/a0f3b5c0-9edf-3d65-4351-01356f3dbd93/mzaf_2834349465205600826.plus.aac.p.m4a") {
               let player = AVQueuePlayer()
               let item = AVPlayerItem(url: url)
               looper = AVPlayerLooper(player: player, templateItem: item)
               player.play()
        }
    }
    
    
    

}
