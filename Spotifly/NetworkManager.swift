//
//  NetworkManager.swift
//  Spotifly
//
//  Created by David Barcenas on 11/30/22.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    
    private init() {}
    
    func authorizeUser(with code: String, completion: @escaping (String?) -> Void){
        var bodyComponents = URLComponents()
        let requestHeader: [String: String] = [
            "Authorization": "Basic YjkzNDE4NGRjYjdhNDk5OThiMzYzZTIzNzA3NGQwNGE6ZGYwZWIyY2RiMzM1NDU4Njk0YzM4NjU0NWUyMWNhMTQ=", "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        bodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_url", value: "https%3A%2F%2Fwww.google.com%2F")
        ]
        
        guard let url = URL(string: "https://accounts.spotify.com/api/token") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeader
        request.httpBody = bodyComponents.query?.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("getArtistRequest: error")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("NO RESPONSE")
                return
            }
            
            guard response.statusCode == 200 else {
                print("BAD RESPONSE: ", response.statusCode)
                return
            }
            
            guard let data = data else {
                print("NO DATA")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let token = try decoder.decode(Token.self, from: data)
                if let accessToke = token.accessToken {
                    completion(accessToke)
                }
            } catch {
                print("catch: ", error)
            }
            
        }.resume()
        
        
    }
}
