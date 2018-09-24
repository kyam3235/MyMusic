//
//  ViewController.swift
//  MyMusic
//
//  Created by Kyohei Yamaguchi on 2018/09/22.
//  Copyright © 2018年 Kyohei Yamaguchi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    //バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    //シンバル用のプレーヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    //ギター用のプレ-ヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    //バックミュージック用のプレーヤーインスタンを作成
    var backmusicPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    
    @IBAction func stop(_ sender: Any) {
        //バックミュージックの停止
        backmusicPlayer.stop()
    }
    
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path:URL, count:Int){
        do{
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        }catch{
            print("エラーが発生しました")
        }
    }
}

