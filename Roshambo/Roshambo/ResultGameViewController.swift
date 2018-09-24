//
//  ResultGameViewController.swift
//  Roshambo
//
//  Created by Filipi Brentegani on 18/09/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class ResultGameViewController: UIViewController {
    
    var machinePlay: Shot?
    var playerPlay: Shot?
    @IBOutlet weak var machineImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setPlayImage(machineImageView, machinePlay!)
        setPlayImage(playerImageView, playerPlay!)
        
        if playerPlay == machinePlay {
            resultLabel.text = "Draw Game!"
        } else if (playerPlay == Shot.paper && machinePlay == Shot.rock) ||
            (playerPlay == Shot.rock && machinePlay == Shot.scissors) ||
            (playerPlay == Shot.scissors && machinePlay == Shot.paper) {
            resultLabel.text = "You Win :)"
        } else {
            resultLabel.text = "You Lose :("
        }
    }
    
    private func setPlayImage(_ imageView: UIImageView, _ play: Shot) {
        switch play{
        case Shot.rock:
            imageView.image = UIImage(named: "rock")
        case Shot.paper:
            imageView.image = UIImage(named: "paper")
        case Shot.scissors:
            imageView.image = UIImage(named: "scissors")
        }
    }
    
    @IBAction func playAgainButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
