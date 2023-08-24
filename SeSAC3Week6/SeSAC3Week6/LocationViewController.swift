//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit
import CoreLocation //1.위치 임포트
import MapKit

class LocationViewController: UIViewController {
    
    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()

    //3. 위치 프로토콜 연결
    override func viewDidLoad() {
        super.viewDidLoad()

        //info.plist <<< 얼럿
//        locationManager.requestWhenInUseAuthorization()

    
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        view.addSubview(cafeButton)
        cafeButton.backgroundColor = .red
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        cafeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(20)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(20)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        
        view.backgroundColor = .white
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        checkDeviceLocationAuthorization() // // iOS 위치 서비스 활성화 체크
        let center = CLLocationCoordinate2D(latitude: 37.518385, longitude: 126.884187)
        setRegionAndAnnotation(center: center)
        setAnnotation(type: 0)

        
    }
    //파란색버튼
    @objc func cafeButtonClicked() {
        print("=d=d=d=d=")
        setAnnotation(type: 1)
        
        
    }
    
    // MARK: - 지도 뷰에 어노테이션(annotation)을 추가하거나 제거하는 역할
    func setAnnotation(type: Int) {
        print("=====333=====", type)
        //37.517857, 126.886714 //컴포즈
        //37.517746, 126.887131 //오밥
        //37.518107, 126.884798 seven
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.518107, longitude: 126.884798)
        
//        mapView.removeAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131)
        
//        mapView.addAnnotations([annotation2])
        
        if type == 0 { //viewDidLoad때 annotation1, annotation2를 지도에 추가
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
           // mapView.removeAnnotations(annotation1) 여기서 annotation1은 아래 줄 함수랑 다른 것 가리킴.
            //이전에 추가되어 있는 모든 어노테이션을 제거한 후에 annotation2 어노테이션을 추가
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
    }
    // MARK: - 주어진 중심 좌표를 기반으로 지도 뷰의 표시 영역을 설정하고, 해당 위치에 어노테이션(annotation)을 추가하는 역할
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        //지도 중심 기반으로 보여질 범위 설정
        //let center = CLLocationCoordinate2D(latitude: 37.60385, longitude: 127.03328)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation() // 애플 기본 핀 모양
        annotation.title = "마이 홈"
        annotation.coordinate = center
        mapView.addAnnotation(annotation) // 핀 한개
        // mapView.addAnnotations(<#T##annotations: [MKAnnotation]##[MKAnnotation]#>) // 핀 여러개
    }
    
    // MARK: - 위치 서비스를 사용할 수 없는 상황에서 사용자에게 알림 창을 보여주는 역할
    //사용자에게 위치 서비스 활성화를 유도하고, 설정으로 이동할 수 있는 옵션을 제공
    func showLocationSetiingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default)  { _ in
            
            // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면
            // 한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈 수 는 있어도 설정 상세 페이지로 넘어갈 수는 없다.
            if let appSetting = URL(string: UIApplication.openSettingsURLString) { //앱 설정 화면의 URL을 가져옴
                UIApplication.shared.open(appSetting) //앱 설정 화면을 연다.
            }
        }
    
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            //iOS 위치 서비스 활성화 체크
            if CLLocationManager.locationServicesEnabled() {
                
                //현재 사용자의 위치 권한 상태를 가지고 옴.
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                print(authorization)
                
                self.checkCurrentLocationAuthorization(status: authorization)
                
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다")
            }
        }
        
       
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check",status)
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restriced")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        }
    }
    
}

//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("===",locations)
        print(#function)
        
    }
    
    //사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
        
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌 : iOS 14 이상
    //거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 혀용을 했거나
    //허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아 올 때 등
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
        
        
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌 : iOS 14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        
        
    }
    
}
