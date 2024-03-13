//
//  ResultView.swift
//  PokeDeckFan
//
//  Created by Mathieu Durand on 12/03/2024.
//

import SwiftUI

struct ResultView: View {
    let datas: Tyradex
    @Binding var shiny: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(datas.name?.jp ?? "")")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            HStack {
                Spacer()
                AsyncImage(url: URL(string: "\((shiny ? datas.sprites?.shiny : datas.sprites?.regular) ?? "<a href='https://www.freeiconspng.com/img/23485'>Icon No Download</a>")"),
                           scale: 4)
                Spacer()
            }
            Text("\(datas.name?.fr ?? "Inconnu") / \(datas.name?.en ?? "Unknow")")
            Divider()
            HStack {
                VStack {
                    Image(systemName: "arrowshape.up")
                    Text("\(datas.height ?? "?")")
                }
                Spacer()
                VStack {
                    Image(systemName: "scalemass")
                    Text("\(datas.weight ?? "?")")
                }
                
               
            }
            .padding()
            Divider()
            Text("Type: ")
            VStack {
                ForEach(datas.list_types ?? [[:]], id: \.self ) { value in
                    HStack {
                        let imageUrl = URL(string: "\(value["image"] ?? "" )")
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            case .failure:
                                Text("Failed to load image")
                            case .empty:
                                Text("Loading...")
                            @unknown default:
                                Text("An unknown error occurred")
                            }
                            
                        }
                        Text("\(value["name"] ?? "" )")
                    }
                }
            }
            Divider()
        }
        
    }
    
}

#Preview {
    ResultView(datas: Tyradex(name: nil, status: 0, message: "", sprites: nil, types: nil, stats: nil, height: nil, weight: nil), shiny: .constant(false))
}
