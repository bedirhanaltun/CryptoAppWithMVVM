//
//  CryptoCell.swift
//  CryptoApp
//
//  Created by Bedirhan Altun on 18.09.2022.
//

import UIKit

class CryptoCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
