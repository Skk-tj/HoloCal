//
//  Talents.swift
//  holo-wtf
//
//  Created by ??? on 2022-04-02.
//

import Foundation
import OrderedCollections

enum HololiveGeneration: Int, CaseIterable, Codable, Hashable {
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
        return hololiveTalentsByGeneration[self]!.localizedName
    }
    
    func getAltLocalizedName() -> String {
        return hololiveTalentsByGeneration[self]!.altLocalizedName
    }
}

enum HololiveTalentEnum: String, Codable {
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

extension HololiveTalentEnum: Identifiable {
    var id: String { rawValue }
}

let hololiveTalentEnumToTalent: [HololiveTalentEnum: HololiveTalent] = [
    // MARK: - 0th gen
    .sora: HololiveTalent(id: HololiveTalentEnum.sora.rawValue, names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: HololiveGeneration.zerothGen),
    .roboco: HololiveTalent(id: HololiveTalentEnum.roboco.rawValue, names: [.en: "Robocosan", .ja: "ロボ子さん"], inGeneration: HololiveGeneration.zerothGen),
    .azki: HololiveTalent(id: HololiveTalentEnum.azki.rawValue, names: [.en: "AZKi", .ja: "AZKi"], inGeneration: HololiveGeneration.zerothGen),
    .miko: HololiveTalent(id: HololiveTalentEnum.miko.rawValue, names: [.en: "Sakura Miko", .ja: "さくらみこ"], inGeneration: HololiveGeneration.zerothGen),
    .suisei: HololiveTalent(id: HololiveTalentEnum.suisei.rawValue, names: [.en: "Hoshimachi Suisei", .ja: "星街すいせい"], inGeneration: HololiveGeneration.zerothGen),
    
    // MARK: - 1st gen
    .mel: HololiveTalent(id: HololiveTalentEnum.mel.rawValue, names: [.en: "Yozora Mel", .ja: "夜空メル"], inGeneration: HololiveGeneration.firstGen),
    .aki: HololiveTalent(id: HololiveTalentEnum.aki.rawValue, names: [.en: "Aki Rosenthal", .ja: "アキ・ローゼンタール"], inGeneration: HololiveGeneration.firstGen),
    .haato: HololiveTalent(id: HololiveTalentEnum.haato.rawValue, names: [.en: "Akai Haato", .ja: "赤井はあと"], inGeneration: HololiveGeneration.firstGen),
    .fubuki: HololiveTalent(id: HololiveTalentEnum.fubuki.rawValue, names: [.en: "Shirakami Fubuki", .ja: "白上フブキ"], inGeneration: HololiveGeneration.firstGen),
    .matsuri: HololiveTalent(id: HololiveTalentEnum.matsuri.rawValue, names: [.en: "Natsuiro Matsuri", .ja: "夏色まつり"], inGeneration: HololiveGeneration.firstGen),
    
    // MARK: - 2nd gen
    .aqua: HololiveTalent(id: HololiveTalentEnum.aqua.rawValue, names: [.en: "Minato Aqua", .ja: "湊あくあ"], inGeneration: HololiveGeneration.secondGen),
    .shion: HololiveTalent(id: HololiveTalentEnum.shion.rawValue, names: [.en: "Murasaki Shion", .ja: "紫咲シオン"], inGeneration: HololiveGeneration.secondGen),
    .ayame: HololiveTalent(id: HololiveTalentEnum.ayame.rawValue, names: [.en: "Nakiri Ayame", .ja: "百鬼あやめ"], inGeneration: HololiveGeneration.secondGen),
    .choco: HololiveTalent(id: HololiveTalentEnum.choco.rawValue, names: [.en: "Yuzuki Choco", .ja: "癒月ちょこ"], inGeneration: HololiveGeneration.secondGen),
    .subaru: HololiveTalent(id: HololiveTalentEnum.subaru.rawValue, names: [.en: "Oozora Subaru", .ja: "大空スバル"], inGeneration: HololiveGeneration.secondGen),
    
    // MARK: - Gamers
    .mio: HololiveTalent(id: HololiveTalentEnum.mio.rawValue, names: [.en: "Ookami Mio", .ja: "大神ミオ"], inGeneration: HololiveGeneration.gamers),
    .okayu: HololiveTalent(id: HololiveTalentEnum.okayu.rawValue, names: [.en: "Nekomata Okayu", .ja: "猫又おかゆ"], inGeneration: HololiveGeneration.gamers),
    .korone: HololiveTalent(id: HololiveTalentEnum.korone.rawValue, names: [.en: "Inugami Korone", .ja: "戌神ころね"], inGeneration: HololiveGeneration.gamers),
    
    // MARK: - 3rd gen
    .pekora: HololiveTalent(id: HololiveTalentEnum.pekora.rawValue, names: [.en: "Usada Pekora", .ja: "兎田ぺこら"], inGeneration: HololiveGeneration.thirdGen),
    .flare: HololiveTalent(id: HololiveTalentEnum.flare.rawValue, names: [.en: "Shiranui Flare", .ja: "不知火フレア"], inGeneration: HololiveGeneration.thirdGen),
    .noel: HololiveTalent(id: HololiveTalentEnum.noel.rawValue, names: [.en: "Shirogane Noel", .ja: "白銀ノエル"], inGeneration: HololiveGeneration.thirdGen),
    .marine: HololiveTalent(id: HololiveTalentEnum.marine.rawValue, names: [.en: "Houshou Marine", .ja: "宝鐘マリン"], inGeneration: HololiveGeneration.thirdGen),
    
    // MARK: - 4th gen
    .kanata: HololiveTalent(id: HololiveTalentEnum.kanata.rawValue, names: [.en: "Amane Kanata", .ja: "天音かなた"], inGeneration: HololiveGeneration.forthGen),
    .watame: HololiveTalent(id: HololiveTalentEnum.watame.rawValue, names: [.en: "Tsunomaki Watame", .ja: "角巻わため"], inGeneration: HololiveGeneration.forthGen),
    .towa: HololiveTalent(id: HololiveTalentEnum.towa.rawValue, names: [.en: "Tokoyami Towa", .ja: "常闇トワ"], inGeneration: HololiveGeneration.forthGen),
    .luna: HololiveTalent(id: HololiveTalentEnum.luna.rawValue, names: [.en: "Himemori Luna", .ja: "姫森ルーナ"], inGeneration: HololiveGeneration.forthGen),
    
    // MARK: - 5th gen
    .lamy: HololiveTalent(id: HololiveTalentEnum.lamy.rawValue, names: [.en: "Yukihana Lamy", .ja: "雪花ラミィ"], inGeneration: HololiveGeneration.fifthGen),
    .nene: HololiveTalent(id: HololiveTalentEnum.nene.rawValue, names: [.en: "Momosuzu Nene", .ja: "桃鈴ねね"], inGeneration: HololiveGeneration.fifthGen),
    .botan: HololiveTalent(id: HololiveTalentEnum.botan.rawValue, names: [.en: "Shishiro Botan", .ja: "獅白ぼたん"], inGeneration: HololiveGeneration.fifthGen),
    .polka: HololiveTalent(id: HololiveTalentEnum.polka.rawValue, names: [.en: "Omaru Polka", .ja: "尾丸ポルカ"], inGeneration: HololiveGeneration.fifthGen),
    
    // MARK: - holoX
    .laplus: HololiveTalent(id: HololiveTalentEnum.laplus.rawValue, names: [.en: "La+ Darknesss", .ja: "ラプラス・ダークネス"], inGeneration: HololiveGeneration.holox),
    .lui: HololiveTalent(id: HololiveTalentEnum.lui.rawValue, names: [.en: "Takane Lui", .ja: "鷹嶺ルイ"], inGeneration: HololiveGeneration.holox),
    .koyori: HololiveTalent(id: HololiveTalentEnum.koyori.rawValue, names: [.en: "Hakui Koyori", .ja: "博衣こより"], inGeneration: HololiveGeneration.holox),
    .chloe: HololiveTalent(id: HololiveTalentEnum.chloe.rawValue, names: [.en: "Sakamata Chloe", .ja: "沙花叉クロヱ"], inGeneration: HololiveGeneration.holox),
    .iroha: HololiveTalent(id: HololiveTalentEnum.iroha.rawValue, names: [.en: "Kazama Iroha", .ja: "風真いろは"], inGeneration: HololiveGeneration.holox),
    
    // MARK: - ID 1st gen
    .risu: HololiveTalent(id: HololiveTalentEnum.risu.rawValue, names: [.en: "Ayunda Risu", .ja: "アユンダ・リス"], inGeneration: HololiveGeneration.idFirstGen),
    .moona: HololiveTalent(id: HololiveTalentEnum.moona.rawValue, names: [.en: "Moona Hoshinova", .ja: "ムーナ・ホシノヴァ"], inGeneration: HololiveGeneration.idFirstGen),
    .iofi: HololiveTalent(id: HololiveTalentEnum.iofi.rawValue, names: [.en: "Airani Iofifteen", .ja: "アイラニ・イオフィフティーン"], inGeneration: HololiveGeneration.idFirstGen),
    
    // MARK: - ID 2nd gen
    .ollie: HololiveTalent(id: HololiveTalentEnum.ollie.rawValue, names: [.en: "Kureiji Ollie", .ja: "クレイジー・オリー"], inGeneration: HololiveGeneration.idThirdGen),
    .anya: HololiveTalent(id: HololiveTalentEnum.anya.rawValue, names: [.en: "Anya Melfissa", .ja: "アーニャ・メルフィッサ"], inGeneration: HololiveGeneration.idThirdGen),
    .reine: HololiveTalent(id: HololiveTalentEnum.reine.rawValue, names: [.en: "Pavolia Reine", .ja: "パヴォリア・レイネ"], inGeneration: HololiveGeneration.idThirdGen),
    
    // MARK: - ID 3rd gen
    .zeta: HololiveTalent(id: HololiveTalentEnum.zeta.rawValue, names: [.en: "KVestia Zeta", .ja: "ベスティア・ゼータ"], inGeneration: HololiveGeneration.idThirdGen),
    .kaela: HololiveTalent(id: HololiveTalentEnum.kaela.rawValue, names: [.en: "Kaela Kovalskia", .ja: "カエラ・コヴァルスキア"], inGeneration: HololiveGeneration.idThirdGen),
    .kobo: HololiveTalent(id: HololiveTalentEnum.kobo.rawValue, names: [.en: "Kobo Kanaeru", .ja: "こぼ・かなえる"], inGeneration: HololiveGeneration.idThirdGen),
    
    // MARK: - EN Myth
    .mori: HololiveTalent(id: HololiveTalentEnum.mori.rawValue, names: [.en: "Mori Calliope", .ja: "森カリオペ"], inGeneration: HololiveGeneration.enMyth),
    .kiara: HololiveTalent(id: HololiveTalentEnum.kiara.rawValue, names: [.en: "Takanashi Kiara", .ja: "小鳥遊キアラ"], inGeneration: HololiveGeneration.enMyth),
    .ina: HololiveTalent(id: HololiveTalentEnum.ina.rawValue, names: [.en: "Ninomae Ina'nis", .ja: "一伊那尓栖"], inGeneration: HololiveGeneration.enMyth),
    .gura: HololiveTalent(id: HololiveTalentEnum.gura.rawValue, names: [.en: "Gawr Gura", .ja: "がうる・ぐら"], inGeneration: HololiveGeneration.enMyth),
    .ame: HololiveTalent(id: HololiveTalentEnum.ame.rawValue, names: [.en: "Watson Amelia", .ja: "ワトソン・アメリア"], inGeneration: HololiveGeneration.enMyth),
    
    // MARK: - Project: HOPE
    .irys: HololiveTalent(id: HololiveTalentEnum.irys.rawValue, names: [.en: "IRyS", .ja: "アイリス"], inGeneration: HololiveGeneration.projectHope),
    
    // MARK: - EN Council
    .ceres: HololiveTalent(id: HololiveTalentEnum.ceres.rawValue, names: [.en: "Ceres Fauna", .ja: "セレス・ファウナ"], inGeneration: HololiveGeneration.enCouncil),
    .kronii: HololiveTalent(id: HololiveTalentEnum.kronii.rawValue, names: [.en: "Ouro Kronii", .ja: "オーロ・クロニー"], inGeneration: HololiveGeneration.enCouncil),
    .mumei: HololiveTalent(id: HololiveTalentEnum.mumei.rawValue, names: [.en: "Nanashi Mumei", .ja: "七詩ムメイ"], inGeneration: HololiveGeneration.enCouncil),
    .baelz: HololiveTalent(id: HololiveTalentEnum.baelz.rawValue, names: [.en: "Hakos Baelz", .ja: "ハコス・ベールズ"], inGeneration: HololiveGeneration.enCouncil),
    
    // MARK: - holostars 1st gen
    .miyabi: HololiveTalent(id: HololiveTalentEnum.miyabi.rawValue, names: [.en: "Hanasaki Miyabi", .ja: "花咲みやび"], inGeneration: HololiveGeneration.starsFirstGen),
    .izuru: HololiveTalent(id: HololiveTalentEnum.izuru.rawValue, names: [.en: "Kanade Izuru", .ja: "奏手イヅル"], inGeneration: HololiveGeneration.starsFirstGen),
    .arurandeisu: HololiveTalent(id: HololiveTalentEnum.arurandeisu.rawValue, names: [.en: "Arurandeisu", .ja: "アルランディス"], inGeneration: HololiveGeneration.starsFirstGen),
    .rikka: HololiveTalent(id: HololiveTalentEnum.rikka.rawValue, names: [.en: "Rikka", .ja: "律可"], inGeneration: HololiveGeneration.starsFirstGen),
    
    // MARK: - holostars 2nd gen
    .astel: HololiveTalent(id: HololiveTalentEnum.astel.rawValue, names: [.en: "Astel Leda", .ja: "アステル・レダ"], inGeneration: HololiveGeneration.starsSecondGen),
    .temma: HololiveTalent(id: HololiveTalentEnum.temma.rawValue, names: [.en: "Kishido Temma", .ja: "岸堂天真"], inGeneration: HololiveGeneration.starsSecondGen),
    .roberu: HololiveTalent(id: HololiveTalentEnum.roberu.rawValue, names: [.en: "Yukoku Roberu", .ja: "夕刻ロベル"], inGeneration: HololiveGeneration.starsSecondGen),
    
    // MARK: - holostars 3rd gen
    .shien: HololiveTalent(id: HololiveTalentEnum.shien.rawValue, names: [.en: "Kageyama Shien", .ja: "影山シエン"], inGeneration: HololiveGeneration.starsThirdGen),
    .oga: HololiveTalent(id: HololiveTalentEnum.oga.rawValue, names: [.en: "Aragami Oga", .ja: "荒咬オウガ"], inGeneration: HololiveGeneration.starsThirdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: HololiveTalent(id: HololiveTalentEnum.fuma.rawValue, names: [.en: "Yatogami Fuma", .ja: "夜十神封魔"], inGeneration: HololiveGeneration.uproar),
    .uyu: HololiveTalent(id: HololiveTalentEnum.uyu.rawValue, names: [.en: "Utsugi Uyu", .ja: "羽継烏有"], inGeneration: HololiveGeneration.uproar),
    .gamma: HololiveTalent(id: HololiveTalentEnum.gamma.rawValue, names: [.en: "Hizaki Gamma", .ja: "緋崎ガンマ"], inGeneration: HololiveGeneration.uproar),
    .rio: HololiveTalent(id: HololiveTalentEnum.rio.rawValue, names: [.en: "Minase Rio", .ja: "水無世燐央"], inGeneration: HololiveGeneration.uproar),
    
    // MARK: - holostars TEMPUS
    .altare: HololiveTalent(id: HololiveTalentEnum.altare.rawValue, names: [.en: "Regis Altare", .ja: "リージス・アルテア"], inGeneration: HololiveGeneration.tempus),
    .vesper: HololiveTalent(id: HololiveTalentEnum.vesper.rawValue, names: [.en: "Noir Vesper", .ja: "ノワール・ヴェスパー"], inGeneration: HololiveGeneration.tempus),
    .syrios: HololiveTalent(id: HololiveTalentEnum.syrios.rawValue, names: [.en: "Axel Syrios", .ja: "アクセル・シリオス"], inGeneration: HololiveGeneration.tempus),
    .dezmond: HololiveTalent(id: HololiveTalentEnum.dezmond.rawValue, names: [.en: "Magni Dezmond", .ja: "マグニ・デズモンド"], inGeneration: HololiveGeneration.tempus),
    
    // MARK: - Official Channels
    .hololive: HololiveTalent(id: HololiveTalentEnum.hololive.rawValue, names: [.en: "hololive", .ja: "ホロライブ"], inGeneration: HololiveGeneration.official),
    .hololiveEN: HololiveTalent(id: HololiveTalentEnum.hololiveEN.rawValue, names: [.en: "hololive English", .ja: "hololive English"], inGeneration: HololiveGeneration.official),
    .hololiveID: HololiveTalent(id: HololiveTalentEnum.hololiveID.rawValue, names: [.en: "hololive Indonesia", .ja: "hololive Indonesia"], inGeneration: HololiveGeneration.official),
    .holostars: HololiveTalent(id: HololiveTalentEnum.holostars.rawValue, names: [.en: "holostars", .ja: "ホロスターズ"], inGeneration: HololiveGeneration.official),
    .midnight: HololiveTalent(id: HololiveTalentEnum.midnight.rawValue, names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: HololiveGeneration.official)
]

let hololiveTalentsByGeneration: OrderedDictionary<HololiveGeneration, HololiveGenerationGroup> = [
    .zerothGen: HololiveGenerationGroup(id: .zerothGen, names: [.en: "0th gen", .ja: "0期生"], members: [.sora, .roboco, .azki, .miko, .suisei]),
    .firstGen: HololiveGenerationGroup(id: .firstGen, names: [.en: "1st gen", .ja: "1期生"], members: [.mel, .aki, .haato, .fubuki, .matsuri]),
    .secondGen: HololiveGenerationGroup(id: .secondGen, names: [.en: "2nd gen", .ja: "2期生"], members: [.aqua, .shion, .ayame, .choco, .subaru]),
    .gamers: HololiveGenerationGroup(id: .gamers, names: [.en: "Gamers", .ja: "ゲーマーズ"], members: [.mio, .okayu, .korone]),
    .thirdGen: HololiveGenerationGroup(id: .thirdGen, names: [.en: "3rd gen", .ja: "3期生"], members: [.pekora, .flare, .noel, .marine]),
    .forthGen: HololiveGenerationGroup(id: .forthGen, names: [.en: "4th gen", .ja: "4期生"], members: [.kanata, .watame, .towa, .luna]),
    .fifthGen: HololiveGenerationGroup(id: .fifthGen, names: [.en: "5th gen", .ja: "5期生"], members: [.lamy, .nene, .botan, .polka]),
    .holox: HololiveGenerationGroup(id: .holox, names: [.en: "holoX", .ja: "秘密結社holoX"], members: [.laplus, .lui, .koyori, .chloe, .iroha]),
    .idFirstGen: HololiveGenerationGroup(id: .idFirstGen, names: [.en: "ID 1st gen", .ja: "ID 1期生"], members: [.risu, .moona, .iofi]),
    .idSecondGen: HololiveGenerationGroup(id: .idSecondGen, names: [.en: "ID 2nd gen", .ja: "ID 2期生"], members: [.ollie, .anya, .reine]),
    .idThirdGen: HololiveGenerationGroup(id: .idThirdGen, names: [.en: "ID 3rd gen", .ja: "ID 3期生"], members: [.zeta, .kaela, .kobo]),
    .enMyth: HololiveGenerationGroup(id: .enMyth, names: [.en: "hololive English -Myth-", .ja: "hololive English -Myth-"], members: [.mori, .kiara, .ina, .gura, .ame]),
    .projectHope: HololiveGenerationGroup(id: .projectHope, names: [.en: "Project: HOPE", .ja: "Project: HOPE"], members: [.irys]),
    .enCouncil: HololiveGenerationGroup(id: .enCouncil, names: [.en: "hololive English -Council-", .ja: "hololive English -議会-"], members: [.ceres, .kronii, .mumei, .baelz]),
    .starsFirstGen: HololiveGenerationGroup(id: .starsFirstGen, names: [.en: "holostars 1st gen", .ja: "ホロスターズ 1期生"], members: [.miyabi, .izuru, .arurandeisu, .rikka]),
    .starsSecondGen: HololiveGenerationGroup(id: .starsSecondGen, names: [.en: "holostars 2nd gen", .ja: "ホロスターズ 2期生"], members: [.astel, .temma, .roberu]),
    .starsThirdGen: HololiveGenerationGroup(id: .starsThirdGen, names: [.en: "holostars 3nd gen", .ja: "ホロスターズ 3期生"], members: [.shien, .oga]),
    .uproar: HololiveGenerationGroup(id: .uproar, names: [.en: "holostars UPROAR!!", .ja: "ホロスターズ アップロー!!"], members: [.fuma, .uyu, .gamma, .rio]),
    .tempus: HololiveGenerationGroup(id: .tempus, names: [.en: "HOLOSTARS English -TEMPUS-", .ja: "HOLOSTARS English -TEMPUS-"], members: [.altare, .dezmond, .syrios, .vesper]),
    .official: HololiveGenerationGroup(id: .official, names: [.en: "Official Channels", .ja: "公式チャンネル"], members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight])
]
