//
//  NetworkManager.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation

final class NetworkManager<T : Codable> {

  //MARK: - Fetch Data Method
  /**
   - Parameter url: Object of URL
   - Parameter completion: Object of Result<T , NetworkError>
   */
  func fetchData(from url : URL , completion : @escaping (Result<T , NetworkError>) -> Void) {

    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else {
        completion(.failure(.error(err : error?.localizedDescription ?? "")))
        return
      }

      guard let httpResposne = response as? HTTPURLResponse , httpResposne.statusCode == 200 else {
        completion(.failure(.invalidResponse(response: response?.description ?? "")))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let json = try JSONDecoder().decode(T.self , from : data)
        completion(.success(json))
      } catch let err {
        completion(.failure(.decodingError(err: err.localizedDescription)))
        print(err)
      }
    }.resume()
  }
}
