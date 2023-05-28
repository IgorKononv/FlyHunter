//
//  WebMenager.swift
//  TapGame
//
//  Created by Igor Kononov on 28.05.2023.
//

import SwiftUI

protocol WebMenaging {
    func fetchDatalink(completion: @escaping (WebModel?) -> Void)
}

final class WebMenager: WebMenaging {
    
    func fetchDatalink(completion: @escaping (WebModel?) -> Void) {
        guard let url = URL(string: WebLinks.presentLink) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let webModel = try decoder.decode(WebModel.self, from: data)
                DispatchQueue.main.async {
                    completion(webModel)
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
}
