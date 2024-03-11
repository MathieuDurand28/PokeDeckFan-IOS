//
//  ApiCall.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import Foundation

class ApiCall: ObservableObject {
    @Published var tyradex: Tyradex?
    @Published var toggleResult: Bool?
   
    
    func shinyModeDisabled() {
        guard let url = URL(string: "https://tyradex.tech/api/v1/pokemon/246") else {
                    print("Invalid URL")
                    return
                }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
               if let httpResponse = response as? HTTPURLResponse {
                   DispatchQueue.main.async {
                       let res = httpResponse.statusCode != 200
                       self.toggleResult = res
                   }
                   
                }
            }.resume()
       
    }
    
    func getInformationsFromAPI(name: String, mode: Int?) {
        
        guard let url = URL(string: "https://tyradex.tech/api/v1/pokemon/\(name)") else {
                    print("Invalid URL")
                    return
                }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode != 200 { return }
                        do {
                            // Assuming the response data is an array of strings
                            let decodedData = try JSONDecoder().decode(Tyradex.self, from: data ?? Data())
                            DispatchQueue.main.async {
                                print(decodedData)
                                self.tyradex = decodedData
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }.resume()
    }
}
