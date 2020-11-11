//
//  PlayersViewController.swift
//  NBAPLayers
//
//  Created by Stanislav Leonchik on /911/20.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let players: [Player] = [
        Player(
            name: "Lebron",
            position: "SF",
            height: "6'6''",
            teamName: lakers
        ),
        Player(
            name: "Davis",
            position: "PF",
            height: "7'0''",
            teamName: lakers
        ),
        Player(
            name: "Butler",
            position: "SG",
            height: "6'4''",
            teamName: heat
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.teamName.fullName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Получает доступ к сториборду: Мэин - название Бандл - главный пакет прилшожения
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        // Получаем экзмепляр вью контроллера/ обращаемся к сториборду / проинициализируй мне с таким индификатором
        // PlayerDetailsViewController
        let playerDetailsViewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
        let player = players[indexPath.row]
        playerDetailsViewController.player = player
        // Обращаемся к Навигейшн Котроллер и просим отоьразить (пуш) отобрази вью контроллер с анимацией
        navigationController?.pushViewController(playerDetailsViewController, animated: true)
        // Осталось сообщить что делегатом для нашей таблички будет плеерс вью контролле ≥≥ плеерс
    }
}
