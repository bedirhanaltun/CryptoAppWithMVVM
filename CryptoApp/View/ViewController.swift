//
//  ViewController.swift
//  CryptoApp
//
//  Created by Bedirhan Altun on 18.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListView: CryptoListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func getData(){
        guard let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else{
            return
        }
        
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                 
                self.cryptoListView = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListView == nil ? 0 : self.cryptoListView.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoCell
        //Her bir cell için cryptoViewModel oluşturulacak.
        let cryptoViewModel = self.cryptoListView?.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel?.price
        cell.currencyNameLabel.text = cryptoViewModel?.cryptoName
        cell.backgroundColor = getRandomColor()
        return cell
    }


}

