//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by Olivia Mellen on 1/8/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var computersImageView: UIImageView!
    @IBOutlet weak var winner: UILabel!
    
    @IBOutlet weak var playersScoreLabel: UILabel!
    @IBOutlet weak var computersScoreLabel: UILabel!
    var playersScore = 0
    var computersScore = 0
    
    @IBOutlet weak var countdown: UILabel!
    var timer = Timer()
    var counter = 3
    
    
    
    
    let imageNames = ["rock", "paper", "scissors"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
   
    @IBAction func whenTapped(_ sender: Any)
    {
        myImageView.image = UIImage(named: "rock")
    }
    @IBAction func whenPressed(_ sender: Any)
    {
        myImageView.image = UIImage(named: "paper")
    }
    @IBAction func whenClickedOn(_ sender: Any)
    {
        myImageView.image = UIImage(named: "scissors")
    }
    
    @IBAction func whenGoPressed(_ sender: Any)
    {
        myImageView.image = UIImage(named: "")
        computersImageView.image = UIImage(named: "")
        counter = 4
        countdown.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.CounterTimer), userInfo: nil, repeats: true)
        countdown.text = String(counter)
        
        
    }
    

    @objc func CounterTimer() {
        counter -= 1
        countdown.text = String(counter)
        
        if counter == 0
        {
            timer.invalidate()
            countdown.text = "Vs."
            DecidingWinner()
        }
        
    }
    
    
    func DecidingWinner()
    {
        let number:Int =  Int(arc4random_uniform(3))
        
        computersImageView.image = UIImage(named: imageNames[number])
        
        if myImageView.image == computersImageView.image
        {
            winner.text = "Tie!"
            playersScore += 0
            computersScore += 0
        }
        else if myImageView.image == UIImage(named: "rock") && computersImageView.image == UIImage(named: "scissors")
        {
            winner.text = "You Win!"
            playersScore += 1
            playersScoreLabel.text = "Score: \(playersScore)"
        }
        else if myImageView.image == UIImage(named: "paper") && computersImageView.image == UIImage(named: "rock")
        {
            winner.text = "You Win!"
            playersScore += 1
            playersScoreLabel.text = "Score: \(playersScore)"
        }
        else if myImageView.image == UIImage(named: "scissors") && computersImageView.image == UIImage(named: "paper")
        {
            winner.text = "You Win!"
            playersScore += 1
            playersScoreLabel.text = "Score: \(playersScore)"
        }
        else if myImageView.image == UIImage(named: "")
        {
            winner.text = "You Lose :("
            computersScore += 1
            computersScoreLabel.text = "Score: \(computersScore)"
        }
        else
        {
            winner.text = "You Lose :("
            computersScore += 1
            computersScoreLabel.text = "Score: \(computersScore)"
        }
    }
    
    
    
    
    
    @IBAction func RESET(_ sender: Any)
    {
        myImageView.image = UIImage(named: "")
        computersImageView.image = UIImage(named: "")
        playersScoreLabel.text = "Score: 0"
        computersScoreLabel.text = "Score: 0"
        computersScore = 0
        playersScore = 0
    }
    
    @IBAction func howToPlay(_ sender: Any)
    {
        if let url = URL(string: "https://www.wikihow.com/Play-Rock,-Paper,-Scissors")
        {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    
}

