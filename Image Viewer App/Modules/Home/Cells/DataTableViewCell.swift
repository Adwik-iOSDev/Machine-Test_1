//
//  DataTableViewCell.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 15/02/23.
//

import UIKit
import Kingfisher

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 25
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellForData(data: Model){
        self.lblAuthor.text = data.author
        self.imgAuthor.kf.setImage(with: URL(string: data.download_url ?? ""))
    }
    
}
