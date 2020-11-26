//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /2511/20.
//

import UIKit

class GameDetailsViewController: UIViewController {
    var game: Game?

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var visitorTeamScoreLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var postseasonLabel: UILabel!
    @IBOutlet weak var homeTeamButton: UIButton!
    @IBOutlet weak var visitorTeamButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = game?.name
//        homeTeamScoreLabel.text = game?.homeTeamScore
//        visitorTeamScoreLabel.text = game?.visitorTeamScore
        if game!.homeTeamScore > game!.visitorTeamScore {
            winnerLabel.text = game?.homeTeam.name
        } else {
            if game!.homeTeamScore < game!.visitorTeamScore {
                winnerLabel.text = game?.visitorTeam.name
            } else {
                winnerLabel.text = "Drawn game"
            }
        }

    }
    @IBAction func onHomeTeamButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController

        teamDetailsViewController.team = game?.homeTeam

        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
    @IBAction func onVisitorTeamButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController

        teamDetailsViewController.team = game?.visitorTeam

        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
    
}
