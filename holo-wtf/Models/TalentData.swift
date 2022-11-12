//
//  Talents.swift
//  holo-wtf
//
//  Created by ??? on 2022-04-02.
//

import Foundation
import OrderedCollections

enum Generation: Int, CaseIterable, Codable, Hashable {
    // MARK: - Hololive
    case hololiveZerothGen
    case hololiveFirstGen
    case hololiveSecondGen
    case gamers
    case thirdGen
    case forthGen
    case fifthGen
    case holox
    case idFirstGen
    case idSecondGen
    case idThirdGen
    case enMyth
    case projectHope
    case enCouncil
    case starsFirstGen
    case starsSecondGen
    case starsThirdGen
    case uproar
    case tempus
    case hololiveOfficial
    
    // MARK: - Nijisanji
    case firstGen
    case secondGen
    case gamersFirstWave
    case gamersSecondWave
    case gamersThirdWave
    case seedsFirstGen
    case seedsSecondGenFirstWave
    case seedsSecondGenSecondWave
    case seedsSecondGenThirdWave
    case wave2019Usa
    case wave2019Jan28
    case wave2019Sanbaka
    case wave2019Beni
    case wave2019Apr29
    case wave2019May17
    case wave2019Jun19
    case wave2019SMC
    case wave2019Blues
    case wave2019Posanke
    case wave2019Tulip
    case wave2019Orihimeboshi
    case wave2019AkaNoSoshiki
    case wave2019NightKingdom
    case wave2019Mananatsu
    case wave2020Meifu
    case wave2020Valz
    case wave2020Jun30
    case wave2020SereineJogakuin
    case wave2021
    case wave2022Ranunculus
    case wave2022May21
    case wave2022Voltaction
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
    case nijisanjiOfficial
    
    // For all the channels that we may not recognize
    case other
    
    func getLocalizedName() -> String {
        return talentsByGeneration[self]!.localizedName
    }
    
    func getAltLocalizedName() -> String {
        return talentsByGeneration[self]!.altLocalizedName
    }
}

enum TalentEnum: String, Codable {
    // MARK: - Hololive
    
    // MARK: - 0th gen
    case sora = "UCp6993wxpyDPHUpavwDFqgg"
    case roboco = "UCDqI2jOz0weumE8s7paEk6g"
    case azki = "UC0TXe_LYZ4scaW2XMyi5_kw"
    case miko = "UC-hM6YJuNYVAmUWxeIr9FeA"
    case suisei = "UC5CwaMl1eIgY8h02uZw7u8A"
    // MARK: - 1st gen
    case mel = "UCD8HOxPs4Xvsm8H0ZxXGiBw"
    case aki = "UCFTLzh12_nrtzqBPsTCqenA"
    case haato = "UC1CfXB_kRs3C-zaeTG3oGyg"
    case fubuki = "UCdn5BQ06XqgXoAxIhbqw5Rg"
    case matsuri = "UCQ0UDLQCjY0rmuxCDE38FGg"
    // MARK: - 2nd gen
    case aqua = "UC1opHUrw8rvnsadT-iGp7Cg"
    case shion = "UCXTpFs_3PqI41qX2d9tL2Rw"
    case ayame = "UC7fk0CB07ly8oSl0aqKkqFg"
    case choco = "UC1suqwovbL1kzsoaZgFZLKg"
    case subaru = "UCvzGlP9oQwU--Y0r9id_jnA"
    // MARK: - Gamers
    case mio = "UCp-5t9SrOQwXMU7iIjQfARg"
    case okayu = "UCvaTdHTWBGv3MKj3KVqJVCw"
    case korone = "UChAnqc_AY5_I3Px5dig3X1Q"
    // MARK: - 3rd gen
    case pekora = "UC1DCedRgGHBdm81E1llLhOQ"
    case flare = "UCvInZx9h3jC2JzsIzoOebWg"
    case noel = "UCdyqAaZDKHXg4Ahi7VENThQ"
    case marine = "UCCzUftO8KOVkV4wQG1vkUvg"
    // MARK: - 4th gen
    case kanata = "UCZlDXzGoo7d44bwdNObFacg"
    case watame = "UCqm3BQLlJfvkTsX_hvm0UmA"
    case towa = "UC1uv2Oq6kNxgATlCiez59hw"
    case luna = "UCa9Y57gfeY0Zro_noHRVrnw"
    // MARK: - 5th gen
    case lamy = "UCFKOVgVbGmX65RxO3EtH3iw"
    case nene = "UCAWSyEs_Io8MtpY3m-zqILA"
    case botan = "UCUKD-uaobj9jiqB-VXt71mA"
    case polka = "UCK9V2B22uJYu3N7eR_BT9QA"
    // MARK: - holoX
    case laplus = "UCENwRMx5Yh42zWpzURebzTw"
    case lui = "UCs9_O1tRPMQTHQ-N_L6FU2g"
    case koyori = "UC6eWCld0KwmyHFbAqK3V-Rw"
    case chloe = "UCIBY1ollUsauvVi4hW4cumw"
    case iroha = "UC_vMYWcDjmfdpH6r4TTn1MQ"
    // MARK: - ID 1st gen
    case risu = "UCOyYb1c43VlX9rc_lT6NKQw"
    case moona = "UCP0BspO_AMEe3aQqqpo89Dg"
    case iofi = "UCAoy6rzhSf4ydcYjJw3WoVg"
    // MARK: - ID 2nd gen
    case ollie = "UCYz_5n-uDuChHtLo7My1HnQ"
    case anya = "UC727SQYUvx5pDDGQpTICNWg"
    case reine = "UChgTyjG-pdNvxxhdsXfHQ5Q"
    // MARK: - ID 3rd gen
    case zeta = "UCTvHWSfBZgtxE4sILOaurIQ"
    case kaela = "UCZLZ8Jjx_RN2CXloOmgTHVg"
    case kobo = "UCjLEmnpCNeisMxy134KPwWw"
    // MARK: - EN Myth
    case mori = "UCL_qhgtOy0dy1Agp8vkySQg"
    case kiara = "UCHsx4Hqa-1ORjQTh9TYDhww"
    case ina = "UCMwGHR0BTZuLsmjY_NT5Pwg"
    case gura = "UCoSrY_IQQVpmIRZ9Xf-y93g"
    case ame = "UCyl1z3jo3XHR1riLFKG5UAg"
    // MARK: - Project: HOPE
    case irys = "UC8rcEBzJSleTkf_-agPM20g"
    // MARK: - EN Council
    case ceres = "UCO_aKKYxn4tvrqPjcTzZ6EQ"
    case kronii = "UCmbs8T6MWqUHP1tIQvSgKrg"
    case mumei = "UC3n5uGu18FoCy23ggWWp8tA"
    case baelz = "UCgmPnx-EEeOrZSg5Tiw7ZRQ"
    // MARK: - holostars 1st gen
    case miyabi = "UC6t3-_N8A6ME1JShZHHqOMw"
    case izuru = "UCZgOv3YDEs-ZnZWDYVwJdmA"
    case arurandeisu = "UCKeAhJvy8zgXWbh9duVjIaQ"
    case rikka = "UC9mf_ZVpouoILRY9NUIaK-w"
    // MARK: - holostars 2nd gen
    case astel = "UCNVEsYbiZjH5QLmGeSgTSzg"
    case temma = "UCGNI4MENvnsymYjKiZwv9eg"
    case roberu = "UCANDOlYTJT7N5jlRC3zfzVA"
    // MARK: - holostars 3rd gen
    case shien = "UChSvpZYRPh0FvG4SJGSga3g"
    case oga = "UCwL7dgTxKo8Y4RFIKWaf8gA"
    // MARK: - holostars UPROAR!!
    case fuma = "UCc88OV45ICgHbn3ZqLLb52w"
    case uyu = "UCgRqGV1gBf2Esxh0Tz1vxzw"
    case gamma = "UCkT1u65YS49ca_LsFwcTakw"
    case rio = "UCdfMHxjcCc2HSd9qFvfJgjg"
    // MARK: - holostars English -TEMPUS-
    case altare = "UCyxtGMdWlURZ30WSnEjDOQw"
    case vesper = "UCDRWSO281bIHYVi-OV3iFYA"
    case syrios = "UC2hx0xVkMoHGWijwr_lA01w"
    case dezmond = "UC7MMNHR-kf9EN1rXiesMTMw"
    // MARK: - Official Channels
    case hololive = "UCJFZiqLMntJufDCHc6bQixg"
    case hololiveEN = "UCotXwY6s8pWmuWd_snKYjhg"
    case hololiveID = "UCfrWoRGlawPQDQxxeIDRP0Q"
    case holostars = "UCWsfcksUUpoEvhia0_ut0bA"
    case midnight = "UCnVbtCwr-5LXxUlGxsgD7sQ"
    
    // MARK: - Nijisanji
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
    
    // MARK: - NIJISANJI Gamers First Wave
    case kanae = "UCspv01oxUFf_MTSipURRhkA" // Kanae
    case akabane = "UCBi8YaVyZpiKWN3_Z0dCTfQ" // Akabane Youko
    
    // MARK: - NIJISANJI Gamers Second Wave
    case sasaki = "UCoztvTULBYd3WmStqYeoHcA" // Sasaki Saku
    case honma = "UC0g1AE0DOjBYnLhkgoRWN1w" // Honma Himawari
    
    // MARK: - NIJISANJI Gamers Third Wave
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
    
    // MARK: - NIJISANJI SEEDs Second Generation First Wave
    case kanda = "UCWz0CSYCxf4MhRKPDm220AQ" // Kanda Shoichi
    case asuka = "UCiSRx1a2k-0tOg-fs6gAolQ" // Asuka Hina
    case harusaki = "UCtAvQ5U0aXyKwm2i4GqFgJg" // Harusaki Air
    case amemori = "UCRWOdwLRsenx2jLaiCAIU4A" // Amemori Sayo
    case takamiya = "UCV5ZZlLjk5MKGg3L0n0vbzw" // Takamiya Rion
    case maimoto = "UCJubINhCcFXlsBwnHp0wl_g" // Maimoto Keisuke
    
    // MARK: - NIJISANJI SEEDs Second Generation Second Wave
    case rindou = "UCPvGypSgfDkVe7JG2KygK7A" // Rindou Mikoto
    case debidebi = "UCjlmCrq4TP1I4xguOtJ-31w" // Debidebi Debiru
    case sakura = "UCfQVs_KuXeNAlGa3fb8rlnQ" // Sakura Ritsuki
    case machita = "UCo7TRj3cS-f_1D9ZDmuTsjw" // Machita Chima
    case joe = "UChUJbHiTVeGrSkTdBzVfNCQ" // Joe Rikiichi
    
    // MARK: - NIJISANJI SEEDs Second Generation Third Wave
    case naruse = "UCoM_XmK45j504hfUWvN06Qg" // Naruse Naru
    case belmond = "UCbc8fwhdUNlqi-J99ISYu4A" // Belmond Banderas
    case yaguruma = "UCvzVB-EYuHFXHZrObB8a_Og" // Yaguruma Rine
    case yumeoi = "UCTIE7LM5X15NVugV7Krp9Hw" // Yumeoi Kakeru
    case kuroi = "UCmeyo5pRj_6PXG-CsGUuWWg" // Kuroi Shiba
    
    // MARK: - 2019 Wave: Usa-chan club
    case gundo = "UCeShTCVgZyq2lsBW9QwIJcw" // Gundo Mirei
    case yuzuki = "UCCVwhI5trmaSxfcze_Ovzfw" // Yuzuki Roa

    // MARK: - 2019 Wave: January 28
    case onomachi = "UCg63a3lk6PNeWhVvMRM_mrQ" // Onomachi Haruka
    case kataribe = "UCufQu4q65z63IgE4cfKs1BQ" // Kataribe Tsumugu
    case seto = "UCHK5wkevfaGrPr7j3g56Jmw" // Seto Miyako

    // MARK: - 2019 Wave: Sanbaka
    case inui = "UCXRlIK3Cw_TJIQC5kSJJQMg" // Inui Toko
    case ange = "UCHVXbQzkl3rDfsXWo8xi2qw" // Ange Katrina
    case lize = "UCZ1xuCK1kNmn5RzPYIZop3w" // Lize Helesta

    // MARK: - 2019 Wave: Beni zuwaigani
    case saegusa = "UCNW1Ex0r6HsWRD4LCtPwvoQ" // Saegusa Akina
    case aizono = "UC0WwEfE-jOM2rzjpdfhTzZA" // Aizono Manami

    // MARK: - 2019 Wave: April 29
    case yukishiro = "UCHX7YpFG8rVwhsHCx34xt7w" // Yukishiro Mahiro

    // MARK: - 2019 Wave: May 17
    case ex = "UCIytNcoz4pWzXfLda0DoULQ" // Ex Albio
    case levi = "UCtnO2N4kPTXmyvedjGWdx3Q" // Levi Elipha

    // MARK: - 2019 Wave: June 19
    case hayama = "UCfipDDn7wY-C-SoUChgxCQQ" // Hayama Marin
    case nui = "UCUc8GZfFxtmk7ZwSO7ccQ0g" // Nui Sociere

    // MARK: - 2019 Wave: SMC-gumi
    case hakase = "UCGYAYLDE7TZiiC8U6teciDQ" // Hakase Fuyuki
    case kagami = "UCmovZ2th3Sqpd00F5RdeigQ" // Kagami Hayato
    case yorumi = "UCL34fAoFim9oHLbVzMKFavQ" // Yorumi Rena

    // MARK: - 2019 Wave: Blues
    case ars = "UCdpUojq0KWZCN9bxXnZwz5w" // Ars Almal
    case aiba = "UCnRQYHTnRLSF0cLJwMnedCg" // Aiba Uiha

    // MARK: - 2019 Wave: Posanke
    case amamiya = "UCkIimWZ9gBJRamKF0rmPU8w" // Amamiya Kokoro
    case eli = "UCpNH2Zk2gw3JBjWAKSyZcQQ" // Eli Conifer
    case ratna = "UCIG9rDtgR45VCZmYnd-4DUw" // Ratna Petit
    case ratnaASMR = "UCpfjQCCavrO-rnKaAaIF9dg" // Ratna Petit ASMR

    // MARK: - 2019 Wave: Tulip-gumi
    case hayase = "UC2OacIzd2UxGHRGhdHl1Rhw" // Hayase Sou
    case sukoya = "UC8C1LLhBhf_E2IBPLSDJXlQ" // Sukoya Kana
    case shellin = "UCHBhnG2G-qN0JrrWmMO2FTA" // Shellin Burgundy

    // MARK: - 2019 Wave: Orihimeboshi
    case fumi = "UCwrjITPwG4q71HzihV2C7Nw" // Fumi
    case hoshikawa = "UC9V3Y3_uzU5e-usObb6IE1w" // Hoshikawa Sara
    case yamagami = "UCllKI7VjyANuS1RXatizfLQ" // Yamagami Karuta

    // MARK: - 2019 Wave: Aka no Soshiki
    case emmaAugust = "UCl1oLKcAq93p-pwKfDGhiYQ" // Emma★August
    case luis = "UCb6ObE-XGCctO3WrjRZC-cw" // Luis Cammy
    case matsukai = "UCerkculBD7YLc_vOGrF7tKg" // Matsukai Mao

    // MARK: - 2019 Wave: Night Kingdom
    case fuwa = "UC6wvdADTJ88OfIbJYIpAaDA" // Fuwa Minato
    case shirayuki = "UCuvk5PilcvDECU7dDZhQiEw" // Shirayuki Tomoe
    case gwelu = "UC1QgXt46-GEvtNjEC1paHnw" // Gwelu Os Gar

