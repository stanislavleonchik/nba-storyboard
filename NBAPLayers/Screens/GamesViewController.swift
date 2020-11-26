//
//  GamesViewController.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /2511/20.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBAction func onReloadButton(_ sender: Any) {
        reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    
    var games: [Game] = []
    let apiClient: ApiClient = ApiClientInmpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }
    
    func reloadData() {
        showLoading()
        apiClient.getGames(onResult: {result in DispatchQueue.main.async {
                switch result {
                    case .success(let games):
                        self.showData()
                        self.games = games
                        self.tableView.reloadData()
                    case .failure:
                        self.games = []
                        self.tableView.reloadData()
                        self.showError()
                }
        }})
    }

    func showLoading() { // Метод - покажи мне состояние загрузки
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    func showData() { // Метод - если данные пришли
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    func showError() { // Метод в случае если пришла ошибка
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        
        let game = games[indexPath.row]
        cell.textLabel?.text = game.name
        cell.detailTextLabel?.text = game.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let gameDetailViewController = storyboard.instantiateViewController(identifier: "GameDetailsViewController") as! GameDetailsViewController
        let game = games[indexPath.row]
        gameDetailViewController.game = game
        navigationController?.pushViewController(gameDetailViewController, animated: true)
    }
}
