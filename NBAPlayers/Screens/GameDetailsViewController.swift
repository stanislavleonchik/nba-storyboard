//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /2511/20.
//

import UIKit

class GameDetailsViewController: UIViewController {

    
    @IBOutlet weak var visitorTeamScoreLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var postseasonLabel: UILabel!
    @IBOutlet weak var homeTeamButton: UIButton!
    @IBOutlet weak var visitorTeamButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    var game: Game?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = game?.name
        dateLabel.text = game?.date
        seasonLabel.text = String(game!.season)
        periodLabel.text = String(game!.period)
        statusLabel.text = game?.status
        if game?.postseason == true {
            postseasonLabel.text = "Yes"
        } else { postseasonLabel.text = "No"}
        visitorTeamScoreLabel.text = String(game!.visitorTeamScore)
        homeTeamScoreLabel.text = String(game!.homeTeamScore)
        homeTeamButton.setTitle(game?.homeTeam.name, for: .normal)
        visitorTeamButton.setTitle(game?.visitorTeam.name, for: .normal)
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
