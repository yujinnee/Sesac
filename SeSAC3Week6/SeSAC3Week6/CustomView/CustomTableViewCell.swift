//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
//        addSubview(label) //오류가 안남 ... but cell에 바로 추가하는거라 레이아웃 잘 안 잡힘.
        contentView.addSubview(button)
        contentView.addSubview(label)
    }
    
    func setConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
