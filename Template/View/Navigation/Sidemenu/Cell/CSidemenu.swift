//
//  CSidemenu.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 04/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

class CSidemenu: UITableViewCell {

    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setHeader(){
        backgroundColor = GBASE_COLOR.blue
    }
    
    func setTitle(model: model_sidemenu_cell){
        lbl_title.text = model.title
        img_icon.image = GImageExt.renderedImageColor(img: model.image ?? "")
    }

}
