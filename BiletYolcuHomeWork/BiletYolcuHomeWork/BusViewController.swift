//
//  BusViewController.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 8.05.2021.
//

import UIKit

class BusViewController: UIViewController {
    
    private let ticketButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ticket"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        cv.backgroundColor = .systemBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    var bilet = Bilet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.allowsMultipleSelection = true
        arrangeViews()
        prepareNavigationBar()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let popOverVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PopUpController") as! PopUpViewController
        
        popOverVc.bilet = bilet
        
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
    }
    
    private func arrangeViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        view.addSubview(ticketButton)
        
        NSLayoutConstraint.activate([
            ticketButton.widthAnchor.constraint(equalToConstant: 154),
            ticketButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ticketButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            ticketButton.heightAnchor.constraint(equalToConstant: 137),
            collectionView.bottomAnchor.constraint(equalTo: ticketButton.topAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        ])
    }
}

extension BusViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        myCell.configure(label: "\(indexPath.item + 1)")
        return myCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        bilet.koltuk.append(indexPath.row + 1)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        cell?.backgroundColor = .systemOrange
        print("\(indexPath.item + 1) nolu koltuk seçildi.")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let index = bilet.koltuk.firstIndex(of: indexPath.row + 1) {
            bilet.koltuk.remove(at: index)
        }
        let cell = collectionView.cellForItem(at: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
        cell?.backgroundColor = .clear
        print("\(indexPath.item + 1) nolu koltuk kaldırıldı.")
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.indexPathsForSelectedItems?.count ?? 0 == bilet.koltukSayisi {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen belirtilen koltuk sayısı kadar seçin.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return collectionView.indexPathsForSelectedItems?.count ?? 0 <= (bilet.koltukSayisi - 1)
        }
        return true
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/4, height: view.frame.size.width/4)
    }
    
}

// MARK: Prepare Navigation Bar
extension BusViewController {
    func prepareNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}