    // MARK: - 2019 Wave: Mananatsu
    case mashiro = "UCS-XXTgVkotkbkDnGEprXpg" // Mashiro
    case naraka = "UC-o-E6I3IC2q8sAoAuM6Umg" // Naraka
    case kurusu = "UCRcLAVTbmx2-iNcXSsupdNA" // Kurusu Natsume
    
    // MARK: - 2020 Wave: Meifu
    case furen = "UCuep1JCrMvSxOGgGhBfJuYw" // Furen E Lustario
    case ibrahim = "UCmZ1Rbthn-6Jm_qOGjYsh5A" // Ibrahim

    // MARK: - 2020 Wave: VΔLZ
    case nagao = "UCXW4MqCQn-jCaxlX-nn-BYg" // Nagao Kei
    case genzuki = "UCGw7lrT-rVZCWHfdG9Frcgg" // Genzuki Tojiro
    case kaida = "UCo2N7C-Z91waaR6lF3LL_jw" // Kaida Haru

    // MARK: - 2020 Wave: June 30
    case sorahoshi = "UC_82HBGtvwN1hcGeOGHzUBQ" // Sorahoshi Kirame

    // MARK: - 2020 Wave: Sereine Jogakuin
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
    
    // MARK: - 2022 Wave: Ranunculus
    case amagase = "UCAQDFeCTVdx90GtwohwjHzQ" // Amagase Muyu
    case ponto = "UCe22Bcwd_GCpTjLxn83zl7A" // Ponto Nei
    case umise = "UCtHY-tP0dyykhTRMmnfPs_g" // Umise Yotsuh

    // MARK: - 2022 Wave: May 21
    case hyakumantenbara = "UCgIfLpQvelloDi8I0Ycbwpg" // Hyakumantenbara Salome
    
    // MARK: - 2022 Wave: VOLTACTION
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
    case riksa = "UCkL9OLKjIQbKk2CztbpOCFg" // Riksa Dhirendra
    
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
    case JuvveL = "UC_D2DNy-KUNQJ_NGMppgmyg"
    case VOLTACTION = "UCNRh9kkByBTYLo0IJupnAug"
    case luxiem = "UCtHFXfrn52juTqGBN4WbMVw" // Luxiem Channel
    case rofmao = "UCwi4P78SVunSYAGrvC9aKcw" 
    case Nornis = "UCxWcO9CLti4uouUIS5IIF-Q"
    case ChroNoiR = "UCz6vnIbgiqFT9xUcD6Bp65Q"
}

extension TalentEnum: Identifiable {
    var id: String { rawValue }
}

let talentEnumToTalent: [TalentEnum: Talent] = [
    // MARK: - 0th gen
    .sora: Talent(id: TalentEnum.sora.rawValue, names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: Generation.hololiveZerothGen),
    .roboco: Talent(id: TalentEnum.roboco.rawValue, names: [.en: "Robocosan", .ja: "ロボ子さん"], inGeneration: Generation.hololiveZerothGen),
    .azki: Talent(id: TalentEnum.azki.rawValue, names: [.en: "AZKi", .ja: "AZKi"], inGeneration: Generation.hololiveZerothGen),
    .miko: Talent(id: TalentEnum.miko.rawValue, names: [.en: "Sakura Miko", .ja: "さくらみこ"], inGeneration: Generation.hololiveZerothGen),
    .suisei: Talent(id: TalentEnum.suisei.rawValue, names: [.en: "Hoshimachi Suisei", .ja: "星街すいせい"], inGeneration: Generation.hololiveZerothGen),
    
    // MARK: - 1st gen
    .mel: Talent(id: TalentEnum.mel.rawValue, names: [.en: "Yozora Mel", .ja: "夜空メル"], inGeneration: Generation.hololiveFirstGen),
    .aki: Talent(id: TalentEnum.aki.rawValue, names: [.en: "Aki Rosenthal", .ja: "アキ・ローゼンタール"], inGeneration: Generation.hololiveFirstGen),
    .haato: Talent(id: TalentEnum.haato.rawValue, names: [.en: "Akai Haato", .ja: "赤井はあと"], inGeneration: Generation.hololiveFirstGen),
    .fubuki: Talent(id: TalentEnum.fubuki.rawValue, names: [.en: "Shirakami Fubuki", .ja: "白上フブキ"], inGeneration: Generation.hololiveFirstGen),
    .matsuri: Talent(id: TalentEnum.matsuri.rawValue, names: [.en: "Natsuiro Matsuri", .ja: "夏色まつり"], inGeneration: Generation.hololiveFirstGen),
    
    // MARK: - 2nd gen
    .aqua: Talent(id: TalentEnum.aqua.rawValue, names: [.en: "Minato Aqua", .ja: "湊あくあ"], inGeneration: Generation.hololiveSecondGen),
    .shion: Talent(id: TalentEnum.shion.rawValue, names: [.en: "Murasaki Shion", .ja: "紫咲シオン"], inGeneration: Generation.hololiveSecondGen),
    .ayame: Talent(id: TalentEnum.ayame.rawValue, names: [.en: "Nakiri Ayame", .ja: "百鬼あやめ"], inGeneration: Generation.hololiveSecondGen),
    .choco: Talent(id: TalentEnum.choco.rawValue, names: [.en: "Yuzuki Choco", .ja: "癒月ちょこ"], inGeneration: Generation.hololiveSecondGen),
    .subaru: Talent(id: TalentEnum.subaru.rawValue, names: [.en: "Oozora Subaru", .ja: "大空スバル"], inGeneration: Generation.hololiveSecondGen),
    
    // MARK: - Gamers
    .mio: Talent(id: TalentEnum.mio.rawValue, names: [.en: "Ookami Mio", .ja: "大神ミオ"], inGeneration: Generation.gamers),
    .okayu: Talent(id: TalentEnum.okayu.rawValue, names: [.en: "Nekomata Okayu", .ja: "猫又おかゆ"], inGeneration: Generation.gamers),
    .korone: Talent(id: TalentEnum.korone.rawValue, names: [.en: "Inugami Korone", .ja: "戌神ころね"], inGeneration: Generation.gamers),
    
    // MARK: - 3rd gen
    .pekora: Talent(id: TalentEnum.pekora.rawValue, names: [.en: "Usada Pekora", .ja: "兎田ぺこら"], inGeneration: Generation.thirdGen),
    .flare: Talent(id: TalentEnum.flare.rawValue, names: [.en: "Shiranui Flare", .ja: "不知火フレア"], inGeneration: Generation.thirdGen),
    .noel: Talent(id: TalentEnum.noel.rawValue, names: [.en: "Shirogane Noel", .ja: "白銀ノエル"], inGeneration: Generation.thirdGen),
    .marine: Talent(id: TalentEnum.marine.rawValue, names: [.en: "Houshou Marine", .ja: "宝鐘マリン"], inGeneration: Generation.thirdGen),
    
    // MARK: - 4th gen
    .kanata: Talent(id: TalentEnum.kanata.rawValue, names: [.en: "Amane Kanata", .ja: "天音かなた"], inGeneration: Generation.forthGen),
    .watame: Talent(id: TalentEnum.watame.rawValue, names: [.en: "Tsunomaki Watame", .ja: "角巻わため"], inGeneration: Generation.forthGen),
    .towa: Talent(id: TalentEnum.towa.rawValue, names: [.en: "Tokoyami Towa", .ja: "常闇トワ"], inGeneration: Generation.forthGen),
    .luna: Talent(id: TalentEnum.luna.rawValue, names: [.en: "Himemori Luna", .ja: "姫森ルーナ"], inGeneration: Generation.forthGen),
    
    // MARK: - 5th gen
    .lamy: Talent(id: TalentEnum.lamy.rawValue, names: [.en: "Yukihana Lamy", .ja: "雪花ラミィ"], inGeneration: Generation.fifthGen),
    .nene: Talent(id: TalentEnum.nene.rawValue, names: [.en: "Momosuzu Nene", .ja: "桃鈴ねね"], inGeneration: Generation.fifthGen),
    .botan: Talent(id: TalentEnum.botan.rawValue, names: [.en: "Shishiro Botan", .ja: "獅白ぼたん"], inGeneration: Generation.fifthGen),
    .polka: Talent(id: TalentEnum.polka.rawValue, names: [.en: "Omaru Polka", .ja: "尾丸ポルカ"], inGeneration: Generation.fifthGen),
    
    // MARK: - holoX
    .laplus: Talent(id: TalentEnum.laplus.rawValue, names: [.en: "La+ Darknesss", .ja: "ラプラス・ダークネス"], inGeneration: Generation.holox),
    .lui: Talent(id: TalentEnum.lui.rawValue, names: [.en: "Takane Lui", .ja: "鷹嶺ルイ"], inGeneration: Generation.holox),
    .koyori: Talent(id: TalentEnum.koyori.rawValue, names: [.en: "Hakui Koyori", .ja: "博衣こより"], inGeneration: Generation.holox),
    .chloe: Talent(id: TalentEnum.chloe.rawValue, names: [.en: "Sakamata Chloe", .ja: "沙花叉クロヱ"], inGeneration: Generation.holox),
    .iroha: Talent(id: TalentEnum.iroha.rawValue, names: [.en: "Kazama Iroha", .ja: "風真いろは"], inGeneration: Generation.holox),
    
    // MARK: - ID 1st gen
    .risu: Talent(id: TalentEnum.risu.rawValue, names: [.en: "Ayunda Risu", .ja: "アユンダ・リス"], inGeneration: Generation.idFirstGen),
    .moona: Talent(id: TalentEnum.moona.rawValue, names: [.en: "Moona Hoshinova", .ja: "ムーナ・ホシノヴァ"], inGeneration: Generation.idFirstGen),
    .iofi: Talent(id: TalentEnum.iofi.rawValue, names: [.en: "Airani Iofifteen", .ja: "アイラニ・イオフィフティーン"], inGeneration: Generation.idFirstGen),
    
    // MARK: - ID 2nd gen
    .ollie: Talent(id: TalentEnum.ollie.rawValue, names: [.en: "Kureiji Ollie", .ja: "クレイジー・オリー"], inGeneration: Generation.idThirdGen),
    .anya: Talent(id: TalentEnum.anya.rawValue, names: [.en: "Anya Melfissa", .ja: "アーニャ・メルフィッサ"], inGeneration: Generation.idThirdGen),
    .reine: Talent(id: TalentEnum.reine.rawValue, names: [.en: "Pavolia Reine", .ja: "パヴォリア・レイネ"], inGeneration: Generation.idThirdGen),
    
    // MARK: - ID 3rd gen
    .zeta: Talent(id: TalentEnum.zeta.rawValue, names: [.en: "KVestia Zeta", .ja: "ベスティア・ゼータ"], inGeneration: Generation.idThirdGen),
    .kaela: Talent(id: TalentEnum.kaela.rawValue, names: [.en: "Kaela Kovalskia", .ja: "カエラ・コヴァルスキア"], inGeneration: Generation.idThirdGen),
    .kobo: Talent(id: TalentEnum.kobo.rawValue, names: [.en: "Kobo Kanaeru", .ja: "こぼ・かなえる"], inGeneration: Generation.idThirdGen),
    
    // MARK: - EN Myth
    .mori: Talent(id: TalentEnum.mori.rawValue, names: [.en: "Mori Calliope", .ja: "森カリオペ"], inGeneration: Generation.enMyth),
    .kiara: Talent(id: TalentEnum.kiara.rawValue, names: [.en: "Takanashi Kiara", .ja: "小鳥遊キアラ"], inGeneration: Generation.enMyth),
    .ina: Talent(id: TalentEnum.ina.rawValue, names: [.en: "Ninomae Ina'nis", .ja: "一伊那尓栖"], inGeneration: Generation.enMyth),
    .gura: Talent(id: TalentEnum.gura.rawValue, names: [.en: "Gawr Gura", .ja: "がうる・ぐら"], inGeneration: Generation.enMyth),
    .ame: Talent(id: TalentEnum.ame.rawValue, names: [.en: "Watson Amelia", .ja: "ワトソン・アメリア"], inGeneration: Generation.enMyth),
    
    // MARK: - Project: HOPE
    .irys: Talent(id: TalentEnum.irys.rawValue, names: [.en: "IRyS", .ja: "アイリス"], inGeneration: Generation.projectHope),
    
    // MARK: - EN Council
    .ceres: Talent(id: TalentEnum.ceres.rawValue, names: [.en: "Ceres Fauna", .ja: "セレス・ファウナ"], inGeneration: Generation.enCouncil),
    .kronii: Talent(id: TalentEnum.kronii.rawValue, names: [.en: "Ouro Kronii", .ja: "オーロ・クロニー"], inGeneration: Generation.enCouncil),
    .mumei: Talent(id: TalentEnum.mumei.rawValue, names: [.en: "Nanashi Mumei", .ja: "七詩ムメイ"], inGeneration: Generation.enCouncil),
    .baelz: Talent(id: TalentEnum.baelz.rawValue, names: [.en: "Hakos Baelz", .ja: "ハコス・ベールズ"], inGeneration: Generation.enCouncil),
    
    // MARK: - holostars 1st gen
    .miyabi: Talent(id: TalentEnum.miyabi.rawValue, names: [.en: "Hanasaki Miyabi", .ja: "花咲みやび"], inGeneration: Generation.starsFirstGen),
    .izuru: Talent(id: TalentEnum.izuru.rawValue, names: [.en: "Kanade Izuru", .ja: "奏手イヅル"], inGeneration: Generation.starsFirstGen),
    .arurandeisu: Talent(id: TalentEnum.arurandeisu.rawValue, names: [.en: "Arurandeisu", .ja: "アルランディス"], inGeneration: Generation.starsFirstGen),
    .rikka: Talent(id: TalentEnum.rikka.rawValue, names: [.en: "Rikka", .ja: "律可"], inGeneration: Generation.starsFirstGen),
    
    // MARK: - holostars 2nd gen
    .astel: Talent(id: TalentEnum.astel.rawValue, names: [.en: "Astel Leda", .ja: "アステル・レダ"], inGeneration: Generation.starsSecondGen),
    .temma: Talent(id: TalentEnum.temma.rawValue, names: [.en: "Kishido Temma", .ja: "岸堂天真"], inGeneration: Generation.starsSecondGen),
    .roberu: Talent(id: TalentEnum.roberu.rawValue, names: [.en: "Yukoku Roberu", .ja: "夕刻ロベル"], inGeneration: Generation.starsSecondGen),
    
    // MARK: - holostars 3rd gen
    .shien: Talent(id: TalentEnum.shien.rawValue, names: [.en: "Kageyama Shien", .ja: "影山シエン"], inGeneration: Generation.starsThirdGen),
    .oga: Talent(id: TalentEnum.oga.rawValue, names: [.en: "Aragami Oga", .ja: "荒咬オウガ"], inGeneration: Generation.starsThirdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: Talent(id: TalentEnum.fuma.rawValue, names: [.en: "Yatogami Fuma", .ja: "夜十神封魔"], inGeneration: Generation.uproar),
    .uyu: Talent(id: TalentEnum.uyu.rawValue, names: [.en: "Utsugi Uyu", .ja: "羽継烏有"], inGeneration: Generation.uproar),
    .gamma: Talent(id: TalentEnum.gamma.rawValue, names: [.en: "Hizaki Gamma", .ja: "緋崎ガンマ"], inGeneration: Generation.uproar),
    .rio: Talent(id: TalentEnum.rio.rawValue, names: [.en: "Minase Rio", .ja: "水無世燐央"], inGeneration: Generation.uproar),
    
    // MARK: - holostars TEMPUS
    .altare: Talent(id: TalentEnum.altare.rawValue, names: [.en: "Regis Altare", .ja: "リージス・アルテア"], inGeneration: Generation.tempus),
    .vesper: Talent(id: TalentEnum.vesper.rawValue, names: [.en: "Noir Vesper", .ja: "ノワール・ヴェスパー"], inGeneration: Generation.tempus),
    .syrios: Talent(id: TalentEnum.syrios.rawValue, names: [.en: "Axel Syrios", .ja: "アクセル・シリオス"], inGeneration: Generation.tempus),
    .dezmond: Talent(id: TalentEnum.dezmond.rawValue, names: [.en: "Magni Dezmond", .ja: "マグニ・デズモンド"], inGeneration: Generation.tempus),
    
    // MARK: - Official Channels
    .hololive: Talent(id: TalentEnum.hololive.rawValue, names: [.en: "hololive", .ja: "ホロライブ"], inGeneration: Generation.hololiveOfficial),
    .hololiveEN: Talent(id: TalentEnum.hololiveEN.rawValue, names: [.en: "hololive English", .ja: "hololive English"], inGeneration: Generation.hololiveOfficial),
    .hololiveID: Talent(id: TalentEnum.hololiveID.rawValue, names: [.en: "hololive Indonesia", .ja: "hololive Indonesia"], inGeneration: Generation.hololiveOfficial),
    .holostars: Talent(id: TalentEnum.holostars.rawValue, names: [.en: "holostars", .ja: "ホロスターズ"], inGeneration: Generation.hololiveOfficial),
    .midnight: Talent(id: TalentEnum.midnight.rawValue, names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: Generation.hololiveOfficial),
    
    // MARK: - NIJISANJI First Generation
    .moira: Talent(id: TalentEnum.moira.rawValue, names: [.en: "Moira", .ja: "モイラ"], inGeneration: Generation.firstGen),
    .suzuya: Talent(id: TalentEnum.suzuya.rawValue, names: [.en: "Suzuya Aki", .ja: "鈴谷アキ"], inGeneration: Generation.firstGen),
    .shibuya: Talent(id: TalentEnum.shibuya.rawValue, names: [.en: "Shibuya Hajime", .ja: "渋谷ハジメ"], inGeneration: Generation.firstGen),
    .higuchi: Talent(id: TalentEnum.shibuya.rawValue, names: [.en: "Higuchi Kaede", .ja: "樋口楓"], inGeneration: Generation.firstGen),
    .tsukino: Talent(id: TalentEnum.tsukino.rawValue, names: [.en: "Tsukino Mito", .ja: "月ノ美兎"], inGeneration: Generation.firstGen),
    .yuuki: Talent(id: TalentEnum.yuuki.rawValue, names: [.en: "Yuuki Chihiro", .ja: "勇気ちひろ"], inGeneration: Generation.firstGen),
    .shizuka: Talent(id: TalentEnum.shizuka.rawValue, names: [.en: "Shizuka Rin", .ja: "静凛"], inGeneration: Generation.firstGen),
    .elu: Talent(id: TalentEnum.elu.rawValue, names: [.en: "Elu", .ja: "える"], inGeneration: Generation.firstGen),
    
    // MARK: - NIJISANJI Second Generation
    .ienaga: Talent(id: TalentEnum.ienaga.rawValue, names: [.en: "Ienaga Mugi", .ja: "家長むぎ"], inGeneration: Generation.secondGen),
    .yuuhi: Talent(id: TalentEnum.yuuhi.rawValue, names: [.en: "Yuuhi Riri", .ja: "夕陽リリ"], inGeneration: Generation.secondGen),
    .fushimi: Talent(id: TalentEnum.fushimi.rawValue, names: [.en: "Fushimi Gaku", .ja: "伏見ガク"], inGeneration: Generation.secondGen),
    .kenmochi: Talent(id: TalentEnum.kenmochi.rawValue, names: [.en: "Kenmochi Toya", .ja: "剣持刀也"], inGeneration: Generation.secondGen),
    .mononobe: Talent(id: TalentEnum.mononobe.rawValue, names: [.en: "Mononobe Alice", .ja: "物述有栖"], inGeneration: Generation.secondGen),
    .ushimi: Talent(id: TalentEnum.ushimi.rawValue, names: [.en: "Ushimi Ichigo", .ja: "宇志海いちご"], inGeneration: Generation.secondGen),
    .suzuka: Talent(id: TalentEnum.suzuka.rawValue, names: [.en: "Suzuka Utako", .ja: "鈴鹿詩子"], inGeneration: Generation.secondGen),
    .gilzaren: Talent(id: TalentEnum.gilzaren.rawValue, names: [.en: "Gilzaren III", .ja: "ギルザレンⅢ世"], inGeneration: Generation.secondGen),
    .fumino: Talent(id: TalentEnum.fumino.rawValue, names: [.en: "Fumino Tamaki", .ja: "文野環"], inGeneration: Generation.secondGen),
    .morinaka: Talent(id: TalentEnum.morinaka.rawValue, names: [.en: "Morinaka Kazaki", .ja: "森中花咲"], inGeneration: Generation.secondGen),
    
    // MARK: - NIJISANJI Gamers First Wave
    .kanae: Talent(id: TalentEnum.kanae.rawValue, names: [.en: "Kanae", .ja: "叶"], inGeneration: Generation.gamersFirstWave),
    .akabane: Talent(id: TalentEnum.akabane.rawValue, names: [.en: "Akabane Youko", .ja: "赤羽葉子"], inGeneration: Generation.gamersFirstWave),
    
    // MARK: - NIJISANJI Gamers Second Wave
    .sasaki: Talent(id: TalentEnum.sasaki.rawValue, names: [.en: "Sasaki Saku", .ja: "笹木咲"], inGeneration: Generation.gamersSecondWave),
    .honma: Talent(id: TalentEnum.honma.rawValue, names: [.en: "Honma Himawari", .ja: "本間ひまわり"], inGeneration: Generation.gamersSecondWave),
    
    // MARK: - NIJISANJI Gamers Third Wave
    .makaino: Talent(id: TalentEnum.makaino.rawValue, names: [.en: "Makaino Ririmu", .ja: "魔界ノりりむ"], inGeneration: Generation.gamersThirdWave),
    .kuzuha: Talent(id: TalentEnum.kuzuha.rawValue, names: [.en: "Kuzuha", .ja: "葛葉"], inGeneration: Generation.gamersThirdWave),
    .shiina: Talent(id: TalentEnum.shiina.rawValue, names: [.en: "Shiina Yuika", .ja: "椎名唯華"], inGeneration: Generation.gamersThirdWave),
    
    // MARK: - NIJISANJI SEEDs First Generation
    .dola: Talent(id: TalentEnum.dola.rawValue, names: [.en: "Dola", .ja: "ドーラ"], inGeneration: Generation.seedsFirstGen),
    .todoroki: Talent(id: TalentEnum.todoroki.rawValue, names: [.en: "Todoroki Kyoko", .ja: "轟京子"], inGeneration: Generation.seedsFirstGen),
    .sister: Talent(id: TalentEnum.sister.rawValue, names: [.en: "Sister Claire", .ja: "シスター・クレア"], inGeneration: Generation.seedsFirstGen),
    .hanabatake: Talent(id: TalentEnum.hanabatake.rawValue, names: [.en: "Hanabatake Chaika", .ja: "花畑チャイカ"], inGeneration: Generation.seedsFirstGen),
    .yashiro: Talent(id: TalentEnum.yashiro.rawValue, names: [.en: "Yashiro Kizuku", .ja: "社築"], inGeneration: Generation.seedsFirstGen),
    .azuchi: Talent(id: TalentEnum.azuchi.rawValue, names: [.en: "Azuchi Momo", .ja: "安土桃"], inGeneration: Generation.seedsFirstGen),
    .suzuki: Talent(id: TalentEnum.suzuki.rawValue, names: [.en: "Suzuki Masaru", .ja: "卯月コウ"], inGeneration: Generation.seedsFirstGen),
    .uzuki: Talent(id: TalentEnum.uzuki.rawValue, names: [.en: "Uzuki Kou", .ja: "鈴木勝"], inGeneration: Generation.seedsFirstGen),
    .ryushen: Talent(id: TalentEnum.ryushen.rawValue, names: [.en: "Ryushen", .ja: "緑仙"], inGeneration: Generation.seedsFirstGen),

    // MARK: - NIJISANJI SEEDs Second Generation First Wave
    .kanda: Talent(id: TalentEnum.kanda.rawValue, names: [.en: "Kanda Shoichi", .ja: "神田笑一"], inGeneration: Generation.seedsSecondGenFirstWave),
    .asuka: Talent(id: TalentEnum.asuka.rawValue, names: [.en: " Asuka Hina", .ja: "飛鳥ひな"], inGeneration: Generation.seedsSecondGenFirstWave),
    .harusaki: Talent(id: TalentEnum.harusaki.rawValue, names: [.en: "Harusaki Air", .ja: "春崎エアル"], inGeneration: Generation.seedsSecondGenFirstWave),
    .amemori: Talent(id: TalentEnum.amemori.rawValue, names: [.en: "Amemori Sayo", .ja: "雨森小夜"], inGeneration: Generation.seedsSecondGenFirstWave),
    .takamiya: Talent(id: TalentEnum.takamiya.rawValue, names: [.en: "Takamiya Rion", .ja: "鷹宮リオン"], inGeneration: Generation.seedsSecondGenFirstWave),
    .maimoto: Talent(id: TalentEnum.maimoto.rawValue, names: [.en: "Maimoto Keisuke", .ja: "舞元啓介"], inGeneration: Generation.seedsSecondGenFirstWave),

    // MARK: - NIJISANJI SEEDs Second Generation Second Wave
    .rindou: Talent(id: TalentEnum.rindou.rawValue, names: [.en: "Rindou Mikoto", .ja: "竜胆尊"], inGeneration: Generation.seedsSecondGenSecondWave),
    .debidebi: Talent(id: TalentEnum.debidebi.rawValue, names: [.en: "Debidebi Debiru", .ja: "でびでび・でびる"], inGeneration: Generation.seedsSecondGenSecondWave),
    .sakura: Talent(id: TalentEnum.sakura.rawValue, names: [.en: "Sakura Ritsuki", .ja: "桜凛月"], inGeneration: Generation.seedsSecondGenSecondWave),
    .machita: Talent(id: TalentEnum.machita.rawValue, names: [.en: "Machita Chima", .ja: "町田ちま"], inGeneration: Generation.seedsSecondGenSecondWave),
    .joe: Talent(id: TalentEnum.joe.rawValue, names: [.en: "Joe Rikiichi", .ja: "ジョー・力一"], inGeneration: Generation.seedsSecondGenSecondWave),

    // MARK: - NIJISANJI SEEDs Second Generation Third Wave
    .naruse: Talent(id: TalentEnum.naruse.rawValue, names: [.en: "Naruse Naru", .ja: "成瀬鳴"], inGeneration: Generation.seedsSecondGenThirdWave),
    .belmond: Talent(id: TalentEnum.belmond.rawValue, names: [.en: "Belmond Banderas", .ja: "ベルモンド・バンデラス"], inGeneration: Generation.seedsSecondGenThirdWave),
    .yaguruma: Talent(id: TalentEnum.yaguruma.rawValue, names: [.en: "Yaguruma Rine", .ja: "矢車りね"], inGeneration: Generation.seedsSecondGenThirdWave),
    .yumeoi: Talent(id: TalentEnum.yumeoi.rawValue, names: [.en: "Yumeoi Kakeru", .ja: "夢追翔"], inGeneration: Generation.seedsSecondGenThirdWave),
    .kuroi: Talent(id: TalentEnum.kuroi.rawValue, names: [.en: "Kuroi Shiba", .ja: "黒井しば"], inGeneration: Generation.seedsSecondGenThirdWave),

    // MARK: - 2019 Wave: Usa-chan club
    .gundo: Talent(id: TalentEnum.gundo.rawValue, names: [.en: "Gundo Mirei", .ja: "郡道美玲"], inGeneration: Generation.wave2019Usa),
    .yuzuki: Talent(id: TalentEnum.yuzuki.rawValue, names: [.en: "Yuzuki Roa", .ja: "夢月ロア"], inGeneration: Generation.wave2019Usa),

    // MARK: - 2019 Wave: January 28
    .onomachi: Talent(id: TalentEnum.onomachi.rawValue, names: [.en: "Onomachi Haruka", .ja: "小野町春香"], inGeneration: Generation.wave2019Jan28),
    .kataribe: Talent(id: TalentEnum.kataribe.rawValue, names: [.en: "Kataribe Tsumugu", .ja: "語部紡"], inGeneration: Generation.wave2019Jan28),
    .seto: Talent(id: TalentEnum.seto.rawValue, names: [.en: "Seto Miyako", .ja: "瀬戸美夜子"], inGeneration: Generation.wave2019Jan28),

    // MARK: - 2019 Wave: Sanbaka
    .inui: Talent(id: TalentEnum.inui.rawValue, names: [.en: "Inui Toko", .ja: "戌亥とこ"], inGeneration: Generation.wave2019Sanbaka),
    .ange: Talent(id: TalentEnum.ange.rawValue, names: [.en: "Ange Katrina", .ja: "アンジュ・カトリーナ"], inGeneration: Generation.wave2019Sanbaka),
    .lize: Talent(id: TalentEnum.lize.rawValue, names: [.en: "Lize Helesta", .ja: "リゼ・ヘルエスタ"], inGeneration: Generation.wave2019Sanbaka),

    // MARK: - 2019 Wave: Beni zuwaigani
    .saegusa: Talent(id: TalentEnum.saegusa.rawValue, names: [.en: "Saegusa Akina", .ja: "三枝明那"], inGeneration: Generation.wave2019Beni),
    .aizono: Talent(id: TalentEnum.aizono.rawValue, names: [.en: "Aizono Manami", .ja: "愛園愛美"], inGeneration: Generation.wave2019Beni),

    // MARK: - 2019 Wave: April 29
    .yukishiro: Talent(id: TalentEnum.yukishiro.rawValue, names: [.en: "Yukishiro Mahiro", .ja: "雪城眞尋"], inGeneration: Generation.wave2019Apr29),

    // MARK: - 2019 Wave: May 17
    .ex: Talent(id: TalentEnum.ex.rawValue, names: [.en: "Ex Albio", .ja: "エクス・アルビオ"], inGeneration: Generation.wave2019May17),
    .levi: Talent(id: TalentEnum.levi.rawValue, names: [.en: "Levi Elipha", .ja: "レヴィ・エリファ"], inGeneration: Generation.wave2019May17),

    // MARK: - 2019 Wave: June 19
    .hayama: Talent(id: TalentEnum.hayama.rawValue, names: [.en: "Hayama Marin", .ja: "葉山舞鈴"], inGeneration: Generation.wave2019Jun19),
    .nui: Talent(id: TalentEnum.nui.rawValue, names: [.en: "Nui Sociere", .ja: "ニュイ・ソシエール"], inGeneration: Generation.wave2019Jun19),

    // MARK: - 2019 Wave: SMC-gumi
    .hakase: Talent(id: TalentEnum.hakase.rawValue, names: [.en: "Hakase Fuyuki", .ja: "葉加瀬冬雪"], inGeneration: Generation.wave2019SMC),
    .kagami: Talent(id: TalentEnum.kagami.rawValue, names: [.en: "Kagami Hayato", .ja: "加賀美ハヤト"], inGeneration: Generation.wave2019SMC),
    .yorumi: Talent(id: TalentEnum.yorumi.rawValue, names: [.en: "Yorumi Rena", .ja: "夜見れな"], inGeneration: Generation.wave2019SMC),

    // MARK: - 2019 Wave: Blues
    .ars: Talent(id: TalentEnum.ars.rawValue, names: [.en: "Ars Almal", .ja: "アルス・アルマル"], inGeneration: Generation.wave2019Blues),
    .aiba: Talent(id: TalentEnum.aiba.rawValue, names: [.en: "Aiba Uiha", .ja: "相羽ういは"], inGeneration: Generation.wave2019Blues),

    // MARK: - 2019 Wave: Posanke
    .amamiya: Talent(id: TalentEnum.amamiya.rawValue, names: [.en: "Amamiya Kokoro", .ja: "天宮こころ"], inGeneration: Generation.wave2019Posanke),
    .eli: Talent(id: TalentEnum.eli.rawValue, names: [.en: "Eli Conifer", .ja: "エリー・コニファー"], inGeneration: Generation.wave2019Posanke),
    .ratna: Talent(id: TalentEnum.ratna.rawValue, names: [.en: "Ratna Petit", .ja: "ラトナ・プティ"], inGeneration: Generation.wave2019Posanke),
    .ratnaASMR: Talent(id: TalentEnum.ratnaASMR.rawValue, names: [.en: "Ratna Petit ASMR", .ja: "ラトナ・プティ ASMR"], inGeneration: Generation.wave2019Posanke),

    // MARK: - 2019 Wave: Tulip-gumi
    .hayase: Talent(id: TalentEnum.hayase.rawValue, names: [.en: "Hayase Sou", .ja: "早瀬走"], inGeneration: Generation.wave2019Tulip),
    .sukoya: Talent(id: TalentEnum.sukoya.rawValue, names: [.en: "Sukoya Kana", .ja: "健屋花那"], inGeneration: Generation.wave2019Tulip),
    .shellin: Talent(id: TalentEnum.shellin.rawValue, names: [.en: "Shellin Burgundy", .ja: "シェリン・バーガンディ"], inGeneration: Generation.wave2019Tulip),

    // MARK: - 2019 Wave: Orihimeboshi
    .fumi: Talent(id: TalentEnum.fumi.rawValue, names: [.en: "Fumi", .ja: "フミ"], inGeneration: Generation.wave2019Orihimeboshi),
    .hoshikawa: Talent(id: TalentEnum.hoshikawa.rawValue, names: [.en: "Hoshikawa Sara", .ja: "星川サラ"], inGeneration: Generation.wave2019Orihimeboshi),
    .yamagami: Talent(id: TalentEnum.yamagami.rawValue, names: [.en: "Yamagami Karuta", .ja: "山神カルタ"], inGeneration: Generation.wave2019Orihimeboshi),

    // MARK: - 2019 Wave: Aka no Soshiki
    .emmaAugust: Talent(id: TalentEnum.emmaAugust.rawValue, names: [.en: "Emma★August", .ja: "えま★おうがすと"], inGeneration: Generation.wave2019AkaNoSoshiki),
    .luis: Talent(id: TalentEnum.luis.rawValue, names: [.en: "Luis Cammy", .ja: "ルイス・キャミー"], inGeneration: Generation.wave2019AkaNoSoshiki),
    .matsukai: Talent(id: TalentEnum.matsukai.rawValue, names: [.en: "Matsukai Mao", .ja: "魔使マオ"], inGeneration: Generation.wave2019AkaNoSoshiki),

    // MARK: - 2019 Wave: Night Kingdom
    .fuwa: Talent(id: TalentEnum.fuwa.rawValue, names: [.en: "Fuwa Minato", .ja: "不破湊"], inGeneration: Generation.wave2019NightKingdom),
    .shirayuki: Talent(id: TalentEnum.shirayuki.rawValue, names: [.en: "Shirayuki Tomoe", .ja: "白雪巴"], inGeneration: Generation.wave2019NightKingdom),
    .gwelu: Talent(id: TalentEnum.gwelu.rawValue, names: [.en: "Gwelu Os Gar", .ja: "グウェル・オス・ガール"], inGeneration: Generation.wave2019NightKingdom),

    // MARK: - 2019 Wave: Mananatsu
    .mashiro: Talent(id: TalentEnum.mashiro.rawValue, names: [.en: "Mashiro Meme", .ja: "ましろ爻"], inGeneration: Generation.wave2019Mananatsu),
    .naraka: Talent(id: TalentEnum.naraka.rawValue, names: [.en: "Naraka", .ja: "奈羅花"], inGeneration: Generation.wave2019Mananatsu),
    .kurusu: Talent(id: TalentEnum.kurusu.rawValue, names: [.en: "Kurusu Natsume", .ja: "来栖夏芽"], inGeneration: Generation.wave2019Mananatsu),

    // MARK: - 2020 Wave: Meifu
    .furen: Talent(id: TalentEnum.furen.rawValue, names: [.en: "Furen E Lustario", .ja: "フレン・E・ルスタリオ"], inGeneration: Generation.wave2020Meifu),
    .ibrahim: Talent(id: TalentEnum.ibrahim.rawValue, names: [.en: "Ibrahim", .ja: "イブラヒム"], inGeneration: Generation.wave2020Meifu),

    // MARK: - 2020 Wave: VΔLZ
    .nagao: Talent(id: TalentEnum.nagao.rawValue, names: [.en: "Nagao Kei", .ja: "イブラヒム"], inGeneration: Generation.wave2020Valz),
    .genzuki: Talent(id: TalentEnum.genzuki.rawValue, names: [.en: "Genzuki Tojiro", .ja: "イブラヒム"], inGeneration: Generation.wave2020Valz),
    .kaida: Talent(id: TalentEnum.kaida.rawValue, names: [.en: "Kaida Haru", .ja: "イブラヒム"], inGeneration: Generation.wave2020Valz),

    // MARK: - 2020 Wave: June 30
    .sorahoshi: Talent(id: TalentEnum.sorahoshi.rawValue, names: [.en: "Sorahoshi Kirame", .ja: "空星きらめ"], inGeneration: Generation.wave2020Jun30),

    // MARK: - 2020 Wave: Sereine Jogakuin
    .asahina: Talent(id: TalentEnum.asahina.rawValue, names: [.en: "Asahina Akane", .ja: "朝日南アカネ"], inGeneration: Generation.wave2020SereineJogakuin),
    .suo: Talent(id: TalentEnum.suo.rawValue, names: [.en: "Suo Sango", .ja: "周央サンゴ"], inGeneration: Generation.wave2020SereineJogakuin),
    .todo: Talent(id: TalentEnum.todo.rawValue, names: [.en: "Todo Kohaku", .ja: "東堂コハク"], inGeneration: Generation.wave2020SereineJogakuin),
    .kitakoji: Talent(id: TalentEnum.kitakoji.rawValue, names: [.en: "Kitakoji Hisui", .ja: "北小路ヒスイ"], inGeneration: Generation.wave2020SereineJogakuin),
    .nishizono: Talent(id: TalentEnum.nishizono.rawValue, names: [.en: "Nishizono Chigusa", .ja: "西園チグサ"], inGeneration: Generation.wave2020SereineJogakuin),

    // MARK: - 2021 Wave
    .axia: Talent(id: TalentEnum.axia.rawValue, names: [.en: "Axia Krone", .ja: "アクシア・クローネ"], inGeneration: Generation.wave2021),
    .lauren: Talent(id: TalentEnum.lauren.rawValue, names: [.en: "Lauren Iroas", .ja: "ローレン・イロアス"], inGeneration: Generation.wave2021),
    .leos: Talent(id: TalentEnum.leos.rawValue, names: [.en: "Leos Vincent", .ja: "レオス・ヴィンセント"], inGeneration: Generation.wave2021),
    .oliver: Talent(id: TalentEnum.oliver.rawValue, names: [.en: "Oliver Evans", .ja: "オリバー・エバンス"], inGeneration: Generation.wave2021),
    .lain: Talent(id: TalentEnum.lain.rawValue, names: [.en: "Lain Paterson", .ja: "レイン・パターソン"], inGeneration: Generation.wave2021),

    // MARK: - 2022 Wave: Ranunculus
    .amagase: Talent(id: TalentEnum.amagase.rawValue, names: [.en: "Amagase Muyu", .ja: "天ヶ瀬むゆ"], inGeneration: Generation.wave2022Ranunculus),
    .ponto: Talent(id: TalentEnum.ponto.rawValue, names: [.en: "Ponto Nei", .ja: "先斗寧"], inGeneration: Generation.wave2022Ranunculus),
    .umise: Talent(id: TalentEnum.umise.rawValue, names: [.en: "Umise Yotsuh", .ja: "海妹四葉"], inGeneration: Generation.wave2022Ranunculus),

    // MARK: - 2022 Wave: May 21
    .hyakumantenbara: Talent(id: TalentEnum.hyakumantenbara.rawValue, names: [.en: "Hyakumantenbara Salome", .ja: "壱百満天原サロメ"], inGeneration: Generation.wave2022May21),

    // MARK: - 2022 Wave: VOLTACTION
    .fura: Talent(id: TalentEnum.fura.rawValue, names: [.en: "Fura Kanato", .ja: "風楽奏斗"], inGeneration: Generation.wave2022Voltaction),
    .watarai: Talent(id: TalentEnum.watarai.rawValue, names: [.en: "Watarai Hibari", .ja: "渡会雲雀"], inGeneration: Generation.wave2022Voltaction),
    .shikinagi: Talent(id: TalentEnum.shikinagi.rawValue, names: [.en: "Shikinagi Akira", .ja: "四季凪アキラ"], inGeneration: Generation.wave2022Voltaction),
    .seraph: Talent(id: TalentEnum.seraph.rawValue, names: [.en: "Seraph Dazzlegarden", .ja: "セラフ・ダズルガーデン"], inGeneration: Generation.wave2022Voltaction),

    // MARK: - ID First Wave: 3setBBQ
    .taka: Talent(id: TalentEnum.taka.rawValue, names: [.en: "Taka Radjiman", .ja: "タカ ラジマン"], inGeneration: Generation.id1stWave),
    .zea: Talent(id: TalentEnum.zea.rawValue, names: [.en: "ZEA Cornelia", .ja: "ゼア コルネリア"], inGeneration: Generation.id1stWave),
    .hana: Talent(id: TalentEnum.hana.rawValue, names: [.en: "Hana Macchia", .ja: "ハナ マキア"], inGeneration: Generation.id1stWave),

    // MARK: - ID Second Wave: CloverMcOver
    .rai: Talent(id: TalentEnum.rai.rawValue, names: [.en: "Rai Galilei", .ja: "ライ ガリレイ"], inGeneration: Generation.id2ndWave),
    .amicia: Talent(id: TalentEnum.amicia.rawValue, names: [.en: "Amicia Michella", .ja: "アミシア ミシェラ"], inGeneration: Generation.id2ndWave),
    .miyu: Talent(id: TalentEnum.miyu.rawValue, names: [.en: "Miyu Ottavia", .ja: "ミユ オッタフィア"], inGeneration: Generation.id2ndWave),
    .riksa: Talent(id: TalentEnum.riksa.rawValue, names: [.en: "Riksa Dhirendra", .ja: "リクサ ディレンドラ"], inGeneration: Generation.id2ndWave),
]

let talentsByGeneration: OrderedDictionary<Generation, GenerationGroup> = [
    .hololiveZerothGen: GenerationGroup(id: .hololiveZerothGen, names: [.en: "0th gen", .ja: "0期生"], members: [.sora, .roboco, .azki, .miko, .suisei]),
    .hololiveFirstGen: GenerationGroup(id: .hololiveFirstGen, names: [.en: "1st gen", .ja: "1期生"], members: [.mel, .aki, .haato, .fubuki, .matsuri]),
    .hololiveSecondGen: GenerationGroup(id: .hololiveSecondGen, names: [.en: "2nd gen", .ja: "2期生"], members: [.aqua, .shion, .ayame, .choco, .subaru]),
    .gamers: GenerationGroup(id: .gamers, names: [.en: "Gamers", .ja: "ゲーマーズ"], members: [.mio, .okayu, .korone]),
    .thirdGen: GenerationGroup(id: .thirdGen, names: [.en: "3rd gen", .ja: "3期生"], members: [.pekora, .flare, .noel, .marine]),
    .forthGen: GenerationGroup(id: .forthGen, names: [.en: "4th gen", .ja: "4期生"], members: [.kanata, .watame, .towa, .luna]),
    .fifthGen: GenerationGroup(id: .fifthGen, names: [.en: "5th gen", .ja: "5期生"], members: [.lamy, .nene, .botan, .polka]),
    .holox: GenerationGroup(id: .holox, names: [.en: "holoX", .ja: "秘密結社holoX"], members: [.laplus, .lui, .koyori, .chloe, .iroha]),
    .idFirstGen: GenerationGroup(id: .idFirstGen, names: [.en: "ID 1st gen", .ja: "ID 1期生"], members: [.risu, .moona, .iofi]),
    .idSecondGen: GenerationGroup(id: .idSecondGen, names: [.en: "ID 2nd gen", .ja: "ID 2期生"], members: [.ollie, .anya, .reine]),
    .idThirdGen: GenerationGroup(id: .idThirdGen, names: [.en: "ID 3rd gen", .ja: "ID 3期生"], members: [.zeta, .kaela, .kobo]),
    .enMyth: GenerationGroup(id: .enMyth, names: [.en: "hololive English -Myth-", .ja: "hololive English -Myth-"], members: [.mori, .kiara, .ina, .gura, .ame]),
    .projectHope: GenerationGroup(id: .projectHope, names: [.en: "Project: HOPE", .ja: "Project: HOPE"], members: [.irys]),
    .enCouncil: GenerationGroup(id: .enCouncil, names: [.en: "hololive English -Council-", .ja: "hololive English -議会-"], members: [.ceres, .kronii, .mumei, .baelz]),
    .starsFirstGen: GenerationGroup(id: .starsFirstGen, names: [.en: "holostars 1st gen", .ja: "ホロスターズ 1期生"], members: [.miyabi, .izuru, .arurandeisu, .rikka]),
    .starsSecondGen: GenerationGroup(id: .starsSecondGen, names: [.en: "holostars 2nd gen", .ja: "ホロスターズ 2期生"], members: [.astel, .temma, .roberu]),
    .starsThirdGen: GenerationGroup(id: .starsThirdGen, names: [.en: "holostars 3nd gen", .ja: "ホロスターズ 3期生"], members: [.shien, .oga]),
    .uproar: GenerationGroup(id: .uproar, names: [.en: "holostars UPROAR!!", .ja: "ホロスターズ アップロー!!"], members: [.fuma, .uyu, .gamma, .rio]),
    .tempus: GenerationGroup(id: .tempus, names: [.en: "HOLOSTARS English -TEMPUS-", .ja: "HOLOSTARS English -TEMPUS-"], members: [.altare, .dezmond, .syrios, .vesper]),
    .hololiveOfficial: GenerationGroup(id: .hololiveOfficial, names: [.en: "Official Channels", .ja: "公式チャンネル"], members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight])
]
