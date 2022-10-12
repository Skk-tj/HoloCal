//
//  Talents.swift
//  holo-wtf
//
//  Created by ??? on 2022-04-02.
//

import Foundation
import OrderedCollections

enum hololiveGenerations: Int, Codable, CaseIterable, Hashable {
    case zerothGen
    case firstGen
    case secondGen
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
    case official
    
    // For all the channels that we may not recognize
    case other
    
    func getLocalizedName() -> String {
        return talentsByGeneration[self]!.localizedName
    }
    
    func getAltLocalizedName() -> String {
        return talentsByGeneration[self]!.altLocalizedName
    }
}

enum hololiveTalents: String, Codable {
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
}

extension hololiveTalents: Identifiable {
    var id: String { rawValue }
}

let hololiveTalentsEnumToTalent: [hololiveTalents: Talent] = [
    // MARK: - 0th gen
    .sora: Talent(id: hololiveTalents.sora.rawValue, names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: .zerothGen),
    .roboco: Talent(id: hololiveTalents.roboco.rawValue, names: [.en: "Robocosan", .ja: "ロボ子さん"], inGeneration: .zerothGen),
    .azki: Talent(id: hololiveTalents.azki.rawValue, names: [.en: "AZKi", .ja: "AZKi"], inGeneration: .zerothGen),
    .miko: Talent(id: hololiveTalents.miko.rawValue, names: [.en: "Sakura Miko", .ja: "さくらみこ"], inGeneration: .zerothGen),
    .suisei: Talent(id: hololiveTalents.suisei.rawValue, names: [.en: "Hoshimachi Suisei", .ja: "星街すいせい"], inGeneration: .zerothGen),
    
    // MARK: - 1st gen
    .mel: Talent(id: hololiveTalents.mel.rawValue, names: [.en: "Yozora Mel", .ja: "夜空メル"], inGeneration: .firstGen),
    .aki: Talent(id: hololiveTalents.aki.rawValue, names: [.en: "Aki Rosenthal", .ja: "アキ・ローゼンタール"], inGeneration: .firstGen),
    .haato: Talent(id: hololiveTalents.haato.rawValue, names: [.en: "Akai Haato", .ja: "赤井はあと"], inGeneration: .firstGen),
    .fubuki: Talent(id: hololiveTalents.fubuki.rawValue, names: [.en: "Shirakami Fubuki", .ja: "白上フブキ"], inGeneration: .firstGen),
    .matsuri: Talent(id: hololiveTalents.matsuri.rawValue, names: [.en: "Natsuiro Matsuri", .ja: "夏色まつり"], inGeneration: .firstGen),
    
    // MARK: - 2nd gen
    .aqua: Talent(id: hololiveTalents.aqua.rawValue, names: [.en: "Minato Aqua", .ja: "湊あくあ"], inGeneration: .secondGen),
    .shion: Talent(id: hololiveTalents.shion.rawValue, names: [.en: "Murasaki Shion", .ja: "紫咲シオン"], inGeneration: .secondGen),
    .ayame: Talent(id: hololiveTalents.ayame.rawValue, names: [.en: "Nakiri Ayame", .ja: "百鬼あやめ"], inGeneration: .secondGen),
    .choco: Talent(id: hololiveTalents.choco.rawValue, names: [.en: "Yuzuki Choco", .ja: "癒月ちょこ"], inGeneration: .secondGen),
    .subaru: Talent(id: hololiveTalents.subaru.rawValue, names: [.en: "Oozora Subaru", .ja: "大空スバル"], inGeneration: .secondGen),
    
    // MARK: - Gamers
    .mio: Talent(id: hololiveTalents.mio.rawValue, names: [.en: "Ookami Mio", .ja: "大神ミオ"], inGeneration: .gamers),
    .okayu: Talent(id: hololiveTalents.okayu.rawValue, names: [.en: "Nekomata Okayu", .ja: "猫又おかゆ"], inGeneration: .gamers),
    .korone: Talent(id: hololiveTalents.korone.rawValue, names: [.en: "Inugami Korone", .ja: "戌神ころね"], inGeneration: .gamers),
    
    // MARK: - 3rd gen
    .pekora: Talent(id: hololiveTalents.pekora.rawValue, names: [.en: "Usada Pekora", .ja: "兎田ぺこら"], inGeneration: .thirdGen),
    .flare: Talent(id: hololiveTalents.flare.rawValue, names: [.en: "Shiranui Flare", .ja: "不知火フレア"], inGeneration: .thirdGen),
    .noel: Talent(id: hololiveTalents.noel.rawValue, names: [.en: "Shirogane Noel", .ja: "白銀ノエル"], inGeneration: .thirdGen),
    .marine: Talent(id: hololiveTalents.marine.rawValue, names: [.en: "Houshou Marine", .ja: "宝鐘マリン"], inGeneration: .thirdGen),
    
    // MARK: - 4th gen
    .kanata: Talent(id: hololiveTalents.kanata.rawValue, names: [.en: "Amane Kanata", .ja: "天音かなた"], inGeneration: .forthGen),
    .watame: Talent(id: hololiveTalents.watame.rawValue, names: [.en: "Tsunomaki Watame", .ja: "角巻わため"], inGeneration: .forthGen),
    .towa: Talent(id: hololiveTalents.towa.rawValue, names: [.en: "Tokoyami Towa", .ja: "常闇トワ"], inGeneration: .forthGen),
    .luna: Talent(id: hololiveTalents.luna.rawValue, names: [.en: "Himemori Luna", .ja: "姫森ルーナ"], inGeneration: .forthGen),
    
    // MARK: - 5th gen
    .lamy: Talent(id: hololiveTalents.lamy.rawValue, names: [.en: "Yukihana Lamy", .ja: "雪花ラミィ"], inGeneration: .fifthGen),
    .nene: Talent(id: hololiveTalents.nene.rawValue, names: [.en: "Momosuzu Nene", .ja: "桃鈴ねね"], inGeneration: .fifthGen),
    .botan: Talent(id: hololiveTalents.botan.rawValue, names: [.en: "Shishiro Botan", .ja: "獅白ぼたん"], inGeneration: .fifthGen),
    .polka: Talent(id: hololiveTalents.polka.rawValue, names: [.en: "Omaru Polka", .ja: "尾丸ポルカ"], inGeneration: .fifthGen),
    
    // MARK: - holoX
    .laplus: Talent(id: hololiveTalents.laplus.rawValue, names: [.en: "La+ Darknesss", .ja: "ラプラス・ダークネス"], inGeneration: .holox),
    .lui: Talent(id: hololiveTalents.lui.rawValue, names: [.en: "Takane Lui", .ja: "鷹嶺ルイ"], inGeneration: .holox),
    .koyori: Talent(id: hololiveTalents.koyori.rawValue, names: [.en: "Hakui Koyori", .ja: "博衣こより"], inGeneration: .holox),
    .chloe: Talent(id: hololiveTalents.chloe.rawValue, names: [.en: "Sakamata Chloe", .ja: "沙花叉クロヱ"], inGeneration: .holox),
    .iroha: Talent(id: hololiveTalents.iroha.rawValue, names: [.en: "Kazama Iroha", .ja: "風真いろは"], inGeneration: .holox),
    
    // MARK: - ID 1st gen
    .risu: Talent(id: hololiveTalents.risu.rawValue, names: [.en: "Ayunda Risu", .ja: "アユンダ・リス"], inGeneration: .idFirstGen),
    .moona: Talent(id: hololiveTalents.moona.rawValue, names: [.en: "Moona Hoshinova", .ja: "ムーナ・ホシノヴァ"], inGeneration: .idFirstGen),
    .iofi: Talent(id: hololiveTalents.iofi.rawValue, names: [.en: "Airani Iofifteen", .ja: "アイラニ・イオフィフティーン"], inGeneration: .idFirstGen),
    
    // MARK: - ID 2nd gen
    .ollie: Talent(id: hololiveTalents.ollie.rawValue, names: [.en: "Kureiji Ollie", .ja: "クレイジー・オリー"], inGeneration: .idThirdGen),
    .anya: Talent(id: hololiveTalents.anya.rawValue, names: [.en: "Anya Melfissa", .ja: "アーニャ・メルフィッサ"], inGeneration: .idThirdGen),
    .reine: Talent(id: hololiveTalents.reine.rawValue, names: [.en: "Pavolia Reine", .ja: "パヴォリア・レイネ"], inGeneration: .idThirdGen),
    
    // MARK: - ID 3rd gen
    .zeta: Talent(id: hololiveTalents.zeta.rawValue, names: [.en: "KVestia Zeta", .ja: "ベスティア・ゼータ"], inGeneration: .idThirdGen),
    .kaela: Talent(id: hololiveTalents.kaela.rawValue, names: [.en: "Kaela Kovalskia", .ja: "カエラ・コヴァルスキア"], inGeneration: .idThirdGen),
    .kobo: Talent(id: hololiveTalents.kobo.rawValue, names: [.en: "Kobo Kanaeru", .ja: "こぼ・かなえる"], inGeneration: .idThirdGen),
    
    // MARK: - EN Myth
    .mori: Talent(id: hololiveTalents.mori.rawValue, names: [.en: "Mori Calliope", .ja: "森カリオペ"], inGeneration: .enMyth),
    .kiara: Talent(id: hololiveTalents.kiara.rawValue, names: [.en: "Takanashi Kiara", .ja: "小鳥遊キアラ"], inGeneration: .enMyth),
    .ina: Talent(id: hololiveTalents.ina.rawValue, names: [.en: "Ninomae Ina'nis", .ja: "一伊那尓栖"], inGeneration: .enMyth),
    .gura: Talent(id: hololiveTalents.gura.rawValue, names: [.en: "Gawr Gura", .ja: "がうる・ぐら"], inGeneration: .enMyth),
    .ame: Talent(id: hololiveTalents.ame.rawValue, names: [.en: "Watson Amelia", .ja: "ワトソン・アメリア"], inGeneration: .enMyth),
    
    // MARK: - Project: HOPE
    .irys: Talent(id: hololiveTalents.irys.rawValue, names: [.en: "IRyS", .ja: "アイリス"], inGeneration: .projectHope),
    
    // MARK: - EN Council
    .ceres: Talent(id: hololiveTalents.ceres.rawValue, names: [.en: "Ceres Fauna", .ja: "セレス・ファウナ"], inGeneration: .enCouncil),
    .kronii: Talent(id: hololiveTalents.kronii.rawValue, names: [.en: "Ouro Kronii", .ja: "オーロ・クロニー"], inGeneration: .enCouncil),
    .mumei: Talent(id: hololiveTalents.mumei.rawValue, names: [.en: "Nanashi Mumei", .ja: "七詩ムメイ"], inGeneration: .enCouncil),
    .baelz: Talent(id: hololiveTalents.baelz.rawValue, names: [.en: "Hakos Baelz", .ja: "ハコス・ベールズ"], inGeneration: .enCouncil),
    
    // MARK: - holostars 1st gen
    .miyabi: Talent(id: hololiveTalents.miyabi.rawValue, names: [.en: "Hanasaki Miyabi", .ja: "花咲みやび"], inGeneration: .starsFirstGen),
    .izuru: Talent(id: hololiveTalents.izuru.rawValue, names: [.en: "Kanade Izuru", .ja: "奏手イヅル"], inGeneration: .starsFirstGen),
    .arurandeisu: Talent(id: hololiveTalents.arurandeisu.rawValue, names: [.en: "Arurandeisu", .ja: "アルランディス"], inGeneration: .starsFirstGen),
    .rikka: Talent(id: hololiveTalents.rikka.rawValue, names: [.en: "Rikka", .ja: "律可"], inGeneration: .starsFirstGen),
    
    // MARK: - holostars 2nd gen
    .astel: Talent(id: hololiveTalents.astel.rawValue, names: [.en: "Astel Leda", .ja: "アステル・レダ"], inGeneration: .starsSecondGen),
    .temma: Talent(id: hololiveTalents.temma.rawValue, names: [.en: "Kishido Temma", .ja: "岸堂天真"], inGeneration: .starsSecondGen),
    .roberu: Talent(id: hololiveTalents.roberu.rawValue, names: [.en: "Yukoku Roberu", .ja: "夕刻ロベル"], inGeneration: .starsSecondGen),
    
    // MARK: - holostars 3rd gen
    .shien: Talent(id: hololiveTalents.shien.rawValue, names: [.en: "Kageyama Shien", .ja: "影山シエン"], inGeneration: .starsThirdGen),
    .oga: Talent(id: hololiveTalents.oga.rawValue, names: [.en: "Aragami Oga", .ja: "荒咬オウガ"], inGeneration: .starsThirdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: Talent(id: hololiveTalents.fuma.rawValue, names: [.en: "Yatogami Fuma", .ja: "夜十神封魔"], inGeneration: .uproar),
    .uyu: Talent(id: hololiveTalents.uyu.rawValue, names: [.en: "Utsugi Uyu", .ja: "羽継烏有"], inGeneration: .uproar),
    .gamma: Talent(id: hololiveTalents.gamma.rawValue, names: [.en: "Hizaki Gamma", .ja: "緋崎ガンマ"], inGeneration: .uproar),
    .rio: Talent(id: hololiveTalents.rio.rawValue, names: [.en: "Minase Rio", .ja: "水無世燐央"], inGeneration: .uproar),
    
    // MARK: - holostars TEMPUS
    .altare: Talent(id: hololiveTalents.altare.rawValue, names: [.en: "Regis Altare", .ja: "リージス・アルテア"], inGeneration: .tempus),
    .vesper: Talent(id: hololiveTalents.vesper.rawValue, names: [.en: "Noir Vesper", .ja: "ノワール・ヴェスパー"], inGeneration: .tempus),
    .syrios: Talent(id: hololiveTalents.syrios.rawValue, names: [.en: "Axel Syrios", .ja: "アクセル・シリオス"], inGeneration: .tempus),
    .dezmond: Talent(id: hololiveTalents.dezmond.rawValue, names: [.en: "Magni Dezmond", .ja: "マグニ・デズモンド"], inGeneration: .tempus),
    
    // MARK: - Official Channels
    .hololive: Talent(id: hololiveTalents.hololive.rawValue, names: [.en: "hololive", .ja: "ホロライブ"], inGeneration: .official),
    .hololiveEN: Talent(id: hololiveTalents.hololiveEN.rawValue, names: [.en: "hololive English", .ja: "hololive English"], inGeneration: .official),
    .hololiveID: Talent(id: hololiveTalents.hololiveID.rawValue, names: [.en: "hololive Indonesia", .ja: "hololive Indonesia"], inGeneration: .official),
    .holostars: Talent(id: hololiveTalents.holostars.rawValue, names: [.en: "holostars", .ja: "ホロスターズ"], inGeneration: .official),
    .midnight: Talent(id: hololiveTalents.midnight.rawValue, names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: .official)
]

let talentsByGeneration: OrderedDictionary<hololiveGenerations, GenerationGroup> = [
    .zerothGen: GenerationGroup(id: .zerothGen, names: [.en: "0th gen", .ja: "0期生"], members: [.sora, .roboco, .azki, .miko, .suisei]),
    .firstGen: GenerationGroup(id: .firstGen, names: [.en: "1st gen", .ja: "1期生"], members: [.mel, .aki, .haato, .fubuki, .matsuri]),
    .secondGen: GenerationGroup(id: .secondGen, names: [.en: "2nd gen", .ja: "2期生"], members: [.aqua, .shion, .ayame, .choco, .subaru]),
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
    .official: GenerationGroup(id: .official, names: [.en: "Official Channels", .ja: "公式チャンネル"], members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight])
]
