//
//  GymDetalisVC.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import UIKit
import AVFoundation

class GymDetalisVC: UIViewController {
    @IBOutlet weak var gymDetailsLbl: UILabel!
    @IBOutlet weak var gymLbl: UILabel!
    @IBOutlet weak var volumeBtn: UIButton!
    @IBOutlet weak var gymImg: UIImageView!
    @IBOutlet weak var musleLbl: UILabel!
    
    var gym = ""
    var gymDetails = ""
    var gymImage = ""
    var musle = ""
    let synthesizer = AVSpeechSynthesizer()
    var isSpeak = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gymLbl.text = gym
        gymDetailsLbl.text = gymDetails
        musleLbl.text = "Exercise For :\(musle)"
        gymImg.image = UIImage(named: gymImage)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopSpeech()
    }

    
    func readLabelText() {
        let speechUtterance = AVSpeechUtterance(string: gymDetailsLbl.text ?? "")
        synthesizer.speak(speechUtterance)
    }
    
    func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    func shareText(_ text: String) {
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }

    
    @IBAction func shareBtnTapped(_ sender: Any) {
        shareText("*Exercise name :* \(gym.appending("\n\n*Exercise description :* \(gymDetails)").appending("\n\n*Exercise for :* \(musle)"))\n\n*FitFlex*")
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func copyBtnTapped(_ sender: Any) {
        let textToCopy = "Exercise name : \(gym.appending("\n\nExercise description : \(gymDetails)").appending("\n\nExercise for : \(musle)"))\n\nFitFlex"
        UIPasteboard.general.string = textToCopy
        
        let alert = UIAlertController(title: "Text Copied", message: "The text has been copied to the clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        if isSpeak == false {
            readLabelText()
            isSpeak = true
            if #available(iOS 13.0, *) {
                volumeBtn.setBackgroundImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
        } else {
            stopSpeech()
            if #available(iOS 13.0, *) {
                volumeBtn.setBackgroundImage(UIImage(systemName: "speaker.wave.3.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
            isSpeak = false
        }
            
        
    }

    
}
