////
////  SplashViewController.swift
////  ligadimayor
////
////  Created by Gabriel Colmenares on 6/8/18.
////  Copyright © 2018 Shokworks. All rights reserved.
////
//
//import UIKit
//import AVFoundation
////import SDWebImage
////import Firebase
////import BaseModule
//
//class SplashViewController: UIViewController, CAAnimationDelegate {
//    
//    @IBOutlet weak var bannerImageView: UIImageView!
//    var avPlayer: AVPlayer?
//    var playerLayer: AVPlayerLayer?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if let _ = appDelegate.notification {
//            enterApp()
//            return
//        }
//        setupBannerImageView()
//    }
//    
//    @objc func checkPlayer() {
//        if let avPlayer = self.avPlayer {
//            avPlayer.play()
//        } else {
//            loadSplashVideo()
//        }
//    }
//    
//    @objc func pausePlayer() {
//        self.avPlayer?.pause()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
////        Analytics.setScreenName(AnalyticConstants.Screen.splash, screenClass: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(checkPlayer), name: UIApplication.didBecomeActiveNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(pausePlayer), name: UIApplication.willResignActiveNotification, object: nil)
//        checkPlayer()
//        view.bringSubviewToFront(bannerImageView)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//        
//    }
//    
//    private func loadSplashVideo() {
//        var urlMain: URL?
//        let session = AVAudioSession.sharedInstance()
//        try? session.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: .default)
//        try! session.setActive(true)
//        AppUtility.lockOrientation(.portrait)
//        if let urlString = UserDefaults.standard.object(forKey: "\(Constants.appPrefix).\(ConfigurationJSON.video_intro)") as? String,
//           let url = URL(string: urlString) {
//            urlMain = url
//        }else{
//            guard let path = Bundle.main.path(forResource: Splash.fileName, ofType:"mp4") else {
//                debugPrint("##Intro not found")
//                return
//            }
//            urlMain = URL(fileURLWithPath: path)            
//        }
//        let player = AVPlayer(url: urlMain!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
//        self.avPlayer = player
//        self.playerLayer = playerLayer
//
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
//    }
//    
//    func setupBannerImageView(){
//        if let urlBanner = UserDefaults.standard.object(forKey: UserDefaultsKeys.url_banner_splash) as? String{
//            if let url = URL(string: urlBanner){
//                bannerImageView.sd_setImage(with: url, completed: nil)
//            }
//        }
//        bannerImageView.contentMode = .scaleAspectFit
//        view.bringSubviewToFront(bannerImageView)
//    }
//    
//    @objc func playerDidFinishPlaying(note: NSNotification) {
//        avPlayer?.pause()
//        avPlayer = nil
//        playerLayer = nil
//        enterApp()
//    }
//
//    func enterApp() -> Void {
//        let animation = CATransition()
//        animation.delegate = self
//        animation.type = CATransitionType.fade
//        animation.duration = 0.5
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.layer.add(animation, forKey: "transitionViewAnimation")
//        AppManager.shared.initAppAfterSplash()
//    }
//    
//    @objc func skip(_ sender: AnyObject) {
//        enterApp()
//    }
//    
//}
//
//fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
//    return input.rawValue
//}
