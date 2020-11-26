//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /2511/20.
//

import UIKit

class GameDetailsViewController: UIViewController {
    var game: Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = game?.name
    }
}
