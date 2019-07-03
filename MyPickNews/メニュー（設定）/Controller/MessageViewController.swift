//
//  MessageViewController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/17.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit
import MessageUI

class MessageViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()

    }
    func sendMail() {
        //メール送信が可能なら
        if MFMailComposeViewController.canSendMail() {
            //MFMailComposeVCのインスタンス
            let mail = MFMailComposeViewController()
            //MFMailComposeのデリゲート
            mail.mailComposeDelegate = self
            mail.setToRecipients(["walkdream24@gmail.com"]) // 宛先アドレス
            mail.setSubject("お問い合わせ") // 件名
            //メッセージ本文
            mail.setMessageBody("", isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
            //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "No Mail Accounts", message: "Please set up mail accounts", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("キャンセル")
             dismiss(animated: true, completion: nil)
        case .saved:
            print("下書き保存")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("送信成功")
            dismiss(animated: true, completion: nil)
        default:
            print("送信失敗")
            dismiss(animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
