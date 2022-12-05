//
//  viewModelTest.swift
//  AsyncAwait
//
//  Created by Aitor Iglesias Pubill on 5/12/22.
//

import Foundation
import SwiftUI

final class viewModelTest: ObservableObject {
    
    //MARK: FUNCION PARA CARGAR IMAGEN
    func loadImage(index: Int) async throws -> Image {
        //Creo URL
        let imageURL = URL(string: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")!
        //Creo request
        let request = URLRequest(url: imageURL)
        //Devuelvo imagen
        let (data, _) = try await URLSession.shared.data(for: request)
        print("Fin carga imagen \(index)")
        return Image(uiImage: UIImage(data: data)!)
    }
    
    //MARK: FUNCION QUE DESCARGA IMAGENES
    //llamamos a 3 imagenes en paralelo
    func loadImagenes() {
        Task {
            async let firstImage = loadImage(index: 1)
            async let secondImage = loadImage(index: 2)
            async let thirdImage = loadImage(index: 3)
            
            let _ = try await [firstImage, secondImage, thirdImage]
            //aqui ya estan las 3 ejectudas
            print("Ya tenemos los 3")
        }
    }
    
}
