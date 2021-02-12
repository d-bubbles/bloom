//
//  ViewController.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/7/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
    func onItemsRetrieval(items: [Habit])
}

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    var habits = [Habit]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mainCell")
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension MainViewController: MainViewProtocol {
    
    func onItemsRetrieval(items: [Habit]) {
        habits = items
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "habitsHeader", for: indexPath) as? HeaderCollectionView
            else {
                fatalError("Invalid view type")
            }
            headerView.addButton.layer.cornerRadius = 25
            headerView.addButton.clipsToBounds = true
            headerView.addButton.addTarget(self, action: #selector(onAddHabitPress), for: .touchUpInside)
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
    @objc func onAddHabitPress() {
        
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if habits.count == 0 {
            collectionView.setEmptyView(title: "No habits created yet", message: "Add a new habit,\ntap the button above", messageImage: UIImage(named: "emptyHabits")!)
        } else {
            collectionView.restore()
        }
        return habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
        let habit = habits[indexPath.row]
        cell.name.text = habit.name
        cell.descriptionLabel.text = habit.description
        cell.creationDateLabel.text = "\(habit.creationDate)"
        cell.totalFlowersLabel.text = String(habit.totalFlowers)
        
        cell.durationModeImg.image = habit.currentDurationModeStyle.image
        cell.statusView.backgroundColor = habit.currentDurationModeStyle.bgColor.value
        cell.progressInFiguresLabel.text = habit.currentStatus
        cell.totalFlowersLayer.fillColor = habit.currentDurationModeStyle.bgColor.value.cgColor
        
        setShadow(to: cell)
        return cell
    }
    
    func setShadow(to cell: UICollectionViewCell) {
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
}

// Setup flowLayout
extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - 30
        
        return CGSize(width: availableWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let availableWidth = collectionView.frame.width
        
        let height = CGSize(width: availableWidth, height: 100)
        return height
    }
}
