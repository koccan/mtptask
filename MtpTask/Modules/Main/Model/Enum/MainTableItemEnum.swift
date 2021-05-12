//
//  MainTableItemEnum.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

enum MainTableItemEnum {
    case title(text: String)
    case meditations
    case stories
    case banner
    
    /*
     Burada hızlı çözüm olarak doğrudan tableview'ın auto height etme özelliğini kullanarak,
     boşlukları oluşturmak için cell'ler içerisinde yukarı ve aşağı yönlü constraints kullandım.
     Bunun yerine boş bir cell açıp, tableView heightForRowAt delegate'inde istediğimiz boşluğu dönebiliriz.
    */
     case space(height: Int)
}
