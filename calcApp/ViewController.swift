//
//  ViewController.swift
//  calcApp
//
//  Created by 平澤 剛 on 2016/11/06.
//  Copyright © 2016年 平澤 剛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textKekka: UITextField!
    
    //グローバル変数
    //演算子が押されたフラグ：True(押された)False(押されてない)
    var bOpFlg : Bool = false
    
    //値を格納する配列
    var iStack:[Int] = [0,0]
    
    //最後に押された演算子
    var sOp:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func noButton(_ sender: UIButton) {
        
        //演算子を押したフラグがTrueの時は、画面初期化
        if bOpFlg ==  true {
            textKekka.text = ""
            bOpFlg = false
        }
        
        //画面表示が０の時
        if textKekka.text == "0" {
            //頭の０は不要なので、１を表示
            textKekka.text = sender.currentTitle!
        } else{
            //画面表示の文字に１をくっつける
            textKekka.text = textKekka.text! + sender.currentTitle!
        }
        
        
        if bOpFlg == true {
            
            
        }
        
    }
    
    @IBAction func opButton(_ sender: UIButton) {
        
        switch sender.currentTitle! {
        case "AC":
            //画面表示クリア
            textKekka.text = "0"
            //配列の値をクリア
            iStack[0] = 0
            iStack[1] = 0
            //演算子が押されたフラグを初期化
            bOpFlg = true
            sOp = ""

        case "+":
            
            //配列の1番目に配列の２番目をセット
            iStack[0] = iStack[1]
            
            //計算結果を画面に表示
            textKekka.text = String(iStack[0] + Int(textKekka.text!)!)
            
            //演算子が押されたフラグ ＝ True
            bOpFlg = true
            
            //配列の２番目にセット
            iStack[1] = Int(textKekka.text!)!
            
            //最後に押された演算子として記録
            sOp = "+"
            
        case "-":
            
            //配列の1番目に配列の２番目をセット
            iStack[0] = iStack[1]
            
            //配列の２番目にセット
            iStack[1] = Int(textKekka.text!)!
            
            
            /* 以下は不要
             //計算結果を画面に表示
             textKekka.text = String(iStack[0] - iStack[1])
             */
            
            //演算子が押されたフラグを初期化
            bOpFlg = true
            
            //最後に押された演算子として記録
            sOp = "-"

        case "×":
            
            //配列の1番目に配列の２番目をセット
            iStack[0] = iStack[1]
            
            //配列の２番目にセット
            iStack[1] = Int(textKekka.text!)!

            /* 以下は不要
             //計算結果を画面に表示
             textKekka.text = String(iStack[0] * iStack[1])
             */
            
            //演算子が押されたフラグを初期化
            bOpFlg = true
            
            //最後に押された演算子として記録
            sOp = "×"

        case "÷":
            
            //配列の1番目に配列の２番目をセット
            iStack[0] = iStack[1]
            
            //配列の２番目にセット
            iStack[1] = Int(textKekka.text!)!
            
            /* 以下は不要
             //計算結果を画面に表示
             textKekka.text = String(iStack[0] * iStack[1])
             */
            
            //演算子が押されたフラグを初期化
            bOpFlg = true
            
            //最後に押された演算子として記録
            sOp = "÷"
            
            
        case "=":

            
            switch sOp {
            case "+":
                
                //配列の1番目に配列の２番目をセット
                iStack[0] = iStack[1]
                //配列の２番目にテキストの内容をセット
                iStack[1] = Int(textKekka.text!)!
                
                //結果表示
                textKekka.text = String(iStack[0] + iStack[1])
                
                //初期化
                iStack[0] = 0
                iStack[1] = 0
                
                //最後に押された演算子として記録
                sOp = "="
                
                //演算子が押されたフラグ ＝ True
                bOpFlg = true
                
                
            case "-":
                //配列の1番目に配列の２番目をセット
                iStack[0] = iStack[1]
                //配列の２番目にテキストの内容をセット
                iStack[1] = Int(textKekka.text!)!

                //結果表示
                textKekka.text = String(iStack[0] - iStack[1])
                
                
                //初期化
                iStack[0] = 0
                iStack[1] = 0

                //最後に押された演算子として記録
                sOp = "="

                //演算子が押されたフラグ ＝ True
                bOpFlg = true
                
            case "×":
                
                //配列の1番目に配列の２番目をセット
                iStack[0] = iStack[1]
                //配列の２番目にテキストの内容をセット
                iStack[1] = Int(textKekka.text!)!
                
                //結果表示
                textKekka.text = String(iStack[0] * iStack[1])
                
                //初期化
                iStack[0] = 0
                iStack[1] = 0
                
                //最後に押された演算子として記録
                sOp = "="
                
                //演算子が押されたフラグ ＝ True
                bOpFlg = true

            case "÷":
                
                //配列の1番目に配列の２番目をセット
                iStack[0] = iStack[1]
                //配列の２番目にテキストの内容をセット
                iStack[1] = Int(textKekka.text!)!
                
                //結果表示
                textKekka.text = String(iStack[0] / iStack[1])
                
                //初期化
                iStack[0] = 0
                iStack[1] = 0
                
                //最後に押された演算子として記録
                sOp = "="
                
                //演算子が押されたフラグ ＝ True
                bOpFlg = true
                
            default: break
                //何もしない
            }

            
        default:
            print("?")
        }
        
        
        
        
        
    }
    
}
