//
//  ViewController.swift
//  Roshambo
//
//  Created by Filipi Brentegani on 18/09/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    @IBAction func rockButtonClicked(_ sender: Any) {
        let controller: ResultGameViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultGameViewController") as! ResultGameViewController
        
        controller.playerPlay = Shot.rock
        controller.machinePlay = challengerPlay()
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "PlaySegway", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultGameViewController
        controller.machinePlay = challengerPlay()
        
        if segue.identifier == "PlaySegway" {
            controller.playerPlay = Shot.paper
        } else if segue.identifier == "ScissorsSegway" {
            controller.playerPlay = Shot.scissors
        }
    }
    
    private func challengerPlay() -> Shot {
        let randomPlay = arc4random_uniform(3)
        return Shot.init(rawValue: randomPlay) ?? challengerPlay()
    }
}

enum Shot : UInt32 {
    case rock = 0
    case paper
    case scissors
}
