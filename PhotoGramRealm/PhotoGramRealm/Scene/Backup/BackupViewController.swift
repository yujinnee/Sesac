//
//  BackViewController.swift
//  PhotoGramRealm
//
//  Created by 이유진 on 2023/09/07.
//

import UIKit

import SnapKit
import Zip

class BackupViewController: BaseViewController {
    
    let backupButton = {
        let view = UIButton()
        view.backgroundColor = .systemOrange
        return view
    }()
    let restoreButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()
    let backupTableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        view.addSubview(backupButton)
        view.addSubview(restoreButton)
        view.addSubview(backupTableView)
        backupButton.addTarget(self, action: #selector(backupButtonTapped), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(restoreButtonTapped), for: .touchUpInside)
    }
    @objc func backupButtonTapped() {
        //1. 백업하고자 하는 파일들의 경로 배열 생성
        var urlPaths = [URL]()
        
        //2. 도큐먼트 위치
        guard let path = documentDirectoryPath() else {
            print("도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        //3.백업하고자 하는 파일 경로 ex ~~~/~~/~~~/Document/default.realm
        let realmFile = path.appendingPathComponent("default.realm")
        
        //4. 3번 경로가 유효한 지 확인
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            print("백업할 파일이 없습니다")
            return
        }
        
        //5. 압축하고자 하는 파일을 배열에 추가
        urlPaths.append(realmFile)
        
        //6. 압축
        do{
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "JackArchive_\(Int.random(in: 1...1000))")
            print("location: \(zipFilePath)")
        } catch {
            print("압축을 실패했어요")
        }
        
    }
    @objc func restoreButtonTapped() {
        //파일 앱을 통한 복구 진행
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true)
    }
    
    
    override func setConstraints() {
        super.setConstraints()
        
        backupTableView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        backupButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        restoreButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
}
extension BackupViewController: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(#function, urls)
            
            guard let selectFileURL = urls.first else { // 파일앱에서의 URL
                print("선택한 파일에 오류가 있어요")
                return
            }
            
            guard let path = documentDirectoryPath() else { // 앱 도큐먼트 path
                print("도큐먼트 위치에 오류가 있어요")
                return
            }
            
            // 도큐먼트 폴더 내 저장할 경로 설정
            // selectFileURL.lastPathComponent: 사용자가 선택한 파일 URL의 마지막 파일 이름을 도큐먼트 경로 마지막에 이어붙임
            let sandboxFileURL = path.appendingPathComponent(selectFileURL.lastPathComponent)
            
            // 경로에 복구할 파일(zip)이 이미 있는지 확인
            if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
                // 경로에 복구할 파일이 있을 경우
                let fileURL = path.appendingPathComponent("JackArchive.zip")
                
                do {
                    // 압축 해제
                    try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                        print("progress: \(progress)")
                    }, fileOutputHandler: { unzippedFile in
                        print("압축해제 완료: \(unzippedFile)")
                    })
                } catch {
                    print("압축 해제 실패")
                }
            } else {
                // 경로에 복구할 파일이 없을 경우
                do {
                    try FileManager.default.copyItem(at: selectFileURL, to: sandboxFileURL)
                    let fileURL = path.appendingPathComponent("JackArchive.zip")
                    try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                        print("progress: \(progress)")
                    }, fileOutputHandler: { unzippedFile in
                        print("압축해제 완료: \(unzippedFile)")
                    })
                } catch {
                    print("압축 해제 실패")
                }
            }
        }
                                                         
}

extension BackupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func fetchZipList() -> [String] {
        var list: [String] = []
        
        do {
            guard let path = documentDirectoryPath() else { return list}
            let docs = try FileManager.default.contentsOfDirectory(at:path, includingPropertiesForKeys: nil)
            let zip = docs.filter{$0.pathExtension == "zip"}
            for i in zip {
                list.append(i.lastPathComponent)
            }
            
        } catch {
            print("ERROR")
        }
        return list
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchZipList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "테스트"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showActivityViewController(fileName: fetchZipList()[indexPath.row])
    }
    
    func showActivityViewController(fileName: String)  {
        guard let path = documentDirectoryPath() else {
            print("도큐먼트 위치에 오류가 있어요")
            return
        }
        let backupFileURL = path.appendingPathComponent("fileName")
        
        
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: nil)
        present(vc, animated: true)
    }
    
    
}

