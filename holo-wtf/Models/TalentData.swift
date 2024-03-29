//
//  Talents.swift
//  holo-wtf
//
//
//

// swiftlint:disable type_body_length file_length

import Foundation
import OrderedCollections

enum Generation: Int, CaseIterable, Codable, Hashable {
    // MARK: - Hololive
    case hololive0thGen
    case hololive1stGen
    case hololive2ndGen
    case gamers
    case hololive3rdGen
    case hololive4thGen
    case hololive5thGen
    case holox
    case id1stGen
    case id2ndGen
    case id3rdGen
    case enMyth
    case enPromise
    case enAdvent
    case devIsReGloss
    case stars1stGen
    case stars2ndGen
    case stars3rdGen
    case uproar
    case tempus
    case armis
    case hololiveOfficial
    
    // MARK: - Nijisanji
    case nijisanji1stGen
    case nijisanji2ndGen
    case gamers1stWave
    case gamers2ndWave
    case gamers3rdWave
    case seeds1stGen
    case seeds2ndGen1stWave
    case seeds2ndGen2ndWave
    case seeds2ndGen3rdWave
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
    case wave2023Jan16
    case wave2023Mar30
    case wave2023Apr26
    case wave2023Nov21
    case id1stWave
    case id2ndWave
    case id3rdWave
    case id4thWave
    case id5thWave
    case kr1stWave
    case kr2ndWave
    case kr3rdWave
    case kr4thWave
    case kr5thWave
    case kr6thWave
    case en1stWave
    case en2ndWave
    case en3rdWave
    case en4thWave
    case en5thWave
    case en6thWave
    case en7thWave
    case en8thWave
    case en9thWave
    case nijisanjiOfficial
    
    // MARK: - Re:AcT
    case reAliz
    case kaleidscope
    case sinkirow
    case parfait
    case reMixx
    case reactOfficial
    
    // MARK: - 774 inc.
    case nanashiInc
    case nanashiOfficial
    
    // MARK: - Nori Pro
    case noriProSolo
    case noriPro1stGen
    case noriProGamers
    
    // MARK: - Vspo
    case lupinus
    case iris
    case cattleya
    case vspo
    case vspoOfficial
    
    // For all the channels that we may not recognize
    case other
    
    func getLocalizedName() -> String {
        return talentsByGeneration[self]!.localizedName
    }
    
    func getAltLocalizedName() -> String {
        return talentsByGeneration[self]!.altLocalizedName
    }
    
