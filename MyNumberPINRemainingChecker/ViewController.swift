//
//  ViewController.swift
//  MyNumberPINRemainingChecker
//
//  Created by treastrain on 2020/05/13.
//  Copyright © 2020 treastrain / Tanaka Ryoga. All rights reserved.
//

import UIKit
import TRETJapanNFCReader_MIFARE_IndividualNumber

class ViewController: UIViewController, IndividualNumberReaderSessionDelegate {

    var reader: IndividualNumberReader!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reader = IndividualNumberReader(delegate: self)
        let pinType = IndividualNumberCardPINType.digitalSignature
        
        self.reader.lookupRemainingPIN(pinType: pinType) { (remaining) in
            if let remaining = remaining {
                print(pinType.description, "残り試行回数:", remaining)
            } else {
                // 取得エラー
            }
        }
    }

    func individualNumberReaderSession(didRead individualNumberCardData: IndividualNumberCardData) {
        // ...
    }

    func japanNFCReaderSession(didInvalidateWithError error: Error) {
        // ...
    }

}

