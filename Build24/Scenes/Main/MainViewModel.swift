//
//  MainViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 26/1/23.
//

import Foundation
import RxSwift

class MainViewModel: BaseViewModel {
    
    let name = BehaviorSubject(value: "Neath")
    let timeOut = 1000
    
    private var currentRate = 4100
    
    func exchangeRate() -> Observable<String> {
        return Observable.create { observer in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                //self.currentRate += 50
                guard let url = URL(string: "http://www.google.com") else {return}
                if self.currentRate > self.timeOut {
                    UIApplication.shared.openURL(url)
                }
               // observer.onNext("\(self.currentRate) KHR/USD")
            }
            return Disposables.create()
        }
    }
}
