
//
//  Wallets.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-06-09.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

let kStoreWalletsKey = "Wallets"

class WalletsCollection {
    static let shared = WalletsCollection()
    var wallets: [Wallet] = []
    
    // Private because it's a singleton
    private init() {}
    
    public func updateWalletsStore() {
        let userDefaults = UserDefaults.standard
        
        let walletsEncoded = NSKeyedArchiver.archivedData(withRootObject: self.wallets)
        
        userDefaults.setValue(walletsEncoded, forKey: kStoreWalletsKey)
        
        debugPrint(userDefaults.dictionaryRepresentation())
    }
    
    func wallet(atIndex: Int) -> Wallet? {
        return self.wallets[atIndex]
    }
    
    func add(_ wallet: Wallet) {
        self.wallets.append(wallet)
    }
    
    func remove(walletIndex: Int) {
        self.wallets.remove(at: walletIndex)
    }
}