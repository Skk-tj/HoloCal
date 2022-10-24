//
//  Nijisanji.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-11.
//

import Foundation
import OrderedCollections

enum NijisanjiGeneration: Int, CaseIterable, Codable, Hashable {
    case firstGen
    case secondGen
    case gamers
    case seedsFirstGen
    case seedsSecondGen
    case wave2019
    case wave2020
    case wave2021
    case wave2022
    case id1stWave
    case id2ndWave
    case id3rdWave
    case id4thWave
    case id5thWave
    case id6thWave
    case en1stWave
    case en2ndWave
    case en3rdWave
    case en4thWave
    case en5thWave
    case en6thWave
    case official
    
    // For all the channels that we may not recognize
    case other
}

enum NijisanjiTalentEnum: String, Codable {
    // MARK: - NIJISANJI First Generation
    case moira = "UCvmppcdYf4HOv-tFQhHHJMA"
    case suzuya = "UCpnvhOIJ6BN-vPkYU9ls-Eg" // Suzuya Aki
    case shibuya = "UCeK9HFcRZoTrvqcUCtccMoQ" // Shibuya Hajime
    case higuchi = "UCsg-YqdqQ-KFF0LNk23BY4A" // Higuchi Kaede
    case tsukino = "UCD-miitqNY3nyukJ4Fnf4_A" // Tsukino Mito
    case yuuki = "UCLO9QDxVL4bnvRRsz6K4bsQ" // Yuuki Chihiro
    case shizuka = "UC6oDys1BGgBsIC3WhG1BovQ" // Shizuka Rin
    case elu = "UCYKP16oMX9KKPbrNgo_Kgag" // Elu the Elf
    
    // MARK: - NIJISANJI Second Generation
    case ienaga = "UC_GCs6GARLxEHxy1w40d6VQ" // Ienaga Mugi
    case yuuhi = "UC48jH1ul-6HOrcSSfoR02fQ" // Yuuhi Riri
    case fushimi = "UCXU7YYxy_iQd3ulXyO-zC2w" // Fushimi Gaku
    case kenmochi = "UCv1fFr156jc65EMiLbaLImw" // Kenmochi Toya
    case mononobe = "UCt0clH12Xk1-Ej5PXKGfdPA" // Mononobe Alice
    case ushimi = "UCmUjjW5zF1MMOhYUwwwQv9Q" // Ushimi Ichigo
    case suzuka = "UCwokZsOK_uEre70XayaFnzA" // Suzuka Utako
    case gilzaren = "UCUzJ90o1EjqUbk2pBAy0_aw" // Gilzaren III
    case fumino = "UCBiqkFJljoxAj10SoP2w2Cg" // Fumino Tamaki
    case morinaka = "UCtpB6Bvhs1Um93ziEDACQ8g" // Morinaka Kazaki
    
    // MARK: - NIJISANJI Gamers
    case kanae = "UCspv01oxUFf_MTSipURRhkA" // Kanae
    case akabane = "UCBi8YaVyZpiKWN3_Z0dCTfQ" // Akabane Youko
    case sasaki = "UCoztvTULBYd3WmStqYeoHcA" // Sasaki Saku
    case honma = "UC0g1AE0DOjBYnLhkgoRWN1w" // Honma Himawari
    case makaino = "UC9EjSJ8pvxtvPdxLOElv73w" // Makaino Ririmu
    case kuzuha = "UCSFCh5NL4qXrAy9u-u2lX3g" // Kuzuha
    case shiina = "UC_4tXjqecqox5Uc05ncxpxg" // Shiina Yuika
    
    // MARK: - NIJISANJI SEEDs First Generation
    case dola = "UC53UDnhAAYwvNO7j_2Ju1cQ" // Dola
    case todoroki = "UCRV9d6YCYIMUszK-83TwxVA" // Todoroki Kyoko
    case sister = "UC1zFJrfEKvCixhsjNSb1toQ" // Sister Claire
    case hanabatake = "UCsFn_ueskBkMCEyzCEqAOvg" // Hanabatake Chaika
    case yashiro = "UCKMYISTJAQ8xTplUPHiABlA" // Yashiro Kizuku
    case azuchi = "UC6TfqY40Xt1Y0J-N18c85qQ" // Azuchi Momo
    case suzuki = "UCryOPk2GZ1meIDt53tL30Tw" // Suzuki Masaru
    case uzuki = "UC3lNFeJiTq6L3UWoz4g1e-A" // Uzuki Kou
    case ryushen = "UCt5-0i4AVHXaWJrL8Wql3mw" // Ryushen
    case ryushenGaming = "UCTi_rzf5QIkXjhJjkbcAdTg" // Ryushen (Gaming)
    
    // MARK: - NIJISANJI SEEDs Second Generation
    case kanda = "UCWz0CSYCxf4MhRKPDm220AQ" // Kanda Shoichi
    case asuka = "UCiSRx1a2k-0tOg-fs6gAolQ" // Asuka Hina
    case harusaki = "UCtAvQ5U0aXyKwm2i4GqFgJg" // Harusaki Air
    case amemori = "UCRWOdwLRsenx2jLaiCAIU4A" // Amemori Sayo
    case takamiya = "UCV5ZZlLjk5MKGg3L0n0vbzw" // Takamiya Rion
    case maimoto = "UCJubINhCcFXlsBwnHp0wl_g" // Maimoto Keisuke
    case rindou = "UCPvGypSgfDkVe7JG2KygK7A" // Rindou Mikoto
    case debidebi = "UCjlmCrq4TP1I4xguOtJ-31w" // Debidebi Debiru
    case sakura = "UCfQVs_KuXeNAlGa3fb8rlnQ" // Sakura Ritsuki
    case machita = "UCo7TRj3cS-f_1D9ZDmuTsjw" // Machita Chima
    case joe = "UChUJbHiTVeGrSkTdBzVfNCQ" // Joe Rikiichi
    case naruse = "UCoM_XmK45j504hfUWvN06Qg" // Naruse Naru
    case belmond = "UCbc8fwhdUNlqi-J99ISYu4A" // Belmond Banderas
    case yaguruma = "UCvzVB-EYuHFXHZrObB8a_Og" // Yaguruma Rine
    case yumeoi = "UCTIE7LM5X15NVugV7Krp9Hw" // Yumeoi Kakeru
    case kuroi = "UCmeyo5pRj_6PXG-CsGUuWWg" // Kuroi Shiba
    
