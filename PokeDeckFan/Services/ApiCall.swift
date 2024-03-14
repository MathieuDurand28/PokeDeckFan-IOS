//
//  ApiCall.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 10/03/2024.
//

import Foundation

enum ApiCallResult {
    case success(Bool)
    case failure(Bool)
}


class ApiCall: ObservableObject {
    @Published var tyradex: Tyradex?
    @Published var toggleResult: Bool?
    @Published var pokemonTypes: [PokemonType] = []
    @Published var generationList: [GenerationList] = []
    @Published var PokemonListByGeneration: [PokemonByGeneration] = []
   
    
    func apiIsOffline(completion: @escaping (ApiCallResult) -> Void) {
        guard let url = URL(string: "https://tyradex.tech/api/v1/pokemon/246") else {
                    print("Invalid URL")
                    return
                }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
               if let httpResponse = response as? HTTPURLResponse {
                   DispatchQueue.main.async {
                       let res = httpResponse.statusCode != 200
                       completion(.success(true))
                       self.toggleResult = res
                   }
                   
               } else {
                   completion(.failure(true))
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
                                self.tyradex = decodedData
                                if let typesArray = self.tyradex?.types {
                                    var typesArrayToAssign: [[String: String]] = []
                                    // 'typesArray' est maintenant un tableau non optionnel de Types
                                    for type in typesArray {
                                        var currentType: [String: String] = [:]
                                        currentType["name"] = type.name
                                        currentType["image"] = type.image
                                        typesArrayToAssign.append(currentType)
                                    }
                                    self.tyradex?.list_types = typesArrayToAssign
                                }
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }.resume()
    }
    
    func getAllTypesOfPokemon() {
      
       guard let url = URL(string: "https://tyradex.tech/api/v1/types") else {
           print("URL non valide")
           return
       }

       URLSession.shared.dataTask(with: url) { data, response, error in
           if let data = data {
               do {
                   let decoder = JSONDecoder()
                   let result = try decoder.decode([PokemonType].self, from: data)
                   DispatchQueue.main.async {
                       self.pokemonTypes = result
                       
                   }
               } catch {
                   print(error.localizedDescription)
               }
           }
       }.resume()
           
            
    }
    
    func getGenerationList() {
        guard let url = URL(string: "https://tyradex.tech/api/v1/gen") else {
            print("URL non valide")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([GenerationList].self, from: data)
                    DispatchQueue.main.async {
                        self.generationList = result
                        
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getPokemonByGeneration(gen: Int) {
        if !self.PokemonListByGeneration.isEmpty {
            self.PokemonListByGeneration = []
        }
        guard let url = URL(string: "https://tyradex.tech/api/v1/gen/\(gen)") else {
            print("URL non valide")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([PokemonByGeneration].self, from: data)
                    DispatchQueue.main.async {
                        self.PokemonListByGeneration = result
                    }
                } catch {
                    if let httpResponse = response as? HTTPURLResponse {
                        print("error http status: \(httpResponse.statusCode)")
                    }
                    print("error gen: \(gen)")
                    print("error url: \(url)")
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
    
    
}
