//
//  ViewController.swift
//  GXVideoPlayer
//
//  Created by 小修 on 09/21/2023.
//  Copyright (c) 2023 小修. All rights reserved.
//

import UIKit
import GXVideoPlayer
class ViewController: UIViewController, WMPlayerDelegate {

    var playerView : WMPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(Bundle.main)
    }

    @IBAction func playVideo(_ sender: Any) {
        
        if let pv = playerView {
            pv.resetWMPlayer()
            pv.removeFromSuperview()
        }
        guard var urlStr = Bundle.main.path(forResource: "111", ofType: "mov") else { return }
        var videoUrl : URL?
        if #available(iOS 16.0, *) {
            videoUrl  = URL(filePath: urlStr)
        } else {
            // Fallback on earlier versions
            videoUrl = URL(fileURLWithPath: urlStr)
        }
        urlStr = "https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"
        videoUrl = URL(string: urlStr)
        
        playerView = WMPlayer(frame: CGRectMake(0, 0, UIScreen.main.bounds.size.width, 250))
        playerView?.delegate = self
        if let playUrl = videoUrl , let pView = playerView{
            let playerModel: WMPlayerModel = WMPlayerModel.init()
            playerModel.videoURL = playUrl
            pView.playerModel = playerModel
//            pView.
            pView.play()
            view.addSubview(pView)
        } else {
            //抛出错误
            print("错误")
        }
        
    }
    
    @IBAction func pauseVideo(_ sender: Any) {
        playerView?.pause()
    }
    
    @IBAction func resumeVideo(_ sender: Any) {
        playerView?.play()
    }
    
    @IBAction func destroyVideo(_ sender: Any) {
        playerView?.resetWMPlayer()
        playerView?.removeFromSuperview()
        playerView = nil
    }
    
    @IBAction func seekVideo(_ sender: Any) {
        playerView?.seekToTime(toPlay: 2)
    }
    
    func wmplayer(_ wmplayer: WMPlayer!, clickedClose backBtn: UIButton!) {
        
        playerView?.resetWMPlayer()
        playerView?.removeFromSuperview()
        playerView = nil
    }
    
    @IBAction func rateVideo(_ sender: Any) {
        playerView?.rate = 2
    }
    
    //全屏点击
    func wmplayer(_ wmplayer: WMPlayer!, clickedFullScreenButton fullScreenBtn: UIButton!) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

