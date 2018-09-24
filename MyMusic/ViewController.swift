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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    //シンバル用のプレーヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    
    @IBAction func cymbal(_ sender: Any) {
        do{
            //シンバル用のプレイヤーに、音源ファイル名を指定
            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
            
            //シンバルの音源再生
            cymbalPlayer.play()
        }catch{
            print("シンバルでエラーが発生しました")
        }
    }
    
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")

    //ギター用のプレ-ヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    @IBAction func guitar(_ sender: Any) {
        do{
            //ギター用のプレイヤーに、音源ファイル名を指定
            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
            
            //ギターの音源再生
            guitarPlayer.play()
        }catch{
            print("ギターでエラーが発生しました")
        }
    }
    
    //バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    //バックミュージック用のプレーヤーインスタンを作成
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any) {
        do{
            //バックミュージック用のプレイヤーに、音源ファイル名を指定
            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
            
            //リピート設定
            backmusicPlayer.numberOfLoops = -1
            //バックミュージックの音源再生
            backmusicPlayer.play()
        }catch{
            print("エラーが発生しました")
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        //バックミュージックの停止
        backmusicPlayer.stop()
    }
}

