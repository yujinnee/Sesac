//
//  ViewController.swift
//  SesacDDayApp
//
//  Created by 이유진 on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var todayDatePicker: UIDatePicker!
    
    @IBOutlet var d100Label: UILabel!
    @IBOutlet var d200Label: UILabel!
    @IBOutlet var d300Label: UILabel!
    @IBOutlet var d400Label: UILabel!
    
    
    @IBOutlet var d100DateLabel: UILabel!
    @IBOutlet var d200DateLabel: UILabel!
    @IBOutlet var d300DateLabel: UILabel!
    @IBOutlet var d400DateLabel: UILabel!
    
    @IBOutlet var d100ImageView: UIImageView!
    @IBOutlet var d200ImageView: UIImageView!
    @IBOutlet var d300ImageView: UIImageView!
    @IBOutlet var d400ImageView: UIImageView!
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        let selectedDate = sender.date
        let after100 = Calendar.current.date(byAdding: .day, value: 100, to: selectedDate )
        let after200 = Calendar.current.date(byAdding: .day, value: 200, to: selectedDate )
        let after300 = Calendar.current.date(byAdding: .day, value: 300, to: selectedDate )
        let after400 = Calendar.current.date(byAdding: .day, value: 400, to: selectedDate )
      
        d100DateLabel.text = formatter.string(from: after100 ?? Date())
        d200DateLabel.text = formatter.string(from: after200 ?? Date())
        d300DateLabel.text = formatter.string(from: after300 ?? Date())
        d400DateLabel.text = formatter.string(from: after400 ?? Date())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
        designImageViews()
        designDatePicker(datePicker: todayDatePicker, style: .inline)
        
    }
    
    func initLabel(){
        d100Label.text = "D+100"
        d200Label.text = "D+200"
        d300Label.text = "D+300"
        d400Label.text = "D+400"
        
        let today = Date()
        let after100 = Calendar.current.date(byAdding: .day, value: 100, to: today )
        let after200 = Calendar.current.date(byAdding: .day, value: 200, to: today )
        let after300 = Calendar.current.date(byAdding: .day, value: 300, to: today )
        let after400 = Calendar.current.date(byAdding: .day, value: 400, to: today )
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
    
        d100DateLabel.text = formatter.string(from: after100 ?? Date())
        d200DateLabel.text = formatter.string(from: after200 ?? Date())
        d300DateLabel.text = formatter.string(from: after300 ?? Date())
        d400DateLabel.text = formatter.string(from: after400 ?? Date())
        

        d100Label.textColor = .white
        d200Label.textColor = .white
        d300Label.textColor = .white
        d400Label.textColor = .white
        
        d100DateLabel.textColor = .white
        d200DateLabel.textColor = .white
        d300DateLabel.textColor = .white
        d400DateLabel.textColor = .white
        
    }
    func designImageViews(){
        designImageView(imageView: d100ImageView, image: UIImage(named: "cake") ?? UIImage(), contentMode: .scaleAspectFill, cornerRadius: 10, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowRadius: 10.0, shadowOpacity: 0.5)
        designImageView(imageView: d200ImageView, image: UIImage(named: "churros") ?? UIImage(), contentMode: .scaleAspectFill, cornerRadius: 10, shadowColor: UIColor.black.cgColor, shadowOffset: .zero, shadowRadius: 10.0, shadowOpacity: 0.5)
        designImageView(imageView: d300ImageView, image: UIImage(named: "icecream") ?? UIImage(), contentMode: .scaleAspectFill, cornerRadius: 10, shadowColor: UIColor.black.cgColor, shadowOffset: .zero, shadowRadius: 10.0, shadowOpacity: 0.5)
        designImageView(imageView: d400ImageView, image: UIImage(named: "doughnut") ?? UIImage(), contentMode: .scaleAspectFill, cornerRadius: 10, shadowColor: UIColor.black.cgColor, shadowOffset: .zero, shadowRadius: 10.0, shadowOpacity: 0.5)
    }
    func designDatePicker(datePicker: UIDatePicker,style: UIDatePickerStyle) {
        datePicker.datePickerMode = .date
        if #available(iOS 14.0, *) {
                    datePicker.preferredDatePickerStyle = .inline
                } else {
                    datePicker.preferredDatePickerStyle = .wheels
                }
       
    }
    func designImageView(imageView: UIImageView,image: UIImage,contentMode: UIImageView.ContentMode,cornerRadius: CGFloat,shadowColor: CGColor,shadowOffset: CGSize,shadowRadius: CGFloat,shadowOpacity: Float){
        imageView.image = image
        imageView.contentMode = contentMode
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.shadowColor = shadowColor
        imageView.layer.shadowOffset = shadowOffset
        imageView.layer.shadowRadius = shadowRadius
        imageView.layer.shadowOpacity = shadowOpacity
        imageView.clipsToBounds = true
    }


}

