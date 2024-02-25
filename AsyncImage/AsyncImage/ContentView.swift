//
//  ContentView.swift
//  AsyncImage
//
//  Created by Chirag Gujarati on 7/26/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 125)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        
//        AsyncImage(url: URL(string: imageURL),scale: 3)
        
        /*
        AsyncImage(url: URL(string: imageURL)){
            image in
            image.imageModifier()
        }placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        */
        
        /*
        AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.2))){ phase in
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "ant.circle.fill").iconModifier()
            }else{
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }.padding(40)
        */
        
        AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.2))){ phase in
            switch phase{
            case .success(let image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
