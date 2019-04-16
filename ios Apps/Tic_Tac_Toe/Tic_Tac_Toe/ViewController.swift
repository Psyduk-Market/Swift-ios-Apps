//
//  ViewController.swift
//  Tic_Tac_Toe
//
//  Created by Thyme Nawaphanarat on 16/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLAbel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playButton(_ sender: AnyObject) {
        
        activePlayer = 1
        
        activeGame = true
        
        gamePositions = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for:[])
            }
        }
        
        // Hide the text result and play button when the game is on going
        resultLAbel.isHidden = true
        playAgainButton.isHidden = true
        
        
        // The location for text result and play again button
        resultLAbel.center = CGPoint(x: resultLAbel.center.x - 500, y: resultLAbel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
    // Initialise first player's turn
    var activePlayer = 1
    
    // Game state
    var activeGame = true
    
    // 0 - empty, 1 - nought and 2 - cross
    var gamePositions = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Initialised valid location for win state
    let checkWinner = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    
    @IBAction func button(_ sender: AnyObject) {
        
        // As the computer index start from 0
        let position = sender.tag! - 1
        
        // Determine which player's turn
        if gamePositions[position] == 0 && activeGame{
            gamePositions[position] = activePlayer
        
            // Toggle player: 1 - nought and 2 - cross
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        // Check validation for win game
        for i in checkWinner {
            if gamePositions[i[0]] != 0 && gamePositions[i[0]] == gamePositions[i[1]] && gamePositions[i[1]] == gamePositions[i[2]] {
                
                // Stop the game
                activeGame = false
                
                // Show result and appear play again button
                resultLAbel.isHidden = false
                playAgainButton.isHidden = false
                
                // Check for which player won the game
                if gamePositions[i[0]] == 1 {
                    resultLAbel.text = "Nought Won"
                } else {
                    resultLAbel.text = "Cross Won"
                }
                
                // User interface appear location for text result and play again button
                UIView.animate(withDuration: 1, animations: {
                    self.resultLAbel.center = CGPoint(x: self.resultLAbel.center.x - 500, y: self.resultLAbel.center.y)
                    
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x - 500, y: self.playAgainButton.center.y)
                })
                
                
                print(gamePositions[i[0]])
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the text result and play button when the game is on going
        resultLAbel.isHidden = true
        playAgainButton.isHidden = true
        
        
        // The location for text result and play again button
        resultLAbel.center = CGPoint(x: resultLAbel.center.x - 500, y: resultLAbel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }


}