    // MARK: - 2019 Wave
    case gundo = "UCeShTCVgZyq2lsBW9QwIJcw" // Gundo Mirei
    case yuzuki = "UCCVwhI5trmaSxfcze_Ovzfw" // Yuzuki Roa
    case onomachi = "UCg63a3lk6PNeWhVvMRM_mrQ" // Onomachi Haruka
    case kataribe = "UCufQu4q65z63IgE4cfKs1BQ" // Kataribe Tsumugu
    case seto = "UCHK5wkevfaGrPr7j3g56Jmw" // Seto Miyako
    case inui = "UCXRlIK3Cw_TJIQC5kSJJQMg" // Inui Toko
    case ange = "UCHVXbQzkl3rDfsXWo8xi2qw" // Ange Katrina
    case lize = "UCZ1xuCK1kNmn5RzPYIZop3w" // Lize Helesta
    case saegusa = "UCNW1Ex0r6HsWRD4LCtPwvoQ" // Saegusa Akina
    case aizono = "UC0WwEfE-jOM2rzjpdfhTzZA" // Aizono Manami
    case yukishiro = "UCHX7YpFG8rVwhsHCx34xt7w" // Yukishiro Mahiro
    case ex = "UCIytNcoz4pWzXfLda0DoULQ" // Ex Albio
    case levi = "UCtnO2N4kPTXmyvedjGWdx3Q" // Levi Elipha
    case hayama = "UCfipDDn7wY-C-SoUChgxCQQ" // Hayama Marin
    case nui = "UCUc8GZfFxtmk7ZwSO7ccQ0g" // Nui Sociere
    case hakase = "UCGYAYLDE7TZiiC8U6teciDQ" // Hakase Fuyuki
    case kagami = "UCmovZ2th3Sqpd00F5RdeigQ" // Kagami Hayato
    case yorumi = "UCL34fAoFim9oHLbVzMKFavQ" // Yorumi Rena
    case ars = "UCdpUojq0KWZCN9bxXnZwz5w" // Ars Almal
    case aiba = "UCnRQYHTnRLSF0cLJwMnedCg" // Aiba Uiha
    case amamiya = "UCkIimWZ9gBJRamKF0rmPU8w" // Amamiya Kokoro
    case eli = "UCpNH2Zk2gw3JBjWAKSyZcQQ" // Eli Conifer
    case ratna = "UCIG9rDtgR45VCZmYnd-4DUw" // Ratna Petit
    case ratnaASMR = "UCpfjQCCavrO-rnKaAaIF9dg" // Ratna Petit ASMR
    case hayase = "UC2OacIzd2UxGHRGhdHl1Rhw" // Hayase Sou
    case sukoya = "UC8C1LLhBhf_E2IBPLSDJXlQ" // Sukoya Kana
    case shellin = "UCHBhnG2G-qN0JrrWmMO2FTA" // Shellin Burgundy
    case fumi = "UCwrjITPwG4q71HzihV2C7Nw" // Fumi
    case hoshikawa = "UC9V3Y3_uzU5e-usObb6IE1w" // Hoshikawa Sara
    case yamagami = "UCllKI7VjyANuS1RXatizfLQ" // Yamagami Karuta
    case emmaAugust = "UCl1oLKcAq93p-pwKfDGhiYQ" // Emma★August
    case luis = "UCb6ObE-XGCctO3WrjRZC-cw" // Luis Cammy
    case matsukai = "UCerkculBD7YLc_vOGrF7tKg" // Matsukai Mao
    case fuwa = "UC6wvdADTJ88OfIbJYIpAaDA" // Fuwa Minato
    case shirayuki = "UCuvk5PilcvDECU7dDZhQiEw" // Shirayuki Tomoe
    case gwelu = "UC1QgXt46-GEvtNjEC1paHnw" // Gwelu Os Gar
    case mashiro = "UCS-XXTgVkotkbkDnGEprXpg" // Mashiro
    case naraka = "UC-o-E6I3IC2q8sAoAuM6Umg" // Naraka
    case kurusu = "UCRcLAVTbmx2-iNcXSsupdNA" // Kurusu Natsume
    
    // MARK: - 2020 Wave
    case furen = "UCuep1JCrMvSxOGgGhBfJuYw" // Furen E Lustario
    case ibrahim = "UCmZ1Rbthn-6Jm_qOGjYsh5A" // Ibrahim
    case nagao = "UCXW4MqCQn-jCaxlX-nn-BYg" // Nagao Kei
    case genzuki = "UCGw7lrT-rVZCWHfdG9Frcgg" // Genzuki Tojiro
    case kaida = "UCo2N7C-Z91waaR6lF3LL_jw" // Kaida Haru
    case sorahoshi = "UC_82HBGtvwN1hcGeOGHzUBQ" // Sorahoshi Kirame
    case asahina = "UCe_p3YEuYJb8Np0Ip9dk-FQ" // Asahina Akane
    case suo = "UCL_O_HXgLJx3Auteer0n0pA" // Suo Sango
    case todo = "UCebT4Aq-3XWb5je1S1FvR_A" // Todo Kohaku
    case kitakoji = "UCRqBKoKuX30ruKAq05pCeRQ" // Kitakoji Hisui
    case nishizono = "UCkngxfPbmGyGl_RIq4FA3MQ" // Nishizono Chigusa
    
    // MARK: - 2021 Wave
    case axia = "UC8oPnditPSp5lZu45fnXWCA" // Axia Krone
    case lauren = "UCgmFrRcyH7d1zR9sIVQhFow" // Lauren Iroas
    case leos = "UC-6rZgmxZSIbq786j3RD5ow" // Leos Vincent
    case oliver = "UCqjTqdVlvIipZXIKeCkHKUA" // Oliver Evans
    case lain = "UCRm6lqtdxs_Qo6HeL-SRQ-w" // Lain Paterson

    // MARK: - 2022 Wave
    case amagase = "UCAQDFeCTVdx90GtwohwjHzQ" // Amagase Muyu
    case ponto = "UCe22Bcwd_GCpTjLxn83zl7A" // Ponto Nei
    case umise = "UCtHY-tP0dyykhTRMmnfPs_g" // Umise Yotsuh
    case hyakumantenbara = "UCgIfLpQvelloDi8I0Ycbwpg" // Hyakumantenbara Salome
    case fura = "UCC7rRD6P7RQcx0hKv9RQP4w" // Fura Kanato
    case watarai = "UC4l9gz3q65lTBFfFtW5LLeA" // Watarai Hibari
    case shikinagi = "UCcDDxnoQcezyTUzHg5uHaKg" // Shikinagi Akira
    case seraph = "UC5dJFf4m-mEcoyJRfhBljoA" // Seraph Dazzlegarden
    
    // MARK: - ID First Wave: 3setBBQ
    case taka = "UCZ5dNZsqBjBzbBl0l_IdmXg" // Taka Radjiman
    case zea = "UCA3WE2WRSpoIvtnoVGq4VAw" // ZEA Cornelia
    case hana = "UCpJtk0myFr5WnyfsmnInP-w" // Hana Macchia
    
    // MARK: - ID Second Wave: CloverMcOver
    case rai = "UC8Snw5i4eOJXEQqURAK17hQ" // Rai Galilei
    case amicia = "UCrR7JxkbeLY82e8gsj_I0pQ" // Amicia Michella
    case miyu = "UCOmjciHZ8Au3iKMElKXCF_g" // Miyu Ottavia
    
    // MARK: - ID Third Wave: LAN_NEE3S
    case azura = "UCk5r533QVMgJUdWwqegH2TA" // Azura Cecillia
    case layla = "UCyRkQSuhJILuGOuXk10voPg" // Layla Alstroemeria
    case nara = "UCoWH3sDpeXG1aXmOxveX4KA" // Nara Haramaung
    
    // MARK: - ID Fourth Wave: 3FicLite
    case etna = "UCjFu-9GHnabzSFRAYm1B9Dw" // Etna Crimson
    case bonnivier = "UCHjeZylSgXDSnor8wUnwU_g" // Bonnivier Pranaja
    case siska = "UC5qSx7KzdRwbsO1QmJc4d-w" // Siska Leontyne
    
    // MARK: - ID Fifth Wave: 53renade
    case nagisa = "UCijNnZ-6m8g85UGaRAWuw7g" // Nagisa Arcinia
    case derem = "UCMzVa7B8UEdrvUGsPmSgyjA" // Derem Kado
    case reza = "UC5yckZliCkuaEFbqzLBD7hQ" // Reza Avanluna
    
    // MARK: - ID Sixth Wave: 6WS
    case hyona = "UCIBj1-d71vKjRftiauF50pg" // Hyona Elatiora
    case xia = "UCoJ0Ct-jdas4cLPpSp06gZg" // Xia Ekavira
    case mika = "UCahgMxSIQ2zIRrPKhM6Mjvg" // Mika Melatika
    
    // MARK: - EN First Wave: LazuLight
    case pomu = "UCP4nMSTdwU1KqYWu3UH5DHQ" // Pomu Rainpuff
    case elira = "UCIeSUTOTkF9Hs7q3SGcO-Ow" // Elira Pendora
    case finana = "UCu-J8uIXuLZh16gG-cT1naw" // Finana Ryugu
    
    // MARK: - EN Second Wave: OBSYDIA
    case rosemi = "UC4WvIIAo89_AzGUh1AZ6Dkg" // Rosemi Lovelock
    case petra = "UCgA2jKRkqpY_8eysPUs8sjw" // Petra Gurin
    case selen = "UCV1xUwfM2v2oBtT3JNvic3w" // Selen Tatsuki
    
