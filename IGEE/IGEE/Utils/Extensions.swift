//
//  Extensions.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
