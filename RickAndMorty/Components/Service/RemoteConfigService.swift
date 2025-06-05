//
//  RemoteConfigService.swift
//  RickAndMorty
//
//  Created by Adilet on 5/6/25.
//

import FirebaseRemoteConfig

class RemoteConfigService {
    static let shared = RemoteConfigService()
    private let remoteConfig = RemoteConfig.remoteConfig()

    private init() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // для тестов
        remoteConfig.configSettings = settings
    }

    func fetchRemoteConfig(completion: @escaping (HomeModel?) -> Void) {
        remoteConfig.fetchAndActivate { status, error in
            if error != nil {
                print("Remote config fetch error: \(error!)")
                completion(nil)
                return
            }

            let needForceUpdate = self.remoteConfig["needForceUpdate"].boolValue
            let redirectLink = self.remoteConfig["redirectLink"].stringValue ?? ""

            let model = HomeModel(needForceUpdate: needForceUpdate, redirectLink: redirectLink)
            completion(model)
        }
    }
}

