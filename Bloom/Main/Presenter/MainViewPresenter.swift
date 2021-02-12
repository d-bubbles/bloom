//
//  MainViewPresenter.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/9/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol)
    func viewDidLoad()
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        retrieveItems()
    }
    
    private func retrieveItems() {
        if let items = generateDummyData() {
            view?.onItemsRetrieval(items: items)
        }
    }
    
    func generateDummyData() -> [Habit]? {
        let garden1 = Garden(section: 0, number: 0, creationDate: Date(timeIntervalSince1970: 123), finishDate: Date(timeIntervalSince1970: 222), totalFlowers: 10, durationMode: Duration.forever)
        let garden2 = Garden(section: 0, number: 0, creationDate: Date(timeIntervalSince1970: 123), finishDate: Date(timeIntervalSince1970: 222), totalFlowers: 4, durationMode: Duration.period(days: 2))
        let garden3 = Garden(section: 0, number: 0, creationDate: Date(timeIntervalSince1970: 123), finishDate: Date(timeIntervalSince1970: 222), totalFlowers: 4, durationMode: .amountOfFlowers(34))
        
        let habit1 = Habit(name: "Read 10 pages", gardens: [garden1], creationDate: Date(timeIntervalSince1970: 333))
        let habit2 = Habit(name: "Exercise", gardens: [garden2], creationDate: Date(timeIntervalSince1970: 333))
        let habit3 = Habit(name: "Eat veggies", gardens: [garden3], creationDate: Date(timeIntervalSince1970: 333))
        return [habit1, habit2, habit3]
    }
}
