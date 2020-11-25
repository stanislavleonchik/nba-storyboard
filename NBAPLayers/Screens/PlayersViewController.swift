import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var players: [Player] = []
    let apiClient: ApiClient = ApiClientInmpl()// инициализируем протокол
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }
    
    func reloadData() {
        showLoading()
         // просим апи клиента сходить за данными на вход получаем плеерс сохраняем селф.плеерс = плеерс этот код мы передаем клиенту как только получишь результат выполни этот код
        apiClient.getPLayers(onResult: {result in // вместо плеерс пишем резалт
            // возвращаемся в главный поток чтобы отобразить интерфейс
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.showData()
                    self.players = players
                    self.tableView.reloadData()// данные изменились а в ТаблеВью мы ничего не подправаили магическая функция заставит данные перерисоваться
                    
                case .failure:
                    self.players = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
        })
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
    @IBAction func onReloadButton(_ sender: Any) {
        reloadData()
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
