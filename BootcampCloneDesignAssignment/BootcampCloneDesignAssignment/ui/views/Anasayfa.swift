//
//  ViewController.swift
//  BootcampCloneDesignAssignment
//
//  Created by furkan sakız on 26.09.2023.
//

import UIKit


class Anasayfa: UIViewController {
    
    

    @IBOutlet weak var letgoNavigationBar: UINavigationItem!
    @IBOutlet weak var searchBarLet: UISearchBar!
    @IBOutlet weak var ilanCollectionView: UICollectionView!
    
    var configureNavigationBar = ConfigureNavigationBar()
    var ilanlar = [Ilan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftView = configureNavigationBar.configureNavTitleLogo(title: "Erenler, Sakarya", imageName: "location")
        letgoNavigationBar.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        
        let rightView = configureNavigationBar.configureNavLogo(imageName: "logo")
        letgoNavigationBar.rightBarButtonItem = UIBarButtonItem(customView: rightView)
        
        customizeSearchBar()
        
        ilanCollectionView.delegate = self
        ilanCollectionView.dataSource = self
        
        let i1 = Ilan(resim: "ilan1", fiyat: 640000, ilanBilgi: "Dacia Sandero 2018 Benzin", konum: "ADAPAZARI, SAKARYA")
        let i2 = Ilan(resim: "ilan2", fiyat: 1000, ilanBilgi: "Beats Solo Wireless kulaklık", konum: "BAHÇELİEVLER, İSTANBUL")
        let i3 = Ilan(resim: "ilan3", fiyat: 850, ilanBilgi: "End 45W ayaklı vantilatör", konum: "ADAPAZARI, SAKARYA")
        let i4 = Ilan(resim: "ilan4", fiyat: 4250, ilanBilgi: "Kron echo nomad 4.0 bisiklet 21 vites", konum: "KARTAL, İSTANBUL")
        ilanlar.append(i1)
        ilanlar.append(i2)
        ilanlar.append(i3)
        ilanlar.append(i4)
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik-30)/2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        ilanCollectionView.collectionViewLayout = tasarim
    }
    
    func customizeSearchBar() {
        
        let customButton = UIButton(type: .custom)

        
        customButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        
        
        customButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        customButton.tintColor = UIColor.systemGray

        
        searchBarLet.addSubview(customButton)

        
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.trailingAnchor.constraint(equalTo: searchBarLet.layoutMarginsGuide.trailingAnchor),
            customButton.centerYAnchor.constraint(equalTo: searchBarLet.centerYAnchor)
        ])
    }
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ilanlar.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IlanCell", for: indexPath) as! IlanlarCollectionViewCell
        
        let ilan = ilanlar[indexPath.item]
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.kalpButton.layer.cornerRadius = 0.5 * cell.kalpButton.bounds.size.width
        cell.kalpButton.clipsToBounds = true
        
        
        cell.ilanImageView.contentMode = .scaleAspectFill
        cell.ilanImageView.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₺"
        formatter.maximumFractionDigits = 0
        
        if let formattedPrice = formatter.string(from: NSNumber(value: ilan.fiyat!)) {
            cell.priceLabel.text = formattedPrice
        }
        
        cell.ilanImageView.image = UIImage(named: ilan.resim!)
//        cell.priceLabel.text = "\(ilan.fiyat!) ₺"
        cell.titleLabel.text = ilan.ilanBilgi
        cell.locationLabel.text = ilan.konum
        
        return cell
    }
}
    
