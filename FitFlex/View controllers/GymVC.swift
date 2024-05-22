//
//  GymVC.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import UIKit

class GymVC: UIViewController {
    @IBOutlet weak var dataTbl: UITableView!
    
    var arrDicData: [Gym] = []
    
//    let synthesizer = AVSpeechSynthesizer()

//    var JokesDic: [Jokes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intialSetup()
        
    }
    
    @IBAction func BackBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func settingBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    private func intialSetup() {
        guard let jsonURL = Bundle.main.url(forResource: "Gym", withExtension: "json") else {
            // Handle error: JSON file not found
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode([Gym].self, from: jsonData)
            print(parsedData)
            arrDicData = parsedData.shuffled()
            dataTbl.reloadData()
//            dump(parsedData)
        } catch {
            // Handle error: Unable to read JSON file
            print("Error reading JSON file: \(error)")
            return
        }

    }

//    func readLabelText(label: String) {
//        let speechUtterance = AVSpeechUtterance(string: label)
//        synthesizer.speak(speechUtterance)
//    }
//
//    func stopSpeech() {
//        synthesizer.stopSpeaking(at: .immediate)
//    }

    
}

extension GymVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  dataTbl.dequeueReusableCell(withIdentifier: "GymDetalisTblCell", for: indexPath) as! GymDetalisTblCell
        cell.exersiceLbl.text = arrDicData[indexPath.row].name ?? ""
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "GymDetalisVC") as! GymDetalisVC
        VC.gym = arrDicData[indexPath.row].name ?? ""
        VC.gymDetails = arrDicData[indexPath.row].description ?? ""
        VC.gymImage = arrDicData[indexPath.row].img ?? ""
        VC.musle = arrDicData[indexPath.row].muscleGroup ?? ""
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
