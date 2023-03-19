//
//  NetworkManager.swift
//  Veryable Sample
//
//  Created by Stephen Byron on 3/17/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

class NetworkManager {
    func getDataFromURL(url: URL) async throws -> Data {
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            print(error.localizedDescription)
            throw error
        }
    }
}
