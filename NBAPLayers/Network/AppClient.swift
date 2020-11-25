//
//  AppClient.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /1711/20.
//

import Foundation


// enum аналог струткры - перечисление специальный тип имеющий несколько значений
// резалт имеет либо саксес лиьбо фейлур
enum ApiError: Error {
    case noData
}

protocol ApiClient {
    // Zamikanie как только мы получим результат то сделай чтото и передадим туда
//    похожий код объявления функции
//    замыкание это набор действий строк кода которые мы можем передать передать
//    передаем не данные а действия эти действия должны на вход принять наши данные - массив игроков
//
//      Плеерс на вход может не придти, поэтому gde типа Плеер пишем Резулт <>(succes and failure)
    func getPLayers(onResult: @escaping (Result<[Player], Error>) -> Void)
}


// impl реализация протокола, будет удовлетворять протоколу
class ApiClientInmpl: ApiClient {
    func getPLayers(onResult: @escaping (Result<[Player], Error>) -> Void) {
        // ходим в сеть создаеми сессию url
        let session = URLSession.shared
        // создаем дататаск - задачка для урл сессии - сходи за данными (слот.сесшн(урл реквест(приходит замыкание на вход
//        что делать когда к нам на вход приед)
// сущность с данными чтобы пойти на сервер за данными
        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET" // Neobyazatelno, dlya ponimania chto URLRequest po umolch - GET
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, responce, error in
            
//            sleep(3) // Контроллируемая 3х секундная загрузка
//            onResult(.failure(ApiError.noData)) // Создание контроллируемой ошибки
//            return // Создание контроллируемой ошибки
            
            //            мы должны обработать данные которые нам пришли понять это ошибка и скомпоновать массив игрокков из данных
            //            будем исплозовать переменную дата
            //                guard конструкция как ИФ если условие выполнено код идет дальше после фигур скобки, но если конструкция не выполнена то идет код              в скобочках и делает ретерн
            guard let data = data
                else {
                    onResult(.failure(ApiError.noData))
                    return
                }
            do {
// decodirovat json поле дата в котором информация игроков приходит из джсона: повторяем джсон структуру ответа с сервера try - перед функциями которые могут вызвать ошибку
                let playerResponse = try JSONDecoder().decode(PlayersResponce.self, from: data)
                onResult(.success(playerResponse.data))
            } catch(let error) {
                // распечатаем в консоль ошибку
                print(error)
                onResult(.failure(error))
            }
        })
        // запустить задание выполнить егро запускает все действия
        dataTask.resume()
    }
}
