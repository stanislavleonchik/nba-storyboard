import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var players: [Player] = []
    // инициализируем протокол
    let apiClient: ApiClient = ApiClientInmpl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        просим апи клиента сходить за данными
//        на вход получаем плеерс
//        сохраняем селф.плеерс = плеерс
//        этот код мы передаем клиенту
//        как только получишь результат выполни этот код
        
//          вместо плеерс пишем резалт
        apiClient.getPLayers(onResult: {result in
            // возвращаемся в главный поток чтобы отобразить интерфейс
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    // данные изменились а в ТаблеВью мы ничего не подправаили
                    // магическая функция заставит данные перерисоваться
                    self.tableView.reloadData()
                    
                case .failure:
                    self.players = []
            }
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = players[indexPath.row]

        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.team.fullName

        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let playersDetailViewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController

        let player = players[indexPath.row]

        playersDetailViewController.player = player
        navigationController?.pushViewController(playersDetailViewController, animated: true)
    }

}
