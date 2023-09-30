//
//  Ilan.swift
//  BootcampCloneDesignAssignment
//
//  Created by furkan sakız on 29.09.2023.
//

import Foundation

class Ilan {
    var resim: String?
    var fiyat: Int?
    var ilanBilgi: String?
    var konum: String?
    
    init(resim: String, fiyat: Int, ilanBilgi: String, konum: String) {
        self.resim = resim
        self.fiyat = fiyat
        self.ilanBilgi = ilanBilgi
        self.konum = konum
    }
}