    // MARK: - EN Third Wave: Ethyria
    case nina = "UCkieJGn3pgJikVW8gmMXE2w" // Nina Kosaka
    case millie = "UC47rNmkDcNgbOcM-2BwzJTQ" // Millie Parfait
    case enna = "UCR6qhsLpn62WVxCBK1dkLow" // Enna Alouette
    case reimu = "UCBURM8S4LH7cRZ0Clea9RDA" // Reimu Endou

    // MARK: - EN Fourth Wave: Luxiem
    case luca = "UC7Gb7Uawe20QyFibhLl1lzA" // Luca Kaneshiro
    case shu = "UCG0rzBZV_QMP4MtWg6IjhEA" // Shu Yamino
    case ike = "UC4yNIKGvy-YUrwYupVdLDXA" // Ike Eveland
    case mysta = "UCIM92Ok_spNKLVB5TsgwseQ" // Mysta Rias
    case vox = "UCckdfYDGrjojJM28n5SHYrA" // Vox Akuma
    
    // MARK: - EN Fifth Wave: Noctyx
    case sonny = "UCuuAb_72QzK0M1USPMEl1yw" // Sonny Brisko
    case uki = "UChJ5FTsHOu72_5OVx0rvsvQ" // Uki Violeta
    case alban = "UCQ1zGxHrfEmmW4CPpBx9-qw" // Alban Knox
    case fulgur = "UCGhqxhovNfaPBpxfCruy9EA" // Fulgur Ovid
    case yugo = "UCSc_KzY_9WYAx9LghggjVRA" // Yugo Asuma
    
    // MARK: - EN Sixth Wave: ILUNA
    case kyo = "UCsb-1aJgiJXJH2feV-zlZRw" // Kyo Kaneko
    case maria = "UCwaS8_S7kMiKA3izlTWHbQg" // Maria Marionette
    case aster = "UCpzxZW5kghGnO5TmAFJQAVw" // Aster Arcadia
    case aia = "UCN68LoM3khS4gdBMiWJO8WA" // Aia Amare
    case ren = "UCKu59gTZ_rdEmerdx5rV4Yg" // Ren Zotto
    case scarle = "UCFgXWZOUZA2oYHNr6qDmsTQ" // Scarle Yonaguni
    
    // MARK: - Official/Other Channels
    case nijisanji = "UCX7YkU9nEeaoZbkVLVajcMg" // Nijisanji
    case nijisanjiID = "UCbLgcjfsUaCUgJh9SVit8kw" // NIJISANJI ID Official
    case nijisanjiEN = "UC-JSeFfovhNsEhftt1WHMvg"
    
    case virtual = "UC4Jyg9gFStHO8r5n4ya7XCQ" // Virtual Talent Academy
    case JuvveL = "UC_D2DNy-KUNQJ_NGMppgmyg" // None
    case VOLTACTION = "UCNRh9kkByBTYLo0IJupnAug" // None
    case luxiem = "UCtHFXfrn52juTqGBN4WbMVw" // Luxiem Channel
    case rofmao = "UCwi4P78SVunSYAGrvC9aKcw" // ROF-MAO
    case Nornis = "UCxWcO9CLti4uouUIS5IIF-Q" // None
    case ChroNoiR = "UCz6vnIbgiqFT9xUcD6Bp65Q" // None
}

extension NijisanjiTalentEnum: Identifiable {
    var id: String { rawValue }
}

let nijisanjiTalentEnumToTalent: [NijisanjiTalentEnum: NijisanjiTalent] = [
    .moira: NijisanjiTalent(id: NijisanjiTalentEnum.moira.rawValue, names: [.en: "Moira", .ja: "モイラ"], inGeneration: NijisanjiGeneration.firstGen)
]

let nijisanjiTalentsByGenerations: OrderedDictionary<NijisanjiGeneration, NijisanjiGenerationGroup> = [:]
