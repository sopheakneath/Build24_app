//
//  DataService.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 19/12/22.
//


import Foundation
import Alamofire

struct DataService {
    
    // MARK: - Singleton
    static let shared = DataService()
    
    // MARK: - URL
    private var photoUrl = "https://jsonplaceholder.typicode.com/photos"
    private var urlTodo = "https://jsonplaceholder.typicode.com/todos"
    
    // MARK: - Services
//    func requestFetchPhoto(with id: Int, completion: @escaping (Photo?, Error?) -> ()) {
//        let url = "\(photoUrl)/\(id)"
//        Alamofire.request(url).responsePhoto { response in
//            if let error = response.error {
//                completion(nil, error)
//                return
//            }
//            if let photo = response.result.value {
//                completion(photo, nil)
//                return
//            }
//        }
//    }
    
   
//        func requestFetchTodo(at url: urlTodo, completion: @escaping (Result<[ToDo], Error>) -> Void) {
//           self.dataTask(with: url) { (data, response, error) in
//             if let error = error {
//               completion(.failure(error))
//             }
//
//             if let data = data {
//               do {
//                 let toDos = try JSONDecoder().decode([ToDo].self, from: data)
//                 completion(.success(toDos))
//               } catch let decoderError {
//                 completion(.failure(decoderError))
//               }
//             }
//           }.resume()
//         }
    
 
}

