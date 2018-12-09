//
//  VoicemailDetailViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 12/9/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit
import AVFoundation

class VoicemailDetailViewController: UIViewController {
    
    var call: Call!
    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var missedLabel: UILabel!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fromLabel.text = call.from
        whenLabel.text = "\(call.when)"
        missedLabel.text = "\(call.missed)"
        recordingLabel.text = call.recordingName
       
    }
    
    @IBAction func playSound(_ sender: Any) {
        
       let sound = Bundle.main.path(forResource: call.recordingName, ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

