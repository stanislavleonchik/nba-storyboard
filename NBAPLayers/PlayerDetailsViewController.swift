import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    var player: Player?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = player?.name
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        teamButton.setTitle(player?.teamName.fullName, for: .normal)
        
        
        
    }
    @IBAction func onTeamButton(_ sender: Any) {
        // TODO: open display information
        // team: name city conferencion
        // Lakers, Los Angeles, Western conferention
        // Heat, Miami, East
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        teamDetailsViewController.team = player?.teamName
        
        
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
}
