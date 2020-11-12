//
//  TeamDetailsViewController.swift
//  NBAPLayers
//
//  Created by Stanislav Leonchik on /1111/20.
//
// 
import UIKit

class TeamDetailsViewController: UIViewController {
    
    
    var team: Team?
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
}