    func getGeneration() -> GenerationGroup {
        return talentsByGeneration[self]!
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
    
    // MARK: - EN Promise
    case irys = "UC8rcEBzJSleTkf_-agPM20g"
    case ceres = "UCO_aKKYxn4tvrqPjcTzZ6EQ"
    case kronii = "UCmbs8T6MWqUHP1tIQvSgKrg"
    case mumei = "UC3n5uGu18FoCy23ggWWp8tA"
    case baelz = "UCgmPnx-EEeOrZSg5Tiw7ZRQ"
    // MARK: - EN Advent
    case shiori = "UCgnfPPb9JI3e9A4cXHnWbyg"
    case koseki = "UC9p_lqQ0FEDz327Vgf5JwqA"
    case nerissa = "UC_sFNM0z0MWm9A6WlKPuMMg"
    case fuwamoco = "UCt9H_RpQzhxzlyBxFqrdHqA"
    // MARK: - DEV_IS ReGLOSS
    case hiodoshi = "UCMGfV7TVTmHhEErVJg1oHBQ"
    case otonose = "UCWQtYtq9EOB4-I5P-3fh8lA"
    case ichijou = "UCtyWhCj3AqKh2dXctLkDtng"
    case juufuutei = "UCdXAk5MpyLD8594lm_OvtGQ"
    case hajime = "UC1iA6_NT4mtAcIII6ygrvCw"
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
    case syrios = "UC2hx0xVkMoHGWijwr_lA01w"
    case gavis = "UCHP4f7G2dWD4qib7BMatGAw"
    case machina = "UC060r4zABV18vcahAWR1n7w"
    case banzoin = "UC7gxU6NXjKF1LrgOddPzgTw"
    case josuiji = "UCMqGG8BRAiI1lJfKOpETM_w"
    // MARK: - holostars English -ARMIS-
    case rexford = "UCTVSOgYuSWmNAt-lnJPkEEw"
    case goldbullet = "UCJv02SHZgav7Mv3V0kBOR8Q"
    case octavio = "UCLk1hcmxg8rJ3Nm1_GvxTRA"
    case ruze = "UCajbFh6e_R8QZdHAMbbi4rQ"
    // MARK: - Official Channels
    case hololive = "UCJFZiqLMntJufDCHc6bQixg"
    case hololiveEN = "UCotXwY6s8pWmuWd_snKYjhg"
    case hololiveID = "UCfrWoRGlawPQDQxxeIDRP0Q"
    case holostars = "UCWsfcksUUpoEvhia0_ut0bA"
    case midnight = "UCnVbtCwr-5LXxUlGxsgD7sQ"
    case holostarsEN = "UCJxZpzx4wHzEYD-eCiZPikg"
    
    // MARK: - Nijisanji
    // MARK: - NIJISANJI First Generation
    case moira = "UCvmppcdYf4HOv-tFQhHHJMA"
    case suzuya = "UCpnvhOIJ6BN-vPkYU9ls-Eg" // Suzuya Aki
    case shibuya = "UCeK9HFcRZoTrvqcUCtccMoQ" // Shibuya Hajime
    case higuchi = "UCsg-YqdqQ-KFF0LNk23BY4A" // Higuchi Kaede
    case tsukino = "UCD-miitqNY3nyukJ4Fnf4_A" // Tsukino Mito
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
    case suzuki = "UCryOPk2GZ1meIDt53tL30Tw" // Suzuki Masaru
    case uzuki = "UC3lNFeJiTq6L3UWoz4g1e-A" // Uzuki Kou
    case ryushen = "UCt5-0i4AVHXaWJrL8Wql3mw" // Ryushen
    case ryushenGaming = "UCTi_rzf5QIkXjhJjkbcAdTg"
    
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
    case yuzuki = "UCCVwhI5trmaSxfcze_Ovzfw" // Yuzuki Roa

    // MARK: - 2019 Wave: January 28
    case onomachi = "UCg63a3lk6PNeWhVvMRM_mrQ" // Onomachi Haruka
    case onomachiASMR = "UCSUZugdxy9Wcrkp781cFt1w"
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
    
    // MARK: - 2023 Wave: Jan 13
    case koshimizu = "UCUP8TmlO7NNra88AMqGU_vQ"
    case shishido = "UCWRPqA0ehhWV4Hnp27PJCkQ"
    case kaburaiki = "UClrQ7xhRBxS_v_-WuudGKmA"
    case igarashi = "UCu-rV2gPtJ-CsGxe71z_BrQ"
    case ishigami = "UCtLfA_qUqCJtjXJM2ZR_keg"
    case sophia = "UCivwPlOp0ojnMPZj5pNOPPA"
    case kuramochi = "UCiA-trSZfB0i92V_-dyDqBw"
    
    // MARK: - 2023 Wave: Mar 30
    case ittetsu = "UCy8P3o5XlMpJGQY4WugzdNA"
    case wen = "UC1vawzfbCnRpHT9SJ5pHlHw"
    case rito = "UCambvP8yxNDot4FzQc9cgiw"
    case mana = "UCqXxS-9x9Ha_UiH6hG4kh5Q"
    
    // MARK: 2023 Wave: Apr 26
    case sho = "UCgZ0pH7j6c9z-pkOG3PYw1Q"
    case kagetsu = "UChdY64fJb14Nfnbs8EGdQig"
    case rou = "UC6WFKwYptsxVue56Lx218vg"
    case raiInami = "UCz89MGFBrAqwJ5xMr5weSuA"
    
    // MARK: 2023 Wave: Nov 21
    case totoTachitsute = "UCnbJ8LTbHrsRgqkxwJXCU8w"
    case ruri = "UC7_MFM9b8hp5kuTSpa8WyOQ"
    case kestrel = "UCFtyinR2ZdvKK_Xgy07qXUg"
    
    // MARK: - ID First Wave: 3setBBQ
    case hana = "UCpJtk0myFr5WnyfsmnInP-w" // Hana Macchia
    
    // MARK: - ID Second Wave: CloverMcOver
    case rai = "UC8Snw5i4eOJXEQqURAK17hQ" // Rai Galilei
    case riksa = "UCkL9OLKjIQbKk2CztbpOCFg" // Riksa Dhirendra
    
    // MARK: - ID Third Wave: LAN_NEE3S
    case layla = "UCyRkQSuhJILuGOuXk10voPg" // Layla Alstroemeria
    
    // MARK: - ID Fourth Wave: 3FicLite
    case etna = "UCjFu-9GHnabzSFRAYm1B9Dw" // Etna Crimson
    case bonnivier = "UCHjeZylSgXDSnor8wUnwU_g" // Bonnivier Pranaja
    
    // MARK: - ID Fifth Wave: 53renade
    case nagisa = "UCijNnZ-6m8g85UGaRAWuw7g" // Nagisa Arcinia
    case derem = "UCMzVa7B8UEdrvUGsPmSgyjA" // Derem Kado
    case reza = "UC5yckZliCkuaEFbqzLBD7hQ" // Reza Avanluna
    
    // MARK: - KR First Wave
    case minSuha = "UCUtKkGKef8BYMs3h-3zQm9A"
    case gaon = "UCpRXCTyNNa-MnjhK6gisnRw"
    
    // MARK: - KR Second Wave
    case soNagi = "UC5ek2GWKvUKFgnKSHuuCFrw"
    
    // MARK: - KR Third Wave
    case akiraRay = "UC7hffDQLKIEG-_zoAQkMIvg"
    case leeRoha = "UCClwIqTUn5LDpFucHyaAhHg"
    
    // MARK: - KR Fourth Wave
    case yangNari = "UCCHH0nWYXFZmtDS_4tvMxHQ"
    case ryuHari = "UClS6k3w1sPwlVFqK3-yID5A"
    case ohJiyu = "UCnzZmBOSrQf2wDBbnsDajVw"
    
    // MARK: - KR Fifth Wave
    case seffyna = "UCeGendL8CO5RkffB6IFwHow"
    case banHada = "UCLjx3lqIkYkPCBJop8czJ2A"
    
    // MARK: - KR Sixth Wave
    case haYun = "UCrhhJPNsOqzNIkUfTABoSpg"
    case naSera = "UCX88Pe54pxbJDSGIyGrzNdg"
    
    // MARK: - EN First Wave: LazuLight
    case elira = "UCIeSUTOTkF9Hs7q3SGcO-Ow" // Elira Pendora
    case finana = "UCu-J8uIXuLZh16gG-cT1naw" // Finana Ryugu
    
    // MARK: - EN Second Wave: OBSYDIA
    case rosemi = "UC4WvIIAo89_AzGUh1AZ6Dkg" // Rosemi Lovelock
    case petra = "UCgA2jKRkqpY_8eysPUs8sjw" // Petra Gurin
    
    // MARK: - EN Third Wave: Ethyria
    case millie = "UC47rNmkDcNgbOcM-2BwzJTQ" // Millie Parfait
    case enna = "UCR6qhsLpn62WVxCBK1dkLow" // Enna Alouette
    case reimu = "UCBURM8S4LH7cRZ0Clea9RDA" // Reimu Endou
    
    // MARK: - EN Fourth Wave: Luxiem
    case luca = "UC7Gb7Uawe20QyFibhLl1lzA" // Luca Kaneshiro
    case shu = "UCG0rzBZV_QMP4MtWg6IjhEA" // Shu Yamino
    case ike = "UC4yNIKGvy-YUrwYupVdLDXA" // Ike Eveland
    case vox = "UCckdfYDGrjojJM28n5SHYrA" // Vox Akuma
    
    // MARK: - EN Fifth Wave: Noctyx
    case sonny = "UCuuAb_72QzK0M1USPMEl1yw" // Sonny Brisko
    case uki = "UChJ5FTsHOu72_5OVx0rvsvQ" // Uki Violeta
    case alban = "UCQ1zGxHrfEmmW4CPpBx9-qw" // Alban Knox
    case fulgur = "UCGhqxhovNfaPBpxfCruy9EA" // Fulgur Ovid
    
    // MARK: - EN Sixth Wave: ILUNA
    case maria = "UCwaS8_S7kMiKA3izlTWHbQg" // Maria Marionette
    case aster = "UCpzxZW5kghGnO5TmAFJQAVw" // Aster Arcadia
    case aia = "UCN68LoM3khS4gdBMiWJO8WA" // Aia Amare
    case ren = "UCKu59gTZ_rdEmerdx5rV4Yg" // Ren Zotto
    case scarle = "UCFgXWZOUZA2oYHNr6qDmsTQ" // Scarle Yonaguni
    
    // MARK: - EN Seventh Wave: XSOLEIL
    case doppio = "UCy91xBlY_Brh3bnHxKtjrrg"
    case meloco = "UChKXd7oqD18qiIYBoRIHTlw"
    case hex = "UCz_ZRw6ak4Foy8zZy0kEprQ"
    case kotoka = "UCggO2c1unS-oLwTLT0ICywg"
    case ver = "UCO8WcDsF5znr-qsXlzZNpqg"
    
    // MARK: - EN Eighth Wave: Krisis
    case wilson = "UCKpKC3M5fkcEvtOr06dmYlA"
    case bringer = "UCpYf6C9QsP_BRf97vLuXlIA"
    case bandage = "UCK9l6rTwU3hiSZijIMq51Gw"
    
    // MARK: - EN October 2023
    case clawmark = "UCdh-YF2gTzqDNu0VU9lwPPw"
    case brightshield = "UChTA8kHyInr2rKZ2aBv5ULw"
    case nakasato = "UCwqtK-m6954_aHEvOYtZpyQ"
    
    // MARK: - Official/Other Channels
    case nijisanji = "UCX7YkU9nEeaoZbkVLVajcMg" // Nijisanji
    case nijisanjiID = "UCbLgcjfsUaCUgJh9SVit8kw" // NIJISANJI ID Official
    case nijisanjiEN = "UC-JSeFfovhNsEhftt1WHMvg"
    case virtual = "UC4Jyg9gFStHO8r5n4ya7XCQ" // Virtual Talent Academy
    case voltacation = "UCNRh9kkByBTYLo0IJupnAug"
    case luxiem = "UCtHFXfrn52juTqGBN4WbMVw" // Luxiem Channel
    case rofmao = "UCwi4P78SVunSYAGrvC9aKcw" 
    case nornis = "UCxWcO9CLti4uouUIS5IIF-Q"
    case chronoir = "UCz6vnIbgiqFT9xUcD6Bp65Q"
    
    // MARK: - Re:AcT
    
    // MARK: - ReAliz
    case leona = "UCB1s_IdO-r0nUkY2mXeti-A"
    case mia = "UCpPuEfqwYbpn7e2jWdQeWew"
    case rose = "UCVbRXkQP-LumaBzfw-wsrrg"
    case lisa = "UCDrG8pzkq_cCCLcN5wgrzNw"
    
    // MARK: - kaleidscope
    case yuno = "UCJQMHCFjVZOVRYafR6gY04Q"
    case hanabasami = "UC4OeUf_KfYRrwksschtRYow"
    // case mari = "UCfiK42sBHraMBK6eNWtsy7A"
    case suu = "UCeqIMtLuGc3YgwkhEaG8oDg"
    
    // MARK: - sinkirow
    case tsukimi = "UCTEZGNJDqv-isWSPRsEhnRA"
    case yukino = "UCoFEbNyIRUS26-hf2AucwFw"
    case lie = "UCxLgvntienV0kwNLxrbcmyQ"
    
    // MARK: - Parfait
    case kanau = "UC8jskpQfW9fn2NLK3PdaGdg"
    case hano = "UCxJ9SJLG7dA00M7VoEe4ltw"
    case aria = "UC5XQhzMH08PgWa4Zp02Gcsw"
    
    // MARK: - Re:Mixx
    case creil = "UCIueYPQm6sk8oaKxq0hSjyQ"
    case nemu = "UCi6nuuHhOj_usxkjlcHdRXw"
    case taran = "UCShDuyxe-cDewxtcPbBmi_Q"
    
    // MARK: - Official
    case reactOfficial = "UC90vyzmRgWCE17-uWNsKW2Q"
    
    // MARK: - 774
    case haneru = "UC0Owc36U9lOyi9Gx9Ic-4qg"
    case ran = "UCRvpMpzAXBRKJQuk-8-Sdvg"
    case kuku = "UCXp7sNC0F_qkjickvlYkg-Q"
    case izumi = "UCW8WKciBixmaqaGqrlTITRQ"
    case rui = "UC_WOBIopwUih0rytRnr_1Ag"
    case hikari = "UCFsWaTQ7kT76jNNGeGIKNSA"
    case chiroru = "UCqskJ0nmw-_eweWfsKvbrzQ"
    case konanMia = "UC4PrHgUcAtOoj_LKmUL-uLQ"
    case sekishiroMiko = "UCDh2bWI5EDu7PavqwICkVpA"
    case charlotte = "UCYTz3uIgwVY3ZU-IQJS8r3A"
    case mary = "UCwePpiw1ocZRSNSkpKvVISw"
    case chris = "UC--A2dwZW7-M2kID0N6_lfA"
    case rin = "UC2hc-00y-MSR6eYA4eQ4tjQ"
    case mei = "UCRY0-zJ1pV4EiKUSLXCXTAg"
    case tier = "UCrt4cTM_sWH0iySLMkwwYLQ"
    case nemo = "UCBJ6nejlzes6mm9UruaxQsA"
    case kanna = "UCkpqb53xiOvOgNYEbNpFSyw"
    case sei = "UCBxw5bdrbKO7E60E4s3KgQg"
    case kiki = "UC3MBUvkVTI9p-p0be7y7TQA"
    case popo = "UC_hjHmi-ODGhHlSzD16p5Pw"
    case yuri = "UCGyywYAJd2O5Y7yUyr7qBRQ"
    case ichika = "UC2kyQhzGOB-JPgcQX9OMgEw"
    case anna = "UCvPPBoTOor5gm8zSlE2tg4w"
    case yuge = "UC3EhsuKdEkI99TWZwZgWutg"
    case kanon = "UCmqrvfLMws-GLGHQcB5dasg"
    case annko = "UChXm-xAYPfygrbyLo2yCASQ"
    case amaui = "UCW98GVLrx8lG_ddOts3cl4g"
    case uruuIna = "UCxCdPRbi-s5J74A6KgkxnQg"
    case mashu = "UCBhfuPYgo5ALbn6WmTXwHwg"
    
    // MARK: - 774inc official
    case nanashiOfficial = "UCJEpkwwDiTKS5lxwFttEbIQ"
    
    // MARK: - Nori Pro Solo
    case tamaki = "UC8NZiqKx6fsDT3AVcMiVFyA"
    
    // MARK: - Nori Pro 1st gen
    case mishiro = "UCC0i9nECi4Gz7TU63xZwodg"
    case miruku = "UCJCzy0Fyrm0UhIrGQ7tHpjg"
    case takuma = "UCCXME7oZmXB2VFHJbz5496A"
    case yuzuru = "UCle1cz6rcyH0a-xoMYwLlAg"
    
    // MARK: - Nori Pro Gamers
    case inariIroha = "UCWIPfdcux1WxuX5yZLPJDww"
    case lionheart = "UCuycJ_IsA5ESbTYhe05ozqQ"
    case shin = "UCMxIxoMdtcLkZ1wTq7qjztg"
    
    // MARK: - Vspo Lupinus Virtual Games
    case uruha = "UC5LyYg6cCA4yHEYvtUsir3g"
    case toto = "UCgTzsBI0DIRopMylJEDqnog"
    case sumire = "UCyLGcqYs7RsBb3L0SJfzGYA"
    case nazuna = "UCiMG6VdScBabPhJ1ZtaVmbw"
    
    // MARK: - Vspo Iris Black Games
    case noa = "UCIcAj6WkJ8vZ7DeJVgmeqKw"
    case hinano = "UCvUc0m317LWTTPZoBQV479A"
    case renKisaragi = "UCGWa1dMU_sDCaRQjdabsVgg"
    
    // MARK: - Cattleya Regina Games
    case mimi = "UCnvVG9RbOW3J6Ifqo-zKLiw"
    case sena = "UCF_U2GCKHvDz52jWdizppIA"
    case risa = "UCurEA8YoqFwimJcAuSHU0MQ"
    
    // MARK: - Vspo
    case qpi = "UCMp55EbT_ZlqiMS3lCj01BQ"
    case beni = "UCjXBuHmWkieBApgBhDuJMMQ"
    case ema = "UCPkKpOHxEDcwmUAnRpIu-Ng"
    case runa = "UCD5W21JqNMv_tV9nfjvF9sw"
    case tsuna = "UCIjdfjcSaEgdjwbgjxC3ZWg"
    case ramune = "UC61OwuYOVuKkpKnid-43Twg"
    case met = "UCzUNASdzI4PV5SlqtYwAkKQ"
    case yumenoAkari = "UCS5l_Y0oMVTjEos2LuyeSZQ"
    case kuromu = "UCX4WL24YEOUYd7qDsFSLDOw"
    
    // MARK: - Vspo Official Channel
    case vspoOfficial = "UCuI5XaO-6VkOEhHao6ij7JA"
}

extension TalentEnum: Identifiable {
    var id: String { rawValue }
}

let talentEnumToTalent: [TalentEnum: Talent] = [
    // MARK: - 0th gen
    .sora: Talent(id: TalentEnum.sora.rawValue, names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: Generation.hololive0thGen),
    .roboco: Talent(id: TalentEnum.roboco.rawValue, names: [.en: "Robocosan", .ja: "ロボ子さん"], inGeneration: Generation.hololive0thGen),
    .azki: Talent(id: TalentEnum.azki.rawValue, names: [.en: "AZKi", .ja: "AZKi"], inGeneration: Generation.hololive0thGen),
    .miko: Talent(id: TalentEnum.miko.rawValue, names: [.en: "Sakura Miko", .ja: "さくらみこ"], inGeneration: Generation.hololive0thGen),
    .suisei: Talent(id: TalentEnum.suisei.rawValue, names: [.en: "Hoshimachi Suisei", .ja: "星街すいせい"], inGeneration: Generation.hololive0thGen),
    
    // MARK: - 1st gen
    .mel: Talent(id: TalentEnum.mel.rawValue, names: [.en: "Yozora Mel", .ja: "夜空メル"], inGeneration: Generation.hololive1stGen),
    .aki: Talent(id: TalentEnum.aki.rawValue, names: [.en: "Aki Rosenthal", .ja: "アキ・ローゼンタール"], inGeneration: Generation.hololive1stGen),
    .haato: Talent(id: TalentEnum.haato.rawValue, names: [.en: "Akai Haato", .ja: "赤井はあと"], inGeneration: Generation.hololive1stGen),
    .fubuki: Talent(id: TalentEnum.fubuki.rawValue, names: [.en: "Shirakami Fubuki", .ja: "白上フブキ"], inGeneration: Generation.hololive1stGen),
    .matsuri: Talent(id: TalentEnum.matsuri.rawValue, names: [.en: "Natsuiro Matsuri", .ja: "夏色まつり"], inGeneration: Generation.hololive1stGen),
    
    // MARK: - 2nd gen
    .aqua: Talent(id: TalentEnum.aqua.rawValue, names: [.en: "Minato Aqua", .ja: "湊あくあ"], inGeneration: Generation.hololive2ndGen),
    .shion: Talent(id: TalentEnum.shion.rawValue, names: [.en: "Murasaki Shion", .ja: "紫咲シオン"], inGeneration: Generation.hololive2ndGen),
    .ayame: Talent(id: TalentEnum.ayame.rawValue, names: [.en: "Nakiri Ayame", .ja: "百鬼あやめ"], inGeneration: Generation.hololive2ndGen),
    .choco: Talent(id: TalentEnum.choco.rawValue, names: [.en: "Yuzuki Choco", .ja: "癒月ちょこ"], inGeneration: Generation.hololive2ndGen),
    .subaru: Talent(id: TalentEnum.subaru.rawValue, names: [.en: "Oozora Subaru", .ja: "大空スバル"], inGeneration: Generation.hololive2ndGen),
    
    // MARK: - Gamers
    .mio: Talent(id: TalentEnum.mio.rawValue, names: [.en: "Ookami Mio", .ja: "大神ミオ"], inGeneration: Generation.gamers),
    .okayu: Talent(id: TalentEnum.okayu.rawValue, names: [.en: "Nekomata Okayu", .ja: "猫又おかゆ"], inGeneration: Generation.gamers),
    .korone: Talent(id: TalentEnum.korone.rawValue, names: [.en: "Inugami Korone", .ja: "戌神ころね"], inGeneration: Generation.gamers),
    
    // MARK: - 3rd gen
    .pekora: Talent(id: TalentEnum.pekora.rawValue, names: [.en: "Usada Pekora", .ja: "兎田ぺこら"], inGeneration: Generation.hololive3rdGen),
    .flare: Talent(id: TalentEnum.flare.rawValue, names: [.en: "Shiranui Flare", .ja: "不知火フレア"], inGeneration: Generation.hololive3rdGen),
    .noel: Talent(id: TalentEnum.noel.rawValue, names: [.en: "Shirogane Noel", .ja: "白銀ノエル"], inGeneration: Generation.hololive3rdGen),
    .marine: Talent(id: TalentEnum.marine.rawValue, names: [.en: "Houshou Marine", .ja: "宝鐘マリン"], inGeneration: Generation.hololive3rdGen),
    
    // MARK: - 4th gen
    .kanata: Talent(id: TalentEnum.kanata.rawValue, names: [.en: "Amane Kanata", .ja: "天音かなた"], inGeneration: Generation.hololive4thGen),
    .watame: Talent(id: TalentEnum.watame.rawValue, names: [.en: "Tsunomaki Watame", .ja: "角巻わため"], inGeneration: Generation.hololive4thGen),
    .towa: Talent(id: TalentEnum.towa.rawValue, names: [.en: "Tokoyami Towa", .ja: "常闇トワ"], inGeneration: Generation.hololive4thGen),
    .luna: Talent(id: TalentEnum.luna.rawValue, names: [.en: "Himemori Luna", .ja: "姫森ルーナ"], inGeneration: Generation.hololive4thGen),
    
    // MARK: - 5th gen
    .lamy: Talent(id: TalentEnum.lamy.rawValue, names: [.en: "Yukihana Lamy", .ja: "雪花ラミィ"], inGeneration: Generation.hololive5thGen),
    .nene: Talent(id: TalentEnum.nene.rawValue, names: [.en: "Momosuzu Nene", .ja: "桃鈴ねね"], inGeneration: Generation.hololive5thGen),
    .botan: Talent(id: TalentEnum.botan.rawValue, names: [.en: "Shishiro Botan", .ja: "獅白ぼたん"], inGeneration: Generation.hololive5thGen),
    .polka: Talent(id: TalentEnum.polka.rawValue, names: [.en: "Omaru Polka", .ja: "尾丸ポルカ"], inGeneration: Generation.hololive5thGen),
    
    // MARK: - holoX
    .laplus: Talent(id: TalentEnum.laplus.rawValue, names: [.en: "La+ Darknesss", .ja: "ラプラス・ダークネス"], inGeneration: Generation.holox),
    .lui: Talent(id: TalentEnum.lui.rawValue, names: [.en: "Takane Lui", .ja: "鷹嶺ルイ"], inGeneration: Generation.holox),
    .koyori: Talent(id: TalentEnum.koyori.rawValue, names: [.en: "Hakui Koyori", .ja: "博衣こより"], inGeneration: Generation.holox),
    .chloe: Talent(id: TalentEnum.chloe.rawValue, names: [.en: "Sakamata Chloe", .ja: "沙花叉クロヱ"], inGeneration: Generation.holox),
    .iroha: Talent(id: TalentEnum.iroha.rawValue, names: [.en: "Kazama Iroha", .ja: "風真いろは"], inGeneration: Generation.holox),
    
    // MARK: - ID 1st gen
    .risu: Talent(id: TalentEnum.risu.rawValue, names: [.en: "Ayunda Risu", .ja: "アユンダ・リス"], inGeneration: Generation.id1stGen),
    .moona: Talent(id: TalentEnum.moona.rawValue, names: [.en: "Moona Hoshinova", .ja: "ムーナ・ホシノヴァ"], inGeneration: Generation.id1stGen),
    .iofi: Talent(id: TalentEnum.iofi.rawValue, names: [.en: "Airani Iofifteen", .ja: "アイラニ・イオフィフティーン"], inGeneration: Generation.id1stGen),
    
    // MARK: - ID 2nd gen
    .ollie: Talent(id: TalentEnum.ollie.rawValue, names: [.en: "Kureiji Ollie", .ja: "クレイジー・オリー"], inGeneration: Generation.id3rdGen),
    .anya: Talent(id: TalentEnum.anya.rawValue, names: [.en: "Anya Melfissa", .ja: "アーニャ・メルフィッサ"], inGeneration: Generation.id3rdGen),
    .reine: Talent(id: TalentEnum.reine.rawValue, names: [.en: "Pavolia Reine", .ja: "パヴォリア・レイネ"], inGeneration: Generation.id3rdGen),
    
    // MARK: - ID 3rd gen
    .zeta: Talent(id: TalentEnum.zeta.rawValue, names: [.en: "Vestia Zeta", .ja: "ベスティア・ゼータ"], inGeneration: Generation.id3rdGen),
    .kaela: Talent(id: TalentEnum.kaela.rawValue, names: [.en: "Kaela Kovalskia", .ja: "カエラ・コヴァルスキア"], inGeneration: Generation.id3rdGen),
    .kobo: Talent(id: TalentEnum.kobo.rawValue, names: [.en: "Kobo Kanaeru", .ja: "こぼ・かなえる"], inGeneration: Generation.id3rdGen),
    
    // MARK: - EN Myth
    .mori: Talent(id: TalentEnum.mori.rawValue, names: [.en: "Mori Calliope", .ja: "森カリオペ"], inGeneration: Generation.enMyth),
    .kiara: Talent(id: TalentEnum.kiara.rawValue, names: [.en: "Takanashi Kiara", .ja: "小鳥遊キアラ"], inGeneration: Generation.enMyth),
    .ina: Talent(id: TalentEnum.ina.rawValue, names: [.en: "Ninomae Ina'nis", .ja: "一伊那尓栖"], inGeneration: Generation.enMyth),
    .gura: Talent(id: TalentEnum.gura.rawValue, names: [.en: "Gawr Gura", .ja: "がうる・ぐら"], inGeneration: Generation.enMyth),
    .ame: Talent(id: TalentEnum.ame.rawValue, names: [.en: "Watson Amelia", .ja: "ワトソン・アメリア"], inGeneration: Generation.enMyth),
    
    // MARK: - EN Promise
    .irys: Talent(id: TalentEnum.irys.rawValue, names: [.en: "IRyS", .ja: "アイリス"], inGeneration: Generation.enPromise),
    .ceres: Talent(id: TalentEnum.ceres.rawValue, names: [.en: "Ceres Fauna", .ja: "セレス・ファウナ"], inGeneration: Generation.enPromise),
    .kronii: Talent(id: TalentEnum.kronii.rawValue, names: [.en: "Ouro Kronii", .ja: "オーロ・クロニー"], inGeneration: Generation.enPromise),
    .mumei: Talent(id: TalentEnum.mumei.rawValue, names: [.en: "Nanashi Mumei", .ja: "七詩ムメイ"], inGeneration: Generation.enPromise),
    .baelz: Talent(id: TalentEnum.baelz.rawValue, names: [.en: "Hakos Baelz", .ja: "ハコス・ベールズ"], inGeneration: Generation.enPromise),
    
    // MARK: - EN Advent
    .shiori: Talent(id: TalentEnum.shiori.rawValue, names: [.en: "Shiori Novella", .ja: "シオリ・ノヴェラ"], inGeneration: Generation.enAdvent),
    .koseki: Talent(id: TalentEnum.koseki.rawValue, names: [.en: "Koseki Bijou", .ja: "古石ビジュー"], inGeneration: Generation.enAdvent),
    .nerissa: Talent(id: TalentEnum.nerissa.rawValue, names: [.en: "Nerissa Ravencroft", .ja: "ネリッサ・レイヴンクロフト"], inGeneration: Generation.enAdvent),
    .fuwamoco: Talent(id: TalentEnum.fuwamoco.rawValue, names: [.en: "Fuwawa & Mococo Abyssgard", .ja: "フワワ & モココ・アビスガード"], inGeneration: Generation.enAdvent),
    
    // MARK: - DEV_IS ReGLOSS
    .hiodoshi: Talent(id: TalentEnum.hiodoshi.rawValue, names: [.en: "Hiodoshi Ao", .ja: "火威青"], inGeneration: Generation.devIsReGloss),
    .otonose: Talent(id: TalentEnum.otonose.rawValue, names: [.en: "Otonose Kanade", .ja: "音乃瀬奏"], inGeneration: Generation.devIsReGloss),
    .ichijou: Talent(id: TalentEnum.ichijou.rawValue, names: [.en: "Ichijou Ririka", .ja: "一条莉々華"], inGeneration: Generation.devIsReGloss),
    .juufuutei: Talent(id: TalentEnum.juufuutei.rawValue, names: [.en: "Juufuutei Raden", .ja: "儒烏風亭らでん"], inGeneration: Generation.devIsReGloss),
    .hajime: Talent(id: TalentEnum.hajime.rawValue, names: [.en: "Todoroki Hajime", .ja: "轟はじめ"], inGeneration: Generation.devIsReGloss),
    
    // MARK: - holostars 1st gen
    .miyabi: Talent(id: TalentEnum.miyabi.rawValue, names: [.en: "Hanasaki Miyabi", .ja: "花咲みやび"], inGeneration: Generation.stars1stGen),
    .izuru: Talent(id: TalentEnum.izuru.rawValue, names: [.en: "Kanade Izuru", .ja: "奏手イヅル"], inGeneration: Generation.stars1stGen),
    .arurandeisu: Talent(id: TalentEnum.arurandeisu.rawValue, names: [.en: "Arurandeisu", .ja: "アルランディス"], inGeneration: Generation.stars1stGen),
    .rikka: Talent(id: TalentEnum.rikka.rawValue, names: [.en: "Rikka", .ja: "律可"], inGeneration: Generation.stars1stGen),
    
    // MARK: - holostars 2nd gen
    .astel: Talent(id: TalentEnum.astel.rawValue, names: [.en: "Astel Leda", .ja: "アステル・レダ"], inGeneration: Generation.stars2ndGen),
    .temma: Talent(id: TalentEnum.temma.rawValue, names: [.en: "Kishido Temma", .ja: "岸堂天真"], inGeneration: Generation.stars2ndGen),
    .roberu: Talent(id: TalentEnum.roberu.rawValue, names: [.en: "Yukoku Roberu", .ja: "夕刻ロベル"], inGeneration: Generation.stars2ndGen),
    
    // MARK: - holostars 3rd gen
    .shien: Talent(id: TalentEnum.shien.rawValue, names: [.en: "Kageyama Shien", .ja: "影山シエン"], inGeneration: Generation.stars3rdGen),
    .oga: Talent(id: TalentEnum.oga.rawValue, names: [.en: "Aragami Oga", .ja: "荒咬オウガ"], inGeneration: Generation.stars3rdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: Talent(id: TalentEnum.fuma.rawValue, names: [.en: "Yatogami Fuma", .ja: "夜十神封魔"], inGeneration: Generation.uproar),
    .uyu: Talent(id: TalentEnum.uyu.rawValue, names: [.en: "Utsugi Uyu", .ja: "羽継烏有"], inGeneration: Generation.uproar),
    .gamma: Talent(id: TalentEnum.gamma.rawValue, names: [.en: "Hizaki Gamma", .ja: "緋崎ガンマ"], inGeneration: Generation.uproar),
    .rio: Talent(id: TalentEnum.rio.rawValue, names: [.en: "Minase Rio", .ja: "水無世燐央"], inGeneration: Generation.uproar),
    
    // MARK: - holostars TEMPUS
    .altare: Talent(id: TalentEnum.altare.rawValue, names: [.en: "Regis Altare", .ja: "リージス・アルテア"], inGeneration: Generation.tempus),
    .syrios: Talent(id: TalentEnum.syrios.rawValue, names: [.en: "Axel Syrios", .ja: "アクセル・シリオス"], inGeneration: Generation.tempus),
    .gavis: Talent(id: TalentEnum.gavis.rawValue, names: [.en: "Gavis Bettel", .ja: "ガビス・ベッテル"], inGeneration: Generation.tempus),
    .machina: Talent(id: TalentEnum.machina.rawValue, names: [.en: "Machina X Flayon", .ja: "マキナ・X・フレオン"], inGeneration: Generation.tempus),
    .banzoin: Talent(id: TalentEnum.banzoin.rawValue, names: [.en: "Banzoin Hakka", .ja: "万象院ハッカ"], inGeneration: Generation.tempus),
    .josuiji: Talent(id: TalentEnum.josuiji.rawValue, names: [.en: "Josuiji Shinri", .ja: "定水寺シンリ"], inGeneration: Generation.tempus),
    
    // MARK: - holostars English -ARMIS-
    .rexford: Talent(id: TalentEnum.rexford.rawValue, names: [.en: "Jurard T Rexford", .ja: "ジュラルド・ティー・レクスフォード"], inGeneration: Generation.armis),
    .goldbullet: Talent(id: TalentEnum.goldbullet.rawValue, names: [.en: "Goldbullet", .ja: "ゴールドブレット"], inGeneration: Generation.armis),
    .octavio: Talent(id: TalentEnum.octavio.rawValue, names: [.en: "Octavio", .ja: "オクタビオ"], inGeneration: Generation.armis),
    .ruze: Talent(id: TalentEnum.ruze.rawValue, names: [.en: "Crimzon Ruze", .ja: "クリムゾン・ルーズ"], inGeneration: Generation.armis),
    
    // MARK: - Official Channels
    .hololive: Talent(id: TalentEnum.hololive.rawValue, names: [.en: "hololive Official Channel", .ja: "ホロライブ公式チャンネル"], inGeneration: Generation.hololiveOfficial),
    .hololiveEN: Talent(id: TalentEnum.hololiveEN.rawValue, names: [.en: "hololive English Official Channel", .ja: "hololive English 公式チャンネル"], inGeneration: Generation.hololiveOfficial),
    .hololiveID: Talent(id: TalentEnum.hololiveID.rawValue, names: [.en: "hololive Indonesia Official Channel", .ja: "hololive Indonesia 公式チャンネル"], inGeneration: Generation.hololiveOfficial),
    .holostars: Talent(id: TalentEnum.holostars.rawValue, names: [.en: "holostars Official Channel", .ja: "ホロスターズ公式チャンネル"], inGeneration: Generation.hololiveOfficial),
    .midnight: Talent(id: TalentEnum.midnight.rawValue, names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: Generation.hololiveOfficial),
    .holostarsEN: Talent(id: TalentEnum.holostarsEN.rawValue, names: [.en: "HOLOSTARS English", .ja: "HOLOSTARS English"], inGeneration: Generation.hololiveOfficial),
    
    // MARK: - NIJISANJI First Generation
    .moira: Talent(id: TalentEnum.moira.rawValue, names: [.en: "Moira", .ja: "モイラ"], inGeneration: Generation.nijisanji1stGen),
    .suzuya: Talent(id: TalentEnum.suzuya.rawValue, names: [.en: "Suzuya Aki", .ja: "鈴谷アキ"], inGeneration: Generation.nijisanji1stGen),
    .shibuya: Talent(id: TalentEnum.shibuya.rawValue, names: [.en: "Shibuya Hajime", .ja: "渋谷ハジメ"], inGeneration: Generation.nijisanji1stGen),
    .higuchi: Talent(id: TalentEnum.higuchi.rawValue, names: [.en: "Higuchi Kaede", .ja: "樋口楓"], inGeneration: Generation.nijisanji1stGen),
    .tsukino: Talent(id: TalentEnum.tsukino.rawValue, names: [.en: "Tsukino Mito", .ja: "月ノ美兎"], inGeneration: Generation.nijisanji1stGen),
    .shizuka: Talent(id: TalentEnum.shizuka.rawValue, names: [.en: "Shizuka Rin", .ja: "静凛"], inGeneration: Generation.nijisanji1stGen),
    .elu: Talent(id: TalentEnum.elu.rawValue, names: [.en: "Elu", .ja: "える"], inGeneration: Generation.nijisanji1stGen),
    
    // MARK: - NIJISANJI Second Generation
    .ienaga: Talent(id: TalentEnum.ienaga.rawValue, names: [.en: "Ienaga Mugi", .ja: "家長むぎ"], inGeneration: Generation.nijisanji2ndGen),
    .yuuhi: Talent(id: TalentEnum.yuuhi.rawValue, names: [.en: "Yuuhi Riri", .ja: "夕陽リリ"], inGeneration: Generation.nijisanji2ndGen),
    .fushimi: Talent(id: TalentEnum.fushimi.rawValue, names: [.en: "Fushimi Gaku", .ja: "伏見ガク"], inGeneration: Generation.nijisanji2ndGen),
    .kenmochi: Talent(id: TalentEnum.kenmochi.rawValue, names: [.en: "Kenmochi Toya", .ja: "剣持刀也"], inGeneration: Generation.nijisanji2ndGen),
    .mononobe: Talent(id: TalentEnum.mononobe.rawValue, names: [.en: "Mononobe Alice", .ja: "物述有栖"], inGeneration: Generation.nijisanji2ndGen),
    .ushimi: Talent(id: TalentEnum.ushimi.rawValue, names: [.en: "Ushimi Ichigo", .ja: "宇志海いちご"], inGeneration: Generation.nijisanji2ndGen),
    .suzuka: Talent(id: TalentEnum.suzuka.rawValue, names: [.en: "Suzuka Utako", .ja: "鈴鹿詩子"], inGeneration: Generation.nijisanji2ndGen),
    .gilzaren: Talent(id: TalentEnum.gilzaren.rawValue, names: [.en: "Gilzaren III", .ja: "ギルザレンⅢ世"], inGeneration: Generation.nijisanji2ndGen),
    .fumino: Talent(id: TalentEnum.fumino.rawValue, names: [.en: "Fumino Tamaki", .ja: "文野環"], inGeneration: Generation.nijisanji2ndGen),
    .morinaka: Talent(id: TalentEnum.morinaka.rawValue, names: [.en: "Morinaka Kazaki", .ja: "森中花咲"], inGeneration: Generation.nijisanji2ndGen),
    
    // MARK: - NIJISANJI Gamers First Wave
    .kanae: Talent(id: TalentEnum.kanae.rawValue, names: [.en: "Kanae", .ja: "叶"], inGeneration: Generation.gamers1stWave),
    .akabane: Talent(id: TalentEnum.akabane.rawValue, names: [.en: "Akabane Youko", .ja: "赤羽葉子"], inGeneration: Generation.gamers1stWave),
    
    // MARK: - NIJISANJI Gamers Second Wave
    .sasaki: Talent(id: TalentEnum.sasaki.rawValue, names: [.en: "Sasaki Saku", .ja: "笹木咲"], inGeneration: Generation.gamers2ndWave),
    .honma: Talent(id: TalentEnum.honma.rawValue, names: [.en: "Honma Himawari", .ja: "本間ひまわり"], inGeneration: Generation.gamers2ndWave),
    
    // MARK: - NIJISANJI Gamers Third Wave
    .makaino: Talent(id: TalentEnum.makaino.rawValue, names: [.en: "Makaino Ririmu", .ja: "魔界ノりりむ"], inGeneration: Generation.gamers3rdWave),
    .kuzuha: Talent(id: TalentEnum.kuzuha.rawValue, names: [.en: "Kuzuha", .ja: "葛葉"], inGeneration: Generation.gamers3rdWave),
    .shiina: Talent(id: TalentEnum.shiina.rawValue, names: [.en: "Shiina Yuika", .ja: "椎名唯華"], inGeneration: Generation.gamers3rdWave),
    
    // MARK: - NIJISANJI SEEDs First Generation
    .dola: Talent(id: TalentEnum.dola.rawValue, names: [.en: "Dola", .ja: "ドーラ"], inGeneration: Generation.seeds1stGen),
    .todoroki: Talent(id: TalentEnum.todoroki.rawValue, names: [.en: "Todoroki Kyoko", .ja: "轟京子"], inGeneration: Generation.seeds1stGen),
    .sister: Talent(id: TalentEnum.sister.rawValue, names: [.en: "Sister Claire", .ja: "シスター・クレア"], inGeneration: Generation.seeds1stGen),
    .hanabatake: Talent(id: TalentEnum.hanabatake.rawValue, names: [.en: "Hanabatake Chaika", .ja: "花畑チャイカ"], inGeneration: Generation.seeds1stGen),
    .yashiro: Talent(id: TalentEnum.yashiro.rawValue, names: [.en: "Yashiro Kizuku", .ja: "社築"], inGeneration: Generation.seeds1stGen),
    .suzuki: Talent(id: TalentEnum.suzuki.rawValue, names: [.en: "Suzuki Masaru", .ja: "鈴木勝"], inGeneration: Generation.seeds1stGen),
    .uzuki: Talent(id: TalentEnum.uzuki.rawValue, names: [.en: "Uzuki Kou", .ja: "卯月コウ"], inGeneration: Generation.seeds1stGen),
    .ryushen: Talent(id: TalentEnum.ryushen.rawValue, names: [.en: "Ryushen", .ja: "緑仙"], inGeneration: Generation.seeds1stGen),
    .ryushenGaming: Talent(id: TalentEnum.ryushenGaming.rawValue, names: [.en: "Ryushen Gaming", .ja: "緑仙のゲームちゃんねる"], inGeneration: Generation.seeds1stGen),

    // MARK: - NIJISANJI SEEDs Second Generation First Wave
    .kanda: Talent(id: TalentEnum.kanda.rawValue, names: [.en: "Kanda Shoichi", .ja: "神田笑一"], inGeneration: Generation.seeds2ndGen1stWave),
    .asuka: Talent(id: TalentEnum.asuka.rawValue, names: [.en: "Asuka Hina", .ja: "飛鳥ひな"], inGeneration: Generation.seeds2ndGen1stWave),
    .harusaki: Talent(id: TalentEnum.harusaki.rawValue, names: [.en: "Harusaki Air", .ja: "春崎エアル"], inGeneration: Generation.seeds2ndGen1stWave),
    .amemori: Talent(id: TalentEnum.amemori.rawValue, names: [.en: "Amemori Sayo", .ja: "雨森小夜"], inGeneration: Generation.seeds2ndGen1stWave),
    .takamiya: Talent(id: TalentEnum.takamiya.rawValue, names: [.en: "Takamiya Rion", .ja: "鷹宮リオン"], inGeneration: Generation.seeds2ndGen1stWave),
    .maimoto: Talent(id: TalentEnum.maimoto.rawValue, names: [.en: "Maimoto Keisuke", .ja: "舞元啓介"], inGeneration: Generation.seeds2ndGen1stWave),

    // MARK: - NIJISANJI SEEDs Second Generation Second Wave
    .rindou: Talent(id: TalentEnum.rindou.rawValue, names: [.en: "Rindou Mikoto", .ja: "竜胆尊"], inGeneration: Generation.seeds2ndGen2ndWave),
    .debidebi: Talent(id: TalentEnum.debidebi.rawValue, names: [.en: "Debidebi Debiru", .ja: "でびでび・でびる"], inGeneration: Generation.seeds2ndGen2ndWave),
    .sakura: Talent(id: TalentEnum.sakura.rawValue, names: [.en: "Sakura Ritsuki", .ja: "桜凛月"], inGeneration: Generation.seeds2ndGen2ndWave),
    .machita: Talent(id: TalentEnum.machita.rawValue, names: [.en: "Machita Chima", .ja: "町田ちま"], inGeneration: Generation.seeds2ndGen2ndWave),
    .joe: Talent(id: TalentEnum.joe.rawValue, names: [.en: "Joe Rikiichi", .ja: "ジョー・力一"], inGeneration: Generation.seeds2ndGen2ndWave),

    // MARK: - NIJISANJI SEEDs Second Generation Third Wave
    .naruse: Talent(id: TalentEnum.naruse.rawValue, names: [.en: "Naruse Naru", .ja: "成瀬鳴"], inGeneration: Generation.seeds2ndGen3rdWave),
    .belmond: Talent(id: TalentEnum.belmond.rawValue, names: [.en: "Belmond Banderas", .ja: "ベルモンド・バンデラス"], inGeneration: Generation.seeds2ndGen3rdWave),
    .yaguruma: Talent(id: TalentEnum.yaguruma.rawValue, names: [.en: "Yaguruma Rine", .ja: "矢車りね"], inGeneration: Generation.seeds2ndGen3rdWave),
    .yumeoi: Talent(id: TalentEnum.yumeoi.rawValue, names: [.en: "Yumeoi Kakeru", .ja: "夢追翔"], inGeneration: Generation.seeds2ndGen3rdWave),
    .kuroi: Talent(id: TalentEnum.kuroi.rawValue, names: [.en: "Kuroi Shiba", .ja: "黒井しば"], inGeneration: Generation.seeds2ndGen3rdWave),

    // MARK: - 2019 Wave: Usa-chan club
    .yuzuki: Talent(id: TalentEnum.yuzuki.rawValue, names: [.en: "Yuzuki Roa", .ja: "夢月ロア"], inGeneration: Generation.wave2019Usa),

    // MARK: - 2019 Wave: January 28
    .onomachi: Talent(id: TalentEnum.onomachi.rawValue, names: [.en: "Onomachi Haruka", .ja: "小野町春香"], inGeneration: Generation.wave2019Jan28),
    .onomachiASMR: Talent(id: TalentEnum.onomachiASMR.rawValue, names: [.en: "Onomachi Haruka ASMR", .ja: "小野町春香 ASMR"], inGeneration: Generation.wave2019Jan28),
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
    .nagao: Talent(id: TalentEnum.nagao.rawValue, names: [.en: "Nagao Kei", .ja: "長尾景"], inGeneration: Generation.wave2020Valz),
    .genzuki: Talent(id: TalentEnum.genzuki.rawValue, names: [.en: "Genzuki Tojiro", .ja: "弦月藤士郎"], inGeneration: Generation.wave2020Valz),
    .kaida: Talent(id: TalentEnum.kaida.rawValue, names: [.en: "Kaida Haru", .ja: "甲斐田晴"], inGeneration: Generation.wave2020Valz),

    // MARK: - 2020 Wave: June 30
    .sorahoshi: Talent(id: TalentEnum.sorahoshi.rawValue, names: [.en: "Sorahoshi Kirame", .ja: "空星きらめ"], inGeneration: Generation.wave2020Jun30),

    // MARK: - 2020 Wave: Sereine Jogakuin
    .asahina: Talent(id: TalentEnum.asahina.rawValue, names: [.en: "Asahina Akane", .ja: "朝日南アカネ"], inGeneration: Generation.wave2020SereineJogakuin),
    .suo: Talent(id: TalentEnum.suo.rawValue, names: [.en: "Suo Sango", .ja: "周央サンゴ"], inGeneration: Generation.wave2020SereineJogakuin),
    .todo: Talent(id: TalentEnum.todo.rawValue, names: [.en: "Todo Kohaku", .ja: "東堂コハク"], inGeneration: Generation.wave2020SereineJogakuin),
    .kitakoji: Talent(id: TalentEnum.kitakoji.rawValue, names: [.en: "Kitakoji Hisui", .ja: "北小路ヒスイ"], inGeneration: Generation.wave2020SereineJogakuin),
    .nishizono: Talent(id: TalentEnum.nishizono.rawValue, names: [.en: "Nishizono Chigusa", .ja: "西園チグサ"], inGeneration: Generation.wave2020SereineJogakuin),

    // MARK: - 2021 Wave
    .lauren: Talent(id: TalentEnum.lauren.rawValue, names: [.en: "Lauren Iroas", .ja: "ローレン・イロアス"], inGeneration: Generation.wave2021),
    .leos: Talent(id: TalentEnum.leos.rawValue, names: [.en: "Leos Vincent", .ja: "レオス・ヴィンセント"], inGeneration: Generation.wave2021),
    .oliver: Talent(id: TalentEnum.oliver.rawValue, names: [.en: "Oliver Evans", .ja: "オリバー・エバンス"], inGeneration: Generation.wave2021),
    .lain: Talent(id: TalentEnum.lain.rawValue, names: [.en: "Lain Paterson", .ja: "レイン・パターソン"], inGeneration: Generation.wave2021),

    // MARK: - 2022 Wave: Ranunculus
    .amagase: Talent(id: TalentEnum.amagase.rawValue, names: [.en: "Amagase Muyu", .ja: "天ヶ瀬むゆ"], inGeneration: Generation.wave2022Ranunculus),
    .ponto: Talent(id: TalentEnum.ponto.rawValue, names: [.en: "Ponto Nei", .ja: "先斗寧"], inGeneration: Generation.wave2022Ranunculus),
    .umise: Talent(id: TalentEnum.umise.rawValue, names: [.en: "Umise Yotsuha", .ja: "海妹四葉"], inGeneration: Generation.wave2022Ranunculus),

    // MARK: - 2022 Wave: May 21
    .hyakumantenbara: Talent(id: TalentEnum.hyakumantenbara.rawValue, names: [.en: "Hyakumantenbara Salome", .ja: "壱百満天原サロメ"], inGeneration: Generation.wave2022May21),

    // MARK: - 2022 Wave: VOLTACTION
    .fura: Talent(id: TalentEnum.fura.rawValue, names: [.en: "Fura Kanato", .ja: "風楽奏斗"], inGeneration: Generation.wave2022Voltaction),
    .watarai: Talent(id: TalentEnum.watarai.rawValue, names: [.en: "Watarai Hibari", .ja: "渡会雲雀"], inGeneration: Generation.wave2022Voltaction),
    .shikinagi: Talent(id: TalentEnum.shikinagi.rawValue, names: [.en: "Shikinagi Akira", .ja: "四季凪アキラ"], inGeneration: Generation.wave2022Voltaction),
    .seraph: Talent(id: TalentEnum.seraph.rawValue, names: [.en: "Seraph Dazzlegarden", .ja: "セラフ・ダズルガーデン"], inGeneration: Generation.wave2022Voltaction),
    
    // MARK: - 2023 Wave: Jan 13
    .koshimizu: Talent(id: TalentEnum.koshimizu.rawValue, names: [.en: "Koshimizu Toru", .ja: "小清水透"], inGeneration: Generation.wave2023Jan16),
    .shishido: Talent(id: TalentEnum.shishido.rawValue, names: [.en: "Shishido Akari", .ja: "獅子堂あかり"], inGeneration: Generation.wave2023Jan16),
    .kaburaiki: Talent(id: TalentEnum.kaburaiki.rawValue, names: [.en: "Kaburaki Roco", .ja: "鏑木ろこ"], inGeneration: Generation.wave2023Jan16),
    .igarashi: Talent(id: TalentEnum.igarashi.rawValue, names: [.en: "Igarashi Rika", .ja: "五十嵐梨花"], inGeneration: Generation.wave2023Jan16),
    .ishigami: Talent(id: TalentEnum.ishigami.rawValue, names: [.en: "Ishigami Nozomi", .ja: "石神のぞみ"], inGeneration: Generation.wave2023Jan16),
    .sophia: Talent(id: TalentEnum.sophia.rawValue, names: [.en: "Sophia Valentine", .ja: "ソフィア・ヴァレンタイン"], inGeneration: Generation.wave2023Jan16),
    .kuramochi: Talent(id: TalentEnum.kuramochi.rawValue, names: [.en: "Kuramochi Meruto", .ja: "倉持めると"], inGeneration: Generation.wave2023Jan16),
    
    // MARK: - 2023 Wave: Mar 30
    .ittetsu: Talent(id: TalentEnum.ittetsu.rawValue, names: [.en: "Saiki Ittetsu", .ja: "佐伯イッテツ"], inGeneration: Generation.wave2023Mar30),
    .wen: Talent(id: TalentEnum.wen.rawValue, names: [.en: "Akagi Wen", .ja: "赤城ウェン"], inGeneration: Generation.wave2023Mar30),
    .rito: Talent(id: TalentEnum.rito.rawValue, names: [.en: "Usami Rito", .ja: "宇佐美リト"], inGeneration: Generation.wave2023Mar30),
    .mana: Talent(id: TalentEnum.mana.rawValue, names: [.en: "Hibachi Mana", .ja: "緋八マナ"], inGeneration: Generation.wave2023Mar30),
    
    // MARK: 2023 Wave: Apr 26
    .sho: Talent(id: TalentEnum.sho.rawValue, names: [.en: "Hoshirube Sho", .ja: "星導ショウ"], inGeneration: Generation.wave2023Apr26),
    .kagetsu: Talent(id: TalentEnum.kagetsu.rawValue, names: [.en: "Murakumo Kagetsu", .ja: "叢雲カゲツ"], inGeneration: Generation.wave2023Apr26),
    .rou: Talent(id: TalentEnum.mana.rawValue, names: [.en: "Koyanagi Rou", .ja: "小柳ロウ"], inGeneration: Generation.wave2023Apr26),
    .raiInami: Talent(id: TalentEnum.raiInami.rawValue, names: [.en: "Inami Rai", .ja: "伊波ライ"], inGeneration: Generation.wave2023Apr26),
    
    // MARK: 2023 Wave: Nov 21
    .totoTachitsute: Talent(id: TalentEnum.totoTachitsute.rawValue, names: [.en: "Tachitsute Toto", .ja: "立伝都々"], inGeneration: Generation.wave2023Nov21),
    .ruri: Talent(id: TalentEnum.ruri.rawValue, names: [.en: "Shioriha Ruri", .ja: "栞葉るり"], inGeneration: Generation.wave2023Nov21),
    .kestrel: Talent(id: TalentEnum.kestrel.rawValue, names: [.en: "Milan Kestrel", .ja: "ミラン・ケストレル"], inGeneration: Generation.wave2023Nov21),

    // MARK: - ID First Wave: 3setBBQ
    .hana: Talent(id: TalentEnum.hana.rawValue, names: [.en: "Hana Macchia", .ja: "ハナ マキア"], inGeneration: Generation.id1stWave),

    // MARK: - ID Second Wave: CloverMcOver
    .rai: Talent(id: TalentEnum.rai.rawValue, names: [.en: "Rai Galilei", .ja: "ライ ガリレイ"], inGeneration: Generation.id2ndWave),
    .riksa: Talent(id: TalentEnum.riksa.rawValue, names: [.en: "Riksa Dhirendra", .ja: "リクサ ディレンドラ"], inGeneration: Generation.id2ndWave),

    // MARK: - ID Third Wave: LAN_NEE3S
    .layla: Talent(id: TalentEnum.layla.rawValue, names: [.en: "Layla Alstroemeria", .ja: "ライラ アルストロエメリア"], inGeneration: Generation.id3rdWave),

    // MARK: - ID Fourth Wave: 3FicLite
    .etna: Talent(id: TalentEnum.etna.rawValue, names: [.en: "Etna Crimson", .ja: "エトナ クリムソン"], inGeneration: Generation.id4thWave),
    .bonnivier: Talent(id: TalentEnum.bonnivier.rawValue, names: [.en: "Bonnivier Pranaja", .ja: "ボンニフィエール プラナジャ"], inGeneration: Generation.id4thWave),

    // MARK: - ID Fifth Wave: 53renade
    .nagisa: Talent(id: TalentEnum.nagisa.rawValue, names: [.en: "Nagisa Arcinia", .ja: "ナギサ アルシニア"], inGeneration: Generation.id5thWave),
    .derem: Talent(id: TalentEnum.derem.rawValue, names: [.en: "Derem Kado", .ja: "デレム カド"], inGeneration: Generation.id5thWave),
    .reza: Talent(id: TalentEnum.reza.rawValue, names: [.en: "Reza Avanluna", .ja: "レザ アファンルナ"], inGeneration: Generation.id5thWave),
    
    // MARK: - KR First Wave
    .minSuha: Talent(id: TalentEnum.minSuha.rawValue, names: [.en: "Min Suha", .ja: "ミン・スゥーハ"], inGeneration: Generation.kr1stWave),
    .gaon: Talent(id: TalentEnum.gaon.rawValue, names: [.en: "Gaon", .ja: "ガオン"], inGeneration: Generation.kr1stWave),
    
    // MARK: - KR Second Wave
    .soNagi: Talent(id: TalentEnum.soNagi.rawValue, names: [.en: "So Nagi", .ja: "ソ・ナギ"], inGeneration: Generation.kr2ndWave),
    
    // MARK: - KR Third Wave
    .akiraRay: Talent(id: TalentEnum.akiraRay.rawValue, names: [.en: "Akira Ray", .ja: "明楽レイ"], inGeneration: Generation.kr3rdWave),
    .leeRoha: Talent(id: TalentEnum.leeRoha.rawValue, names: [.en: "Lee Roha", .ja: "イ・ロハ"], inGeneration: Generation.kr3rdWave),
    
    // MARK: - KR Fourth Wave
    .yangNari: Talent(id: TalentEnum.yangNari.rawValue, names: [.en: "Yang Nari", .ja: "ヤン・ナリ"], inGeneration: Generation.kr4thWave),
    .ryuHari: Talent(id: TalentEnum.ryuHari.rawValue, names: [.en: "Ryu Hari", .ja: "リュ・ハリ"], inGeneration: Generation.kr4thWave),
    .ohJiyu: Talent(id: TalentEnum.ohJiyu.rawValue, names: [.en: "Oh Jiyu", .ja: "オ・ジユ"], inGeneration: Generation.kr4thWave),
    
    // MARK: - KR Fifth Wave
    .seffyna: Talent(id: TalentEnum.seffyna.rawValue, names: [.en: "Seffyna", .ja: "セフィナ"], inGeneration: Generation.kr5thWave),
    .banHada: Talent(id: TalentEnum.banHada.rawValue, names: [.en: "Ban Hada", .ja: "バン・ハダ"], inGeneration: Generation.kr5thWave),
    
    // MARK: - KR Sixth Wave
    .haYun: Talent(id: TalentEnum.haYun.rawValue, names: [.en: "Ha Yun", .ja: "ハ・ユン"], inGeneration: Generation.kr6thWave),
    .naSera: Talent(id: TalentEnum.naSera.rawValue, names: [.en: "Na Sera", .ja: "ナ・セラ"], inGeneration: Generation.kr6thWave),

    // MARK: - EN First Wave: LazuLight
    .elira: Talent(id: TalentEnum.elira.rawValue, names: [.en: "Elira Pendora", .ja: "エリーラ ペンドラ"], inGeneration: Generation.en1stWave),
    .finana: Talent(id: TalentEnum.finana.rawValue, names: [.en: "Finana Ryugu", .ja: "フィナーナ 竜宮"], inGeneration: Generation.en1stWave),

    // MARK: - EN Second Wave: OBSYDIA
    .rosemi: Talent(id: TalentEnum.rosemi.rawValue, names: [.en: "Rosemi Lovelock", .ja: "ロゼミ ラブロック"], inGeneration: Generation.en2ndWave),
    .petra: Talent(id: TalentEnum.petra.rawValue, names: [.en: "Petra Gurin", .ja: "ペトラ グリン"], inGeneration: Generation.en2ndWave),

    // MARK: - EN Third Wave: Ethyria
    .millie: Talent(id: TalentEnum.millie.rawValue, names: [.en: "Millie Parfait", .ja: "ミリー・パフェ"], inGeneration: Generation.en3rdWave),
    .enna: Talent(id: TalentEnum.enna.rawValue, names: [.en: "Enna Alouette", .ja: "エナー・アールウェット"], inGeneration: Generation.en3rdWave),
    .reimu: Talent(id: TalentEnum.reimu.rawValue, names: [.en: "Reimu Endou", .ja: "遠藤霊夢"], inGeneration: Generation.en3rdWave),

    // MARK: - EN Fourth Wave: Luxiem
    .luca: Talent(id: TalentEnum.luca.rawValue, names: [.en: "Luca Kaneshiro", .ja: "ルカ・カネシロ"], inGeneration: Generation.en4thWave),
    .shu: Talent(id: TalentEnum.shu.rawValue, names: [.en: "Shu Yamino", .ja: "闇ノシュウ"], inGeneration: Generation.en4thWave),
    .ike: Talent(id: TalentEnum.ike.rawValue, names: [.en: "Ike Eveland", .ja: "アイク・イーヴランド"], inGeneration: Generation.en4thWave),
    .vox: Talent(id: TalentEnum.vox.rawValue, names: [.en: "Vox Akuma", .ja: "ヴォックス・アクマ"], inGeneration: Generation.en4thWave),

    // MARK: - EN Fifth Wave: Noctyx
    .sonny: Talent(id: TalentEnum.sonny.rawValue, names: [.en: "Sonny Brisko", .ja: "サニー・ブリスコー"], inGeneration: Generation.en5thWave),
    .uki: Talent(id: TalentEnum.uki.rawValue, names: [.en: "Uki Violeta", .ja: "浮奇・ヴィオレタ"], inGeneration: Generation.en5thWave),
    .alban: Talent(id: TalentEnum.alban.rawValue, names: [.en: "Alban Knox", .ja: "アルバーン・ノックス"], inGeneration: Generation.en5thWave),
    .fulgur: Talent(id: TalentEnum.fulgur.rawValue, names: [.en: "Fulgur Ovid", .ja: "ファルガー・オーヴィド"], inGeneration: Generation.en5thWave),

    // MARK: - EN Sixth Wave: ILUNA
    .maria: Talent(id: TalentEnum.maria.rawValue, names: [.en: "Maria Marionette", .ja: "マリア マリオネット"], inGeneration: Generation.en6thWave),
    .aster: Talent(id: TalentEnum.aster.rawValue, names: [.en: "Aster Arcadia", .ja: "アスター アルカディア"], inGeneration: Generation.en6thWave),
    .aia: Talent(id: TalentEnum.aia.rawValue, names: [.en: "Aia Amare", .ja: "アイア アマレ"], inGeneration: Generation.en6thWave),
    .ren: Talent(id: TalentEnum.ren.rawValue, names: [.en: "Ren Zotto", .ja: "レン ゾット"], inGeneration: Generation.en6thWave),
    .scarle: Talent(id: TalentEnum.scarle.rawValue, names: [.en: "Scarle Yonaguni", .ja: "スカーレ ヨナグニ"], inGeneration: Generation.en6thWave),
    
    // MARK: - EN Seventh Wave: XSOLEIL
    .doppio: Talent(id: TalentEnum.doppio.rawValue, names: [.en: "Doppio Dropscythe", .ja: "ドッピオ ドロップサイト"], inGeneration: Generation.en7thWave),
    .meloco: Talent(id: TalentEnum.meloco.rawValue, names: [.en: "Meloco Kyoran", .ja: "狂蘭 メロコ"], inGeneration: Generation.en7thWave),
    .hex: Talent(id: TalentEnum.hex.rawValue, names: [.en: "Hex Haywire", .ja: "ヘックス ヘイワイヤー"], inGeneration: Generation.en7thWave),
    .kotoka: Talent(id: TalentEnum.kotoka.rawValue, names: [.en: "Kotoka Korahime", .ja: "虎姫 コトカ"], inGeneration: Generation.en7thWave),
    .ver: Talent(id: TalentEnum.ver.rawValue, names: [.en: "Ver Vermillion", .ja: "ヴェール ヴァーミリオン"], inGeneration: Generation.en7thWave),
    
    // MARK: - EN Eighth Wave: Krisis
    .wilson: Talent(id: TalentEnum.wilson.rawValue, names: [.en: "Yu Q. Wilson", .ja: "ユウ Q ウィルソン"], inGeneration: Generation.en8thWave),
    .bringer: Talent(id: TalentEnum.bringer.rawValue, names: [.en: "Vantacrow Bringer", .ja: "ベンタクロウ ブリンガー"], inGeneration: Generation.en8thWave),
    .bandage: Talent(id: TalentEnum.bandage.rawValue, names: [.en: "Vezalius Bandage", .ja: "ヴェザリウス バンデージ"], inGeneration: Generation.en8thWave),
    
    // MARK: - EN October 2023
    .clawmark: Talent(id: TalentEnum.clawmark.rawValue, names: [.en: "Claude Clawmark", .ja: "クロード クローマーク"], inGeneration: Generation.en9thWave),
    .brightshield: Talent(id: TalentEnum.brightshield.rawValue, names: [.en: "Victoria Brightshield", .ja: "ヴィクトリア ブライトシールド"], inGeneration: Generation.en9thWave),
    .nakasato: Talent(id: TalentEnum.nakasato.rawValue, names: [.en: "Kunai Nakasato", .ja: "中里苦無"], inGeneration: Generation.en9thWave),

    // MARK: - Official/Other Channels
    .nijisanji: Talent(id: TalentEnum.nijisanji.rawValue, names: [.en: "Nijisanji", .ja: "にじさんじ"], inGeneration: Generation.nijisanjiOfficial),
    .nijisanjiID: Talent(id: TalentEnum.nijisanjiID.rawValue, names: [.en: "NIJISANJI ID Official", .ja: "NIJISANJI ID Official"], inGeneration: Generation.nijisanjiOfficial),
    .nijisanjiEN: Talent(id: TalentEnum.nijisanjiEN.rawValue, names: [.en: "NIJISANJI EN Official", .ja: "NIJISANJI EN Official"], inGeneration: Generation.nijisanjiOfficial),
    .virtual: Talent(id: TalentEnum.virtual.rawValue, names: [.en: "Virtual Talent Academy", .ja: "バーチャル・タレント・アカデミー"], inGeneration: Generation.nijisanjiOfficial),
    .voltacation: Talent(id: TalentEnum.voltacation.rawValue, names: [.en: "VOLTACTION", .ja: "VOLTACTION"], inGeneration: Generation.nijisanjiOfficial),
    .luxiem: Talent(id: TalentEnum.luxiem.rawValue, names: [.en: "Luxiem Channel", .ja: "Luxiem Channel"], inGeneration: Generation.nijisanjiOfficial),
    .rofmao: Talent(id: TalentEnum.rofmao.rawValue, names: [.en: "ROF-MAO Channel", .ja: "ろふまおチャンネル"], inGeneration: Generation.nijisanjiOfficial),
    .nornis: Talent(id: TalentEnum.nornis.rawValue, names: [.en: "Nornis", .ja: "Nornis"], inGeneration: Generation.nijisanjiOfficial),
    .chronoir: Talent(id: TalentEnum.chronoir.rawValue, names: [.en: "ChroNoiR", .ja: "ChroNoiR"], inGeneration: Generation.nijisanjiOfficial),
    
    // MARK: - Re:AcT
    
    // MARK: - ReAliz
    .leona: Talent(id: TalentEnum.leona.rawValue, names: [.en: "Shishigami Leona", .ja: "獅子神レオナ"], inGeneration: Generation.reAliz),
    .mia: Talent(id: TalentEnum.mia.rawValue, names: [.en: "Mizugame Mia", .ja: "水瓶ミア"], inGeneration: Generation.reAliz),
    .rose: Talent(id: TalentEnum.rose.rawValue, names: [.en: "Sumeragi Rose", .ja: "皇ロゼ"], inGeneration: Generation.reAliz),
    .lisa: Talent(id: TalentEnum.lisa.rawValue, names: [.en: "Makou Lisa", .ja: "魔光リサ"], inGeneration: Generation.reAliz),
    
    // MARK: - kaleidscope
    .yuno: Talent(id: TalentEnum.yuno.rawValue, names: [.en: "Usami Yuno", .ja: "宇佐美ユノ"], inGeneration: Generation.kaleidscope),
    .hanabasami: Talent(id: TalentEnum.hanabasami.rawValue, names: [.en: "Hanabasami Kyo", .ja: "花鋏キョウ"], inGeneration: Generation.kaleidscope),
    .suu: Talent(id: TalentEnum.suu.rawValue, names: [.en: "Usuwa Suu", .ja: "稀羽すう"], inGeneration: Generation.kaleidscope),
    
    // MARK: - sinkirow
    .tsukimi: Talent(id: TalentEnum.tsukimi.rawValue, names: [.en: "Marumochi Tsukimi", .ja: "丸餅つきみ"], inGeneration: Generation.sinkirow),
    .yukino: Talent(id: TalentEnum.yukino.rawValue, names: [.en: "Nekono Yukino", .ja: "猫乃ユキノ"], inGeneration: Generation.sinkirow),
    .lie: Talent(id: TalentEnum.lie.rawValue, names: [.en: "Kulaku Lie", .ja: "九楽ライ"], inGeneration: Generation.sinkirow),
    
    // MARK: - Parfait
    .kanau: Talent(id: TalentEnum.kanau.rawValue, names: [.en: "Yumekawa Kanau", .ja: "夢川かなう"], inGeneration: Generation.parfait),
    .hano: Talent(id: TalentEnum.hano.rawValue, names: [.en: "Amakawa Hano", .ja: "天川はの"], inGeneration: Generation.parfait),
    .aria: Talent(id: TalentEnum.aria.rawValue, names: [.en: "Tsukushi Aria", .ja: "月紫アリア"], inGeneration: Generation.parfait),
    
    // MARK: - Re:Mixx
    .creil: Talent(id: TalentEnum.creil.rawValue, names: [.en: "Coucourua Creil", .ja: "ククルア・クレイユ"], inGeneration: Generation.reMixx),
    .nemu: Talent(id: TalentEnum.nemu.rawValue, names: [.en: "Nemu Otogi", .ja: "音伽ねむ"], inGeneration: Generation.reMixx),
    .taran: Talent(id: TalentEnum.taran.rawValue, names: [.en: "Taran Mikoshi", .ja: "神輿たらん"], inGeneration: Generation.reMixx),
    
    // MARK: - Re:AcT Official
    .reactOfficial: Talent(id: TalentEnum.reactOfficial.rawValue, names: [.en: "Re:AcT Official Channel", .ja: "Re:AcT公式チャンネル"], inGeneration: Generation.reactOfficial),
    
    // MARK: - 774
    .haneru: Talent(id: TalentEnum.haneru.rawValue, names: [.en: "Inaba Haneru", .ja: "因幡はねる"], inGeneration: Generation.nanashiInc),
    .ran: Talent(id: TalentEnum.ran.rawValue, names: [.en: "Hinokuma Ran", .ja: "日ノ隈らん"], inGeneration: Generation.nanashiInc),
    .ichika: Talent(id: TalentEnum.ichika.rawValue, names: [.en: "Souya Ichika", .ja: "宗谷いちか"], inGeneration: Generation.nanashiInc),
    .kuku: Talent(id: TalentEnum.kuku.rawValue, names: [.en: "Kazami Kuku", .ja: "風見くく"], inGeneration: Generation.nanashiInc),
    .izumi: Talent(id: TalentEnum.izumi.rawValue, names: [.en: "Yunohara Izumi", .ja: "柚原いづみ"], inGeneration: Generation.nanashiInc),
    .rui: Talent(id: TalentEnum.rui.rawValue, names: [.en: "Seshima Rui", .ja: "瀬島るい"], inGeneration: Generation.nanashiInc),
    .hikari: Talent(id: TalentEnum.hikari.rawValue, names: [.en: "Hira Hikari", .ja: "飛良ひかり"], inGeneration: Generation.nanashiInc),
    .chiroru: Talent(id: TalentEnum.chiroru.rawValue, names: [.en: "Tsukinoki Tirol", .ja: "月野木ちろる"], inGeneration: Generation.nanashiInc),
    .konanMia: Talent(id: TalentEnum.konanMia.rawValue, names: [.en: "Konan Mia", .ja: "湖南みあ"], inGeneration: Generation.nanashiInc),
    .sekishiroMiko: Talent(id: TalentEnum.sekishiroMiko.rawValue, names: [.en: "Sekishiro Mico", .ja: "堰代ミコ"], inGeneration: Generation.nanashiInc),
    .charlotte: Talent(id: TalentEnum.charlotte.rawValue, names: [.en: "Shimamura Charlotte", .ja: "島村シャルロット"], inGeneration: Generation.nanashiInc),
    .mary: Talent(id: TalentEnum.mary.rawValue, names: [.en: "Saionji Mary", .ja: "西園寺メアリ"], inGeneration: Generation.nanashiInc),
    .chris: Talent(id: TalentEnum.chris.rawValue, names: [.en: "Shishio Chris", .ja: "獅子王クリス"], inGeneration: Generation.nanashiInc),
    .rin: Talent(id: TalentEnum.rin.rawValue, names: [.en: "Ryugasaki Rene", .ja: "​龍ヶ崎リン"], inGeneration: Generation.nanashiInc),
    .mei: Talent(id: TalentEnum.mei.rawValue, names: [.en: "Oinomori May", .ja: "狼森メイ"], inGeneration: Generation.nanashiInc),
    .tier: Talent(id: TalentEnum.tier.rawValue, names: [.en: "Hebiyoi Tier", .ja: "蛇宵ティア"], inGeneration: Generation.nanashiInc),
    .nemo: Talent(id: TalentEnum.nemo.rawValue, names: [.en: "Suzumi Nemo", .ja: "涼海ネモ"], inGeneration: Generation.nanashiInc),
    .kanna: Talent(id: TalentEnum.kanna.rawValue, names: [.en: "Akane Canna", .ja: "茜音カンナ"], inGeneration: Generation.nanashiInc),
    .sei: Talent(id: TalentEnum.sei.rawValue, names: [.en: "Touri Sei", .ja: "橙里セイ"], inGeneration: Generation.nanashiInc),
    .kiki: Talent(id: TalentEnum.kiki.rawValue, names: [.en: "Shisui Kiki", .ja: "紫水キキ"], inGeneration: Generation.nanashiInc),
    .popo: Talent(id: TalentEnum.popo.rawValue, names: [.en: "Ieiri Popo", .ja: "家入ポポ"], inGeneration: Generation.nanashiInc),
    .yuri: Talent(id: TalentEnum.yuri.rawValue, names: [.en: "Kohaku Yuri", .ja: "瑚白ユリ"], inGeneration: Generation.nanashiInc),
    .anna: Talent(id: TalentEnum.anna.rawValue, names: [.en: "Kojo Anna", .ja: "虎城アンナ"], inGeneration: Generation.nanashiInc),
    .yuge: Talent(id: TalentEnum.yuge.rawValue, names: [.en: "And Uge", .ja: "杏戸ゆげ"], inGeneration: Generation.nanashiInc),
    .kanon: Talent(id: TalentEnum.kanon.rawValue, names: [.en: "Kanade Kanon", .ja: "花奏かのん"], inGeneration: Generation.nanashiInc),
    .annko: Talent(id: TalentEnum.annko.rawValue, names: [.en: "Kisaki Anko", .ja: "季咲あんこ"], inGeneration: Generation.nanashiInc),
    .amaui: Talent(id: TalentEnum.amaui.rawValue, names: [.en: "Amaui", .ja: "天羽衣"], inGeneration: Generation.nanashiInc),
    .uruuIna: Talent(id: TalentEnum.uruuIna.rawValue, names: [.en: "Ina Uruu", .ja: "いなうるう"], inGeneration: Generation.nanashiInc),
    .mashu: Talent(id: TalentEnum.mashu.rawValue, names: [.en: "Hinata Mashu", .ja: "日向ましゅ"], inGeneration: Generation.nanashiInc),
    
    // MARK: - 774inc official
    .nanashiOfficial: Talent(id: TalentEnum.nanashiOfficial.rawValue, names: [.en: "774 inc Official Channel", .ja: "ななし公式チャンネル"], inGeneration: Generation.nanashiOfficial),
    
    // MARK: - Nori Pro Solo
    .tamaki: Talent(id: TalentEnum.tamaki.rawValue, names: [.en: "Inuyama Tamaki", .ja: "犬山たまき"], inGeneration: Generation.noriProSolo),
    
    // MARK: - Nori Pro 1st gen
    .mishiro: Talent(id: TalentEnum.mishiro.rawValue, names: [.en: "Shirayuki Mishiro", .ja: "白雪みしろ"], inGeneration: Generation.noriPro1stGen),
    .miruku: Talent(id: TalentEnum.miruku.rawValue, names: [.en: "Enomiya Milk", .ja: "愛宮みるく"], inGeneration: Generation.noriPro1stGen),
    .takuma: Talent(id: TalentEnum.takuma.rawValue, names: [.en: "Kumagaya Takuma", .ja: "熊谷タクマ"], inGeneration: Generation.noriPro1stGen),
    .yuzuru: Talent(id: TalentEnum.yuzuru.rawValue, names: [.en: "Himesaki Yuzuru", .ja: "姫咲ゆずる"], inGeneration: Generation.noriPro1stGen),
    
    // MARK: - Nori Pro Gamers
    .inariIroha: Talent(id: TalentEnum.inariIroha.rawValue, names: [.en: "Inari Iroha", .ja: "稲荷いろは"], inGeneration: Generation.noriProGamers),
    .lionheart: Talent(id: TalentEnum.lionheart.rawValue, names: [.en: "Regrush Lionheart", .ja: "レグルシュ・ライオンハート"], inGeneration: Generation.noriProGamers),
    .shin: Talent(id: TalentEnum.shin.rawValue, names: [.en: "Nekozeno Shin", .ja: "猫瀬乃しん"], inGeneration: Generation.noriProGamers),
    
    // MARK: - Vspo Lupinus Virtual Games
    .uruha: Talent(id: TalentEnum.uruha.rawValue, names: [.en: "Ichinose Uruha", .ja: "一ノ瀬うるは"], inGeneration: .lupinus),
    .toto: Talent(id: TalentEnum.toto.rawValue, names: [.en: "Kogara Toto", .ja: "小雀とと"], inGeneration: .lupinus),
    .sumire: Talent(id: TalentEnum.sumire.rawValue, names: [.en: "Kaga Sumire", .ja: "花芽すみれ"], inGeneration: .lupinus),
    .nazuna: Talent(id: TalentEnum.nazuna.rawValue, names: [.en: "Kaga Nazuna", .ja: "花芽なずな"], inGeneration: .lupinus),
    
    // MARK: - Vspo Iris Black Games
    .noa: Talent(id: TalentEnum.noa.rawValue, names: [.en: "Kurumi Noah", .ja: "胡桃のあ"], inGeneration: .iris),
    .hinano: Talent(id: TalentEnum.hinano.rawValue, names: [.en: "Tachibana Hinano", .ja: "橘ひなの"], inGeneration: .iris),
    .renKisaragi: Talent(id: TalentEnum.renKisaragi.rawValue, names: [.en: "Kisaragi Ren", .ja: "如月れん"], inGeneration: .iris),
    
    // MARK: - Cattleya Regina Games
    .mimi: Talent(id: TalentEnum.mimi.rawValue, names: [.en: "Tosaki Mimi", .ja: "兎咲ミミ"], inGeneration: .cattleya),
    .sena: Talent(id: TalentEnum.sena.rawValue, names: [.en: "Asumi Sena", .ja: "空澄セナ"], inGeneration: .cattleya),
    .risa: Talent(id: TalentEnum.risa.rawValue, names: [.en: "Hanabusa Lisa", .ja: "英リサ"], inGeneration: .cattleya),
    
    // MARK: - Vspo
    .qpi: Talent(id: TalentEnum.qpi.rawValue, names: [.en: "Kaminari Qpi", .ja: "神成きゅぴ"], inGeneration: .vspo),
    .beni: Talent(id: TalentEnum.beni.rawValue, names: [.en: "Yakumo Beni", .ja: "八雲べに"], inGeneration: .vspo),
    .ema: Talent(id: TalentEnum.ema.rawValue, names: [.en: "Aizawa Ema", .ja: "藍沢エマ"], inGeneration: .vspo),
    .runa: Talent(id: TalentEnum.runa.rawValue, names: [.en: "Shinomiya Runa", .ja: "紫宮るな"], inGeneration: .vspo),
    .tsuna: Talent(id: TalentEnum.tsuna.rawValue, names: [.en: "Nekota Tsuna", .ja: "猫汰つな"], inGeneration: .vspo),
    .ramune: Talent(id: TalentEnum.ramune.rawValue, names: [.en: "Shiranami Ramune", .ja: "白波らむね"], inGeneration: .vspo),
    .met: Talent(id: TalentEnum.met.rawValue, names: [.en: "Komori Met", .ja: "小森めと"], inGeneration: .vspo),
    .yumenoAkari: Talent(id: TalentEnum.yumenoAkari.rawValue, names: [.en: "Yumeno Akari", .ja: "夢野あかり"], inGeneration: .vspo),
    .kuromu: Talent(id: TalentEnum.kuromu.rawValue, names: [.en: "Yano Kuromu", .ja: "夜乃くろむ"], inGeneration: .vspo),
    
    // MARK: - Vspo Official Channel
    .vspoOfficial: Talent(id: TalentEnum.vspoOfficial.rawValue, names: [.en: "VSpo Official Channel", .ja: "ぶいすぽっ! 公式チャンネル"], inGeneration: .vspoOfficial)
]

let talentsByGeneration: OrderedDictionary<Generation, GenerationGroup> = [
    // MARK: - Hololive
    .hololive0thGen: GenerationGroup(id: .hololive0thGen, names: [.en: "0th Gen", .ja: "0期生"], members: [.sora, .roboco, .azki, .miko, .suisei], agency: .hololive),
    .hololive1stGen: GenerationGroup(id: .hololive1stGen, names: [.en: "1st Gen", .ja: "1期生"], members: [.mel, .aki, .haato, .fubuki, .matsuri], agency: .hololive),
    .hololive2ndGen: GenerationGroup(id: .hololive2ndGen, names: [.en: "2nd Gen", .ja: "2期生"], members: [.aqua, .shion, .ayame, .choco, .subaru], agency: .hololive),
    .gamers: GenerationGroup(id: .gamers, names: [.en: "Gamers", .ja: "ゲーマーズ"], members: [.mio, .okayu, .korone], agency: .hololive),
    .hololive3rdGen: GenerationGroup(id: .hololive3rdGen, names: [.en: "3rd Gen", .ja: "3期生"], members: [.pekora, .flare, .noel, .marine], agency: .hololive),
    .hololive4thGen: GenerationGroup(id: .hololive4thGen, names: [.en: "4th Gen", .ja: "4期生"], members: [.kanata, .watame, .towa, .luna], agency: .hololive),
    .hololive5thGen: GenerationGroup(id: .hololive5thGen, names: [.en: "5th Gen", .ja: "5期生"], members: [.lamy, .nene, .botan, .polka], agency: .hololive),
    .holox: GenerationGroup(id: .holox, names: [.en: "holoX", .ja: "秘密結社holoX"], members: [.laplus, .lui, .koyori, .chloe, .iroha], agency: .hololive),
    .id1stGen: GenerationGroup(id: .id1stGen, names: [.en: "ID 1st Gen", .ja: "ID 1期生"], members: [.risu, .moona, .iofi], agency: .hololive),
    .id2ndGen: GenerationGroup(id: .id2ndGen, names: [.en: "ID 2nd Gen", .ja: "ID 2期生"], members: [.ollie, .anya, .reine], agency: .hololive),
    .id3rdGen: GenerationGroup(id: .id3rdGen, names: [.en: "ID 3rd Gen", .ja: "ID 3期生"], members: [.zeta, .kaela, .kobo], agency: .hololive),
    .enMyth: GenerationGroup(id: .enMyth, names: [.en: "hololive English -Myth-", .ja: "hololive English -Myth-"], members: [.mori, .kiara, .ina, .gura, .ame], agency: .hololive),
    .enPromise: GenerationGroup(id: .enPromise, names: [.en: "hololive English -Promise-", .ja: "hololive English -Promise-"], members: [.irys, .ceres, .kronii, .mumei, .baelz], agency: .hololive),
    .enAdvent: GenerationGroup(id: .enAdvent, names: [.en: "hololive English -Advent-", .ja: "hololive English -Advent-"], members: [.shiori, .koseki, .nerissa, .fuwamoco], agency: .hololive),
    .devIsReGloss: GenerationGroup(id: .devIsReGloss, names: [.en: "hololive DEV_IS ReGLOSS", .ja: "hololive DEV_IS ReGLOSS"], members: [.hiodoshi, .otonose, .ichijou, .juufuutei, .hajime], agency: .hololive),
    .stars1stGen: GenerationGroup(id: .stars1stGen, names: [.en: "holostars 1st Gen", .ja: "ホロスターズ 1期生"], members: [.miyabi, .izuru, .arurandeisu, .rikka], agency: .hololive),
    .stars2ndGen: GenerationGroup(id: .stars2ndGen, names: [.en: "holostars 2nd Gen", .ja: "ホロスターズ 2期生"], members: [.astel, .temma, .roberu], agency: .hololive),
    .stars3rdGen: GenerationGroup(id: .stars3rdGen, names: [.en: "holostars 3nd Gen", .ja: "ホロスターズ 3期生"], members: [.shien, .oga], agency: .hololive),
    .uproar: GenerationGroup(id: .uproar, names: [.en: "holostars UPROAR!!", .ja: "ホロスターズ アップロー!!"], members: [.fuma, .uyu, .gamma, .rio], agency: .hololive),
    .tempus: GenerationGroup(id: .tempus, names: [.en: "HOLOSTARS English -TEMPUS-", .ja: "ホロスターズEnglish -TEMPUS-"], members: [.altare, .syrios, .gavis, .machina, .banzoin, .josuiji], agency: .hololive),
    .armis: GenerationGroup(id: .armis, names: [.en: "HOLOSTARS English -ARMIS-", .ja: "ホロスターズEnglish -ARMIS-"], members: [.rexford, .goldbullet, .octavio, .ruze], agency: .hololive),
    .hololiveOfficial: GenerationGroup(id: .hololiveOfficial, names: [.en: "Hololive Official Channels", .ja: "ホロライブ公式チャンネル"], members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight, .holostarsEN], agency: .hololive),

    // MARK: - Nijisanji
    .nijisanji1stGen: GenerationGroup(id: .nijisanji1stGen, names: [.en: "1st Gen", .ja: "1期生"], members: [.moira, .suzuya, .shibuya, .higuchi, .tsukino, .shizuka, .elu], agency: .nijisanji),
    .nijisanji2ndGen: GenerationGroup(id: .nijisanji2ndGen, names: [.en: "2nd Gen", .ja: "2期生"], members: [.ienaga, .yuuhi, .fushimi, .kenmochi, .mononobe, .suzuka, .gilzaren, .fumino, .morinaka], agency: .nijisanji),
    .gamers1stWave: GenerationGroup(id: .gamers1stWave, names: [.en: "Gamers 1st Wave", .ja: "ゲーマーズ第1弾"], members: [.kanae, .akabane], agency: .nijisanji),
    .gamers2ndWave: GenerationGroup(id: .gamers2ndWave, names: [.en: "Gamers 2nd Wave", .ja: "ゲーマーズ第2弾"], members: [.sasaki, .honma], agency: .nijisanji),
    .gamers3rdWave: GenerationGroup(id: .gamers3rdWave, names: [.en: "Gamers 3rd Wave", .ja: "ゲーマーズ第3弾"], members: [.makaino, .kuzuha, .shiina], agency: .nijisanji),
    .seeds1stGen: GenerationGroup(id: .seeds1stGen, names: [.en: "SEEDs 1st Gen", .ja: "SEEDs1期生"], members: [.dola, .todoroki, .sister, .hanabatake, .yashiro, .suzuki, .uzuki, .ryushen, .ryushenGaming], agency: .nijisanji),
    .seeds2ndGen1stWave: GenerationGroup(id: .seeds2ndGen1stWave, names: [.en: "SEEDs 2nd Gen 1st Wave", .ja: "SEEDs2期生第1弾"], members: [.kanda, .asuka, .harusaki, .amemori, .takamiya, .maimoto], agency: .nijisanji),
    .seeds2ndGen2ndWave: GenerationGroup(id: .seeds2ndGen2ndWave, names: [.en: "SEEDs 2nd Gen 2nd Wave", .ja: "SEEDs2期生第2弾"], members: [.rindou, .debidebi, .sakura, .machita, .joe], agency: .nijisanji),
    .seeds2ndGen3rdWave: GenerationGroup(id: .seeds2ndGen3rdWave, names: [.en: "SEEDs 2nd Gen 3rd Wave", .ja: "SEEDs2期生第3弾"], members: [.naruse, .belmond, .yaguruma, .yumeoi, .kuroi], agency: .nijisanji),
    .wave2019Usa: GenerationGroup(id: .wave2019Usa, names: [.en: "2019 Wave: January 17", .ja: "2019年1月17日デビュー"], members: [.yuzuki], agency: .nijisanji),
    .wave2019Jan28: GenerationGroup(id: .wave2019Jan28, names: [.en: "2019 Wave: January 28", .ja: "2019年1月28日デビュー"], members: [.onomachi, .onomachiASMR, .kataribe, .seto], agency: .nijisanji),
    .wave2019Sanbaka: GenerationGroup(id: .wave2019Sanbaka, names: [.en: "2019 Wave: March 22", .ja: "2019年3月22日デビュー"], members: [.inui, .ange, .lize], agency: .nijisanji),
    .wave2019Beni: GenerationGroup(id: .wave2019Beni, names: [.en: "2019 Wave: April 2", .ja: "2019年4月2日デビュー"], members: [.saegusa, .aizono], agency: .nijisanji),
    .wave2019Apr29: GenerationGroup(id: .wave2019Apr29, names: [.en: "2019 Wave: April 29", .ja: "2019年4月29日デビュー"], members: [.yukishiro], agency: .nijisanji),
    .wave2019May17: GenerationGroup(id: .wave2019May17, names: [.en: "2019 Wave: May 17", .ja: "2019年5月17日デビュー"], members: [.ex, .levi], agency: .nijisanji),
    .wave2019Jun19: GenerationGroup(id: .wave2019Jun19, names: [.en: "2019 Wave: June 19", .ja: "2019年6月19日デビュー"], members: [.hayama, .nui], agency: .nijisanji),
    .wave2019SMC: GenerationGroup(id: .wave2019SMC, names: [.en: "2019 Wave: July 3", .ja: "2019年7月3日デビュー"], members: [.hakase, .kagami, .yorumi], agency: .nijisanji),
    .wave2019Blues: GenerationGroup(id: .wave2019Blues, names: [.en: "2019 Wave: July 24", .ja: "2019年7月24日デビュー"], members: [.ars, .aiba], agency: .nijisanji),
    .wave2019Posanke: GenerationGroup(id: .wave2019Posanke, names: [.en: "2019 Wave: August 8", .ja: "2019年8月8日デビュー"], members: [.amamiya, .eli, .ratna, .ratnaASMR], agency: .nijisanji),
    .wave2019Tulip: GenerationGroup(id: .wave2019Tulip, names: [.en: "2019 Wave: September 19", .ja: "2019年9月19日デビュー"], members: [.hayase, .sukoya, .shellin], agency: .nijisanji),
    .wave2019Orihimeboshi: GenerationGroup(id: .wave2019Orihimeboshi, names: [.en: "2019 Wave: October 17", .ja: "2019年10月17日デビュー"], members: [.fumi, .hoshikawa, .yamagami], agency: .nijisanji),
    .wave2019AkaNoSoshiki: GenerationGroup(id: .wave2019AkaNoSoshiki, names: [.en: "2019 Wave: October 31", .ja: "2019年10月31日デビュー"], members: [.emmaAugust, .luis, .matsukai], agency: .nijisanji),
    .wave2019NightKingdom: GenerationGroup(id: .wave2019NightKingdom, names: [.en: "2019 Wave: November 28", .ja: "2019年11月28日デビュー"], members: [.fuwa, .shirayuki, .gwelu], agency: .nijisanji),
    .wave2019Mananatsu: GenerationGroup(id: .wave2019Mananatsu, names: [.en: "2019 Wave: December 26", .ja: "2019年12月26日デビュー"], members: [.mashiro, .naraka, .kurusu], agency: .nijisanji),
    .wave2020Meifu: GenerationGroup(id: .wave2020Meifu, names: [.en: "2020 Wave: January 30", .ja: "2020年1月30日デビュー"], members: [.furen, .ibrahim], agency: .nijisanji),
    .wave2020Valz: GenerationGroup(id: .wave2020Valz, names: [.en: "2020 Wave: April 2", .ja: "2020年4月2日デビュー"], members: [.nagao, .genzuki, .kaida], agency: .nijisanji),
    .wave2020Jun30: GenerationGroup(id: .wave2020Jun30, names: [.en: "2020 Wave: June 30", .ja: "2020年6月30日デビュー"], members: [.sorahoshi], agency: .nijisanji),
    .wave2020SereineJogakuin: GenerationGroup(id: .wave2020SereineJogakuin, names: [.en: "2020 Wave: August 6", .ja: "2020年8月6日デビュー"], members: [.asahina, .suo, .todo, .kitakoji, .nishizono], agency: .nijisanji),
    .wave2021: GenerationGroup(id: .wave2021, names: [.en: "2021 Wave", .ja: "2021年デビュー"], members: [.lauren, .leos, .oliver, .lain], agency: .nijisanji),
    .wave2022Ranunculus: GenerationGroup(id: .wave2022Ranunculus, names: [.en: "Ranunculus", .ja: "Ranunculus"], members: [.amagase, .ponto, .umise], agency: .nijisanji),
    .wave2022May21: GenerationGroup(id: .wave2022May21, names: [.en: "2022 Wave: May 21", .ja: "2022年05月21日デビュー"], members: [.hyakumantenbara], agency: .nijisanji),
    .wave2022Voltaction: GenerationGroup(id: .wave2022Voltaction, names: [.en: "VOLTACTION", .ja: "VOLTACTION"], members: [.fura, .watarai, .shikinagi, .seraph], agency: .nijisanji),
    .wave2023Jan16: GenerationGroup(id: .wave2023Jan16, names: [.en: "2023 Wave: January 16", .ja: "2023年01月16日デビュー"], members: [.koshimizu, .shishido, .kaburaiki, .igarashi, .ishigami, .sophia, .kuramochi], agency: .nijisanji),
    .wave2023Mar30: GenerationGroup(id: .wave2023Mar30, names: [.en: "2023 Wave: March 30", .ja: "2023年03月30日デビュー"], members: [.ittetsu, .wen, .rito, .mana], agency: .nijisanji),
    .wave2023Apr26: GenerationGroup(id: .wave2023Apr26, names: [.en: "2023 Wave: April 26", .ja: "2023年04月26日デビュー"], members: [.sho, .kagetsu, .rou, .raiInami], agency: .nijisanji),
    .wave2023Nov21: GenerationGroup(id: .wave2023Apr26, names: [.en: "2023 Wave: November 21", .ja: "2023年11月21日デビュー"], members: [.totoTachitsute, .ruri, .kestrel], agency: .nijisanji),
    .id1stWave: GenerationGroup(id: .id1stWave, names: [.en: "ID 1st Wave", .ja: "ID 1期生"], members: [.hana], agency: .nijisanji),
    .id2ndWave: GenerationGroup(id: .id2ndWave, names: [.en: "ID 2nd Wave", .ja: "ID 2期生"], members: [.rai, .riksa], agency: .nijisanji),
    .id3rdWave: GenerationGroup(id: .id3rdWave, names: [.en: "ID 3rd Wave", .ja: "ID 3期生"], members: [.layla], agency: .nijisanji),
    .id4thWave: GenerationGroup(id: .id4thWave, names: [.en: "ID 4th Wave", .ja: "ID 4期生"], members: [.etna, .bonnivier], agency: .nijisanji),
    .id5thWave: GenerationGroup(id: .id5thWave, names: [.en: "ID 5th Wave", .ja: "ID 5期生"], members: [.nagisa, .derem, .reza], agency: .nijisanji),
    .kr1stWave: GenerationGroup(id: .kr1stWave, names: [.en: "KR 1st Wave", .ja: "KR 1期生"], members: [.minSuha, .gaon], agency: .nijisanji),
    .kr2ndWave: GenerationGroup(id: .kr2ndWave, names: [.en: "KR 2nd Wave", .ja: "KR 2期生"], members: [.soNagi], agency: .nijisanji),
    .kr3rdWave: GenerationGroup(id: .kr3rdWave, names: [.en: "KR 3rd Wave", .ja: "KR 3期生"], members: [.akiraRay, .leeRoha], agency: .nijisanji),
    .kr4thWave: GenerationGroup(id: .kr4thWave, names: [.en: "KR 4th Wave", .ja: "KR 4期生"], members: [.yangNari, .ryuHari, .ohJiyu], agency: .nijisanji),
    .kr5thWave: GenerationGroup(id: .kr5thWave, names: [.en: "KR 5th Wave", .ja: "KR 5期生"], members: [.seffyna, .banHada], agency: .nijisanji),
    .kr6thWave: GenerationGroup(id: .kr6thWave, names: [.en: "KR 6th Wave", .ja: "KR 6期生"], members: [.haYun, .naSera], agency: .nijisanji),
    .en1stWave: GenerationGroup(id: .en1stWave, names: [.en: "EN 1st Wave: LazuLight", .ja: "EN 第1弾「LazuLight」"], members: [.elira, .finana], agency: .nijisanji),
    .en2ndWave: GenerationGroup(id: .en2ndWave, names: [.en: "EN 2nd Wave: OBSYDIA", .ja: "EN 第2弾「OBSYDIA」"], members: [.rosemi, .petra], agency: .nijisanji),
    .en3rdWave: GenerationGroup(id: .en3rdWave, names: [.en: "EN 3rd Wave: Ethyria", .ja: "EN 第3弾「Ethyria」"], members: [.millie, .enna, .reimu], agency: .nijisanji),
    .en4thWave: GenerationGroup(id: .en4thWave, names: [.en: "EN 4th Wave: Luxiem", .ja: "EN 第4弾「Luxiem」"], members: [.luca, .shu, .ike, .vox], agency: .nijisanji),
    .en5thWave: GenerationGroup(id: .en5thWave, names: [.en: "EN 5th Wave: Noctyx", .ja: "EN 第5弾「Noctyx」"], members: [.sonny, .uki, .alban, .fulgur], agency: .nijisanji),
    .en6thWave: GenerationGroup(id: .en6thWave, names: [.en: "EN 6th Wave: ILUNA", .ja: "EN 第6弾「ILUNA」"], members: [.maria, .aster, .aia, .ren, .scarle], agency: .nijisanji),
    .en7thWave: GenerationGroup(id: .en7thWave, names: [.en: "EN 7th Wave: XSOLEIL", .ja: "EN 第7弾「XSOLEIL」"], members: [.doppio, .meloco, .hex, .kotoka, .ver], agency: .nijisanji),
    .en8thWave: GenerationGroup(id: .en8thWave, names: [.en: "EN 8th Wave: Krisis", .ja: "EN 第8弾「Krisis」"], members: [.wilson, .bringer, .bandage], agency: .nijisanji),
    .en9thWave: GenerationGroup(id: .en9thWave, names: [.en: "EN October 2023", .ja: "EN 2023年10月"], members: [.clawmark, .brightshield, .nakasato], agency: .nijisanji),
    .nijisanjiOfficial: GenerationGroup(id: .nijisanjiOfficial, names: [.en: "Nijisanji Official Channels", .ja: "にじさんじ公式チャンネル"], members: [.nijisanji, .nijisanjiID, .nijisanjiEN, .virtual, .voltacation, .luxiem, .rofmao, .nornis, .chronoir], agency: .nijisanji),
    
    // MARK: - Re:AcT
    .reAliz: GenerationGroup(id: .reAliz, names: [.en: "ReAliz", .ja: "ReAliz"], members: [.leona, .mia, .rose, .lisa], agency: .react),
    .kaleidscope: GenerationGroup(id: .kaleidscope, names: [.en: "kaleidscope", .ja: "kaleidscope"], members: [.yuno, .hanabasami, .suu], agency: .react),
    .sinkirow: GenerationGroup(id: .sinkirow, names: [.en: "sinkirow", .ja: "sinkirow"], members: [.tsukimi, .yukino, .lie], agency: .react),
    .parfait: GenerationGroup(id: .parfait, names: [.en: "Parfait", .ja: "Parfait"], members: [.kanau, .hano, .aria], agency: .react),
    .reMixx: GenerationGroup(id: .reMixx, names: [.en: "Re:Mixx", .ja: "Re:Mixx"], members: [.creil, .nemu, .taran], agency: .react),
    .reactOfficial: GenerationGroup(id: .reactOfficial, names: [.en: "Re:AcT Official Channels", .ja: "Re:AcT公式チャンネル"], members: [.reactOfficial], agency: .react),
    
    // MARK: - 774 inc
    .nanashiInc: GenerationGroup(id: .nanashiInc, names: [.en: "774 inc.", .ja: "ななしいんく"], members: [.haneru, .ran, .kuku, .izumi, .rui, .hikari, .chiroru, .konanMia, .sekishiroMiko, .charlotte, .mary, .chris, .rin, .mei, .tier, .ichika, .anna, .yuge, .kanon, .annko, .amaui, .uruuIna, .mashu], agency: .nanashiInc),
    .nanashiOfficial: GenerationGroup(id: .nanashiOfficial, names: [.en: "774 inc. Official Channels", .ja: "774 inc. 公式チャンネル"], members: [.nanashiOfficial], agency: .nanashiInc),
    
    // MARK: - Nori Pro
    .noriProSolo: GenerationGroup(id: .noriProSolo, names: [.en: "Nori Pro", .ja: "のりプロ"], members: [.tamaki], agency: .noriPro),
    .noriPro1stGen: GenerationGroup(id: .noriPro1stGen, names: [.en: "1st Gen", .ja: "一期生"], members: [.mishiro, .miruku, .takuma, .yuzuru], agency: .noriPro),
    .noriProGamers: GenerationGroup(id: .noriProGamers, names: [.en: "Gamers", .ja: "ゲーマーズ"], members: [.inariIroha, .lionheart, .shin], agency: .noriPro),
    
    // MARK: - VSpo
    .lupinus: GenerationGroup(id: .lupinus, names: [.en: "Lupinus Virtual Games", .ja: "Lupinus Virtual Games"], members: [.uruha, .toto, .sumire, .nazuna], agency: .vspo),
    .iris: GenerationGroup(id: .iris, names: [.en: "Iris Black Games", .ja: "Iris Black Games"], members: [.noa, .hinano, .renKisaragi], agency: .vspo),
    .cattleya: GenerationGroup(id: .cattleya, names: [.en: "Cattleya Regina Games", .ja: "Cattleya Regina Games"], members: [.mimi, .sena, .risa], agency: .vspo),
    .vspo: GenerationGroup(id: .vspo, names: [.en: "VSpo", .ja: "ぶいすぽ"], members: [.qpi, .beni, .ema, .runa, .tsuna, .ramune, .met, .yumenoAkari, .kuromu], agency: .vspo),
    .vspoOfficial: GenerationGroup(id: .vspoOfficial, names: [.en: "VSpo Official Channel", .ja: "ぶいすぽっ! 公式チャンネル"], members: [.vspoOfficial], agency: .vspo),
    
    // Need to change this once indies are implemented
    .other: GenerationGroup(id: .other, names: [.en: "Other", .ja: "他"], members: [], agency: .hololive)
]
