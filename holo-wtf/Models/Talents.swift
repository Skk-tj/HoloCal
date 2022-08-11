//
//  Talents.swift
//  holo-wtf
//
//  Created by ??? on 2022-04-02.
//

import Foundation

enum GenerationEnum: Int, Codable, CaseIterable {
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
}

enum TalentsEnum: String, Codable {
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

extension TalentsEnum: Identifiable {
    var id: String { rawValue }
}

/// Represent a person in Hololive.
struct Talent: Codable, Identifiable, Hashable {
    /// The ID shall correspond to the ID given by the API, HoloDex API uses YT channel ID.
    let id: String
    
    /// Represent the name of the talent and the translation.
    ///
    /// - Example: `[.en: "Tokino Sora", .ja: "ときのそら"]`
    let names: [NameLanguage: String]
    
    /// Represent which generation (group) this talent is in.
    let inGeneration: GenerationEnum
}

let talentsToName: [TalentsEnum: Talent] = [
    // MARK: - 0th gen
    .sora: Talent(id: TalentsEnum.sora.rawValue, names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: .zerothGen),
    .roboco: Talent(id: TalentsEnum.roboco.rawValue, names: [.en: "Robocosan", .ja: "ロボ子さん"], inGeneration: .zerothGen),
    .azki: Talent(id: TalentsEnum.azki.rawValue, names: [.en: "AZKi", .ja: "AZKi"], inGeneration: .zerothGen),
    .miko: Talent(id: TalentsEnum.miko.rawValue, names: [.en: "Sakura Miko", .ja: "さくらみこ"], inGeneration: .zerothGen),
    .suisei: Talent(id: TalentsEnum.suisei.rawValue, names: [.en: "Hoshimachi Suisei", .ja: "星街すいせい"], inGeneration: .zerothGen),
    
    // MARK: - 1st gen
    .mel: Talent(id: TalentsEnum.mel.rawValue, names: [.en: "Yozora Mel", .ja: "夜空メル"], inGeneration: .firstGen),
    .aki: Talent(id: TalentsEnum.aki.rawValue, names: [.en: "Aki Rosenthal", .ja: "アキ・ローゼンタール"], inGeneration: .firstGen),
    .haato: Talent(id: TalentsEnum.haato.rawValue, names: [.en: "Akai Haato", .ja: "赤井はあと"], inGeneration: .firstGen),
    .fubuki: Talent(id: TalentsEnum.fubuki.rawValue, names: [.en: "Shirakami Fubuki", .ja: "白上フブキ"], inGeneration: .firstGen),
    .matsuri: Talent(id: TalentsEnum.matsuri.rawValue, names: [.en: "Natsuiro Matsuri", .ja: "夏色まつり"], inGeneration: .firstGen),
    
    // MARK: - 2nd gen
    .aqua: Talent(id: TalentsEnum.aqua.rawValue, names: [.en: "Minato Aqua", .ja: "湊あくあ"], inGeneration: .secondGen),
    .shion: Talent(id: TalentsEnum.shion.rawValue, names: [.en: "Murasaki Shion", .ja: "紫咲シオン"], inGeneration: .secondGen),
    .ayame: Talent(id: TalentsEnum.ayame.rawValue, names: [.en: "Nakiri Ayame", .ja: "百鬼あやめ"], inGeneration: .secondGen),
    .choco: Talent(id: TalentsEnum.choco.rawValue, names: [.en: "Yuzuki Choco", .ja: "癒月ちょこ"], inGeneration: .secondGen),
    .subaru: Talent(id: TalentsEnum.subaru.rawValue, names: [.en: "Oozora Subaru", .ja: "大空スバル"], inGeneration: .secondGen),
    
    // MARK: - Gamers
    .mio: Talent(id: TalentsEnum.mio.rawValue, names: [.en: "Ookami Mio", .ja: "大神ミオ"], inGeneration: .gamers),
    .okayu: Talent(id: TalentsEnum.okayu.rawValue, names: [.en: "Nekomata Okayu", .ja: "猫又おかゆ"], inGeneration: .gamers),
    .korone: Talent(id: TalentsEnum.korone.rawValue, names: [.en: "Inugami Korone", .ja: "戌神ころね"], inGeneration: .gamers),
    
    // MARK: - 3rd gen
    .pekora: Talent(id: TalentsEnum.pekora.rawValue, names: [.en: "Usada Pekora", .ja: "兎田ぺこら"], inGeneration: .thirdGen),
    .flare: Talent(id: TalentsEnum.flare.rawValue, names: [.en: "Shiranui Flare", .ja: "不知火フレア"], inGeneration: .thirdGen),
    .noel: Talent(id: TalentsEnum.noel.rawValue, names: [.en: "Shirogane Noel", .ja: "白銀ノエル"], inGeneration: .thirdGen),
    .marine: Talent(id: TalentsEnum.marine.rawValue, names: [.en: "Houshou Marine", .ja: "宝鐘マリン"], inGeneration: .thirdGen),
    
    // MARK: - 4th gen
    .kanata: Talent(id: TalentsEnum.kanata.rawValue, names: [.en: "Amane Kanata", .ja: "天音かなた"], inGeneration: .forthGen),
    .watame: Talent(id: TalentsEnum.watame.rawValue, names: [.en: "Tsunomaki Watame", .ja: "角巻わため"], inGeneration: .forthGen),
    .towa: Talent(id: TalentsEnum.towa.rawValue, names: [.en: "Tokoyami Towa", .ja: "常闇トワ"], inGeneration: .forthGen),
    .luna: Talent(id: TalentsEnum.luna.rawValue, names: [.en: "Himemori Luna", .ja: "姫森ルーナ"], inGeneration: .forthGen),
    
    // MARK: - 5th gen
    .lamy: Talent(id: TalentsEnum.lamy.rawValue, names: [.en: "Yukihana Lamy", .ja: "雪花ラミィ"], inGeneration: .fifthGen),
    .nene: Talent(id: TalentsEnum.nene.rawValue, names: [.en: "Momosuzu Nene", .ja: "桃鈴ねね"], inGeneration: .fifthGen),
    .botan: Talent(id: TalentsEnum.botan.rawValue, names: [.en: "Shishiro Botan", .ja: "獅白ぼたん"], inGeneration: .fifthGen),
    .polka: Talent(id: TalentsEnum.polka.rawValue, names: [.en: "Omaru Polka", .ja: "尾丸ポルカ"], inGeneration: .fifthGen),
    
    // MARK: - holoX
    .laplus: Talent(id: TalentsEnum.laplus.rawValue, names: [.en: "La+ Darknesss", .ja: "ラプラス・ダークネス"], inGeneration: .holox),
    .lui: Talent(id: TalentsEnum.lui.rawValue, names: [.en: "Takane Lui", .ja: "鷹嶺ルイ"], inGeneration: .holox),
    .koyori: Talent(id: TalentsEnum.koyori.rawValue, names: [.en: "Hakui Koyori", .ja: "博衣こより"], inGeneration: .holox),
    .chloe: Talent(id: TalentsEnum.chloe.rawValue, names: [.en: "Sakamata Chloe", .ja: "沙花叉クロヱ"], inGeneration: .holox),
    .iroha: Talent(id: TalentsEnum.iroha.rawValue, names: [.en: "Kazama Iroha", .ja: "風真いろは"], inGeneration: .holox),
    
    // MARK: - ID 1st gen
    .risu: Talent(id: TalentsEnum.risu.rawValue, names: [.en: "Ayunda Risu", .ja: "アユンダ・リス"], inGeneration: .idFirstGen),
    .moona: Talent(id: TalentsEnum.moona.rawValue, names: [.en: "Moona Hoshinova", .ja: "ムーナ・ホシノヴァ"], inGeneration: .idFirstGen),
    .iofi: Talent(id: TalentsEnum.iofi.rawValue, names: [.en: "Airani Iofifteen", .ja: "アイラニ・イオフィフティーン"], inGeneration: .idFirstGen),
    
    // MARK: - ID 2nd gen
    .ollie: Talent(id: TalentsEnum.ollie.rawValue, names: [.en: "Kureiji Ollie", .ja: "クレイジー・オリー"], inGeneration: .idThirdGen),
    .anya: Talent(id: TalentsEnum.anya.rawValue, names: [.en: "Anya Melfissa", .ja: "アーニャ・メルフィッサ"], inGeneration: .idThirdGen),
    .reine: Talent(id: TalentsEnum.reine.rawValue, names: [.en: "Pavolia Reine", .ja: "パヴォリア・レイネ"], inGeneration: .idThirdGen),
    
    // MARK: - ID 3rd gen
    .zeta: Talent(id: TalentsEnum.zeta.rawValue, names: [.en: "KVestia Zeta", .ja: "ベスティア・ゼータ"], inGeneration: .idThirdGen),
    .kaela: Talent(id: TalentsEnum.kaela.rawValue, names: [.en: "Kaela Kovalskia", .ja: "カエラ・コヴァルスキア"], inGeneration: .idThirdGen),
    .kobo: Talent(id: TalentsEnum.kobo.rawValue, names: [.en: "Kobo Kanaeru", .ja: "こぼ・かなえる"], inGeneration: .idThirdGen),
    
    // MARK: - EN Myth
    .mori: Talent(id: TalentsEnum.mori.rawValue, names: [.en: "Mori Calliope", .ja: "森カリオペ"], inGeneration: .enMyth),
    .kiara: Talent(id: TalentsEnum.kiara.rawValue, names: [.en: "Takanashi Kiara", .ja: "小鳥遊キアラ"], inGeneration: .enMyth),
    .ina: Talent(id: TalentsEnum.ina.rawValue, names: [.en: "Ninomae Ina'nis", .ja: "一伊那尓栖"], inGeneration: .enMyth),
    .gura: Talent(id: TalentsEnum.gura.rawValue, names: [.en: "Gawr Gura", .ja: "がうる・ぐら"], inGeneration: .enMyth),
    .ame: Talent(id: TalentsEnum.ame.rawValue, names: [.en: "Watson Amelia", .ja: "ワトソン・アメリア"], inGeneration: .enMyth),
    
    // MARK: - Project: HOPE
    .irys: Talent(id: TalentsEnum.irys.rawValue, names: [.en: "IRyS", .ja: "アイリス"], inGeneration: .projectHope),
    
    // MARK: - EN Council
    .ceres: Talent(id: TalentsEnum.ceres.rawValue, names: [.en: "Ceres Fauna", .ja: "セレス・ファウナ"], inGeneration: .enCouncil),
    .kronii: Talent(id: TalentsEnum.kronii.rawValue, names: [.en: "Ouro Kronii", .ja: "オーロ・クロニー"], inGeneration: .enCouncil),
    .mumei: Talent(id: TalentsEnum.mumei.rawValue, names: [.en: "Nanashi Mumei", .ja: "七詩ムメイ"], inGeneration: .enCouncil),
    .baelz: Talent(id: TalentsEnum.baelz.rawValue, names: [.en: "Hakos Baelz", .ja: "ハコス・ベールズ"], inGeneration: .enCouncil),
    
    // MARK: - holostars 1st gen
    .miyabi: Talent(id: TalentsEnum.miyabi.rawValue, names: [.en: "Hanasaki Miyabi", .ja: "花咲みやび"], inGeneration: .starsFirstGen),
    .izuru: Talent(id: TalentsEnum.izuru.rawValue, names: [.en: "Kanade Izuru", .ja: "奏手イヅル"], inGeneration: .starsFirstGen),
    .arurandeisu: Talent(id: TalentsEnum.arurandeisu.rawValue, names: [.en: "Arurandeisu", .ja: "アルランディス"], inGeneration: .starsFirstGen),
    .rikka: Talent(id: TalentsEnum.rikka.rawValue, names: [.en: "Rikka", .ja: "律可"], inGeneration: .starsFirstGen),
    
    // MARK: - holostars 2nd gen
    .astel: Talent(id: TalentsEnum.astel.rawValue, names: [.en: "Astel Leda", .ja: "アステル・レダ"], inGeneration: .starsSecondGen),
    .temma: Talent(id: TalentsEnum.temma.rawValue, names: [.en: "Kishido Temma", .ja: "岸堂天真"], inGeneration: .starsSecondGen),
    .roberu: Talent(id: TalentsEnum.roberu.rawValue, names: [.en: "Yukoku Roberu", .ja: "夕刻ロベル"], inGeneration: .starsSecondGen),
    
    // MARK: - holostars 3rd gen
    .shien: Talent(id: TalentsEnum.shien.rawValue, names: [.en: "Kageyama Shien", .ja: "影山シエン"], inGeneration: .starsThirdGen),
    .oga: Talent(id: TalentsEnum.oga.rawValue, names: [.en: "Aragami Oga", .ja: "荒咬オウガ"], inGeneration: .starsThirdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: Talent(id: TalentsEnum.fuma.rawValue, names: [.en: "Yatogami Fuma", .ja: "夜十神封魔"], inGeneration: .uproar),
    .uyu: Talent(id: TalentsEnum.uyu.rawValue, names: [.en: "Utsugi Uyu", .ja: "羽継烏有"], inGeneration: .uproar),
    .gamma: Talent(id: TalentsEnum.gamma.rawValue, names: [.en: "Hizaki Gamma", .ja: "緋崎ガンマ"], inGeneration: .uproar),
    .rio: Talent(id: TalentsEnum.rio.rawValue, names: [.en: "Minase Rio", .ja: "水無世燐央"], inGeneration: .uproar),
    
    // MARK: - holostars TEMPUS
    .altare: Talent(id: TalentsEnum.altare.rawValue, names: [.en: "Regis Altare", .ja: "リージス・アルテア"], inGeneration: .tempus),
    .vesper: Talent(id: TalentsEnum.vesper.rawValue, names: [.en: "Noir Vesper", .ja: "ノワール・ヴェスパー"], inGeneration: .tempus),
    .syrios: Talent(id: TalentsEnum.syrios.rawValue, names: [.en: "Axel Syrios", .ja: "アクセル・シリオス"], inGeneration: .tempus),
    .dezmond: Talent(id: TalentsEnum.dezmond.rawValue, names: [.en: "Magni Dezmond", .ja: "マグニ・デズモンド"], inGeneration: .tempus),
    
    // MARK: - Official Channels
    .hololive: Talent(id: TalentsEnum.hololive.rawValue, names: [.en: "hololive", .ja: "ホロライブ"], inGeneration: .official),
    .hololiveEN: Talent(id: TalentsEnum.hololiveEN.rawValue, names: [.en: "hololive English", .ja: "hololive English"], inGeneration: .official),
    .hololiveID: Talent(id: TalentsEnum.hololiveID.rawValue, names: [.en: "hololive Indonesia", .ja: "hololive Indonesia"], inGeneration: .official),
    .holostars: Talent(id: TalentsEnum.holostars.rawValue, names: [.en: "holostars", .ja: "ホロスターズ"], inGeneration: .official),
    .midnight: Talent(id: TalentsEnum.midnight.rawValue, names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: .official)
]

let generationToName: [GenerationEnum: [NameLanguage: String]] = [
    .zerothGen: [.en: "0th gen", .ja: "0期生"],
    .firstGen: [.en: "1st gen", .ja: "1期生"],
    .secondGen: [.en: "2nd gen", .ja: "2期生"],
    .gamers: [.en: "Gamers", .ja: "ゲーマーズ"],
    .thirdGen: [.en: "3rd gen", .ja: "3期生"],
    .forthGen: [.en: "4th gen", .ja: "4期生"],
    .fifthGen: [.en: "5th gen", .ja: "5期生"],
    .holox: [.en: "holoX", .ja: "秘密結社holoX"],
    .idFirstGen: [.en: "ID 1st gen", .ja: "ID 1期生"],
    .idSecondGen: [.en: "ID 2nd gen", .ja: "ID 2期生"],
    .idThirdGen: [.en: "ID 3rd gen", .ja: "ID 3期生"],
    .enMyth: [.en: "hololive English -Myth-", .ja: "hololive English -Myth-"],
    .projectHope: [.en: "Project: HOPE", .ja: "Project: HOPE"],
    .enCouncil: [.en: "hololive English -Council-", .ja: "hololive English -議会-"],
    .starsFirstGen: [.en: "holostars 1st gen", .ja: "ホロスターズ 1期生"],
    .starsSecondGen: [.en: "holostars 2nd gen", .ja: "ホロスターズ 2期生"],
    .starsThirdGen: [.en: "holostars 3nd gen", .ja: "ホロスターズ 3期生"],
    .uproar: [.en: "holostars UPROAR!!", .ja: "ホロスターズ アップロー!!"],
    .tempus: [.en: "HOLOSTARS English -TEMPUS-", .ja: "HOLOSTARS English -TEMPUS-"],
    .official: [.en: "Official Channels", .ja: "公式チャンネル"],
    .other: [.en: "Other", .ja: "他"]
]

/// Represent the generation group in Hololive
struct GenerationGroup: Hashable {
    /// Represents the generation of this instance as an enum.
    let generation: GenerationEnum
    
    /// Represents a list of members.
    let members: [TalentsEnum]
}


/// Available languages for the name of a talent
///
/// For most international standards (except Chinese), we only need the original Japanese name and its Romaji representation (Hepburn).
enum NameLanguage: Codable {
    case en
    case ja
}

let talentsByGeneration: [GenerationGroup] = [
    // MARK: - 0th gen
    GenerationGroup(generation: .zerothGen, members: [.sora, .roboco, .azki, .miko, .suisei]),
    GenerationGroup(generation: .firstGen, members: [.mel, .aki, .haato, .fubuki, .matsuri]),
    GenerationGroup(generation: .secondGen, members: [.aqua, .shion, .ayame, .choco, .subaru]),
    GenerationGroup(generation: .gamers, members: [.mio, .okayu, .korone]),
    GenerationGroup(generation: .thirdGen, members: [.pekora, .flare, .noel, .marine]),
    GenerationGroup(generation: .forthGen, members: [.kanata, .watame, .towa, .luna]),
    GenerationGroup(generation: .fifthGen, members: [.lamy, .nene, .botan, .polka]),
    GenerationGroup(generation: .holox, members: [.laplus, .lui, .koyori, .chloe, .iroha]),
    GenerationGroup(generation: .idFirstGen, members: [.risu, .moona, .iofi]),
    GenerationGroup(generation: .idSecondGen, members: [.ollie, .anya, .reine]),
    GenerationGroup(generation: .idThirdGen, members: [.zeta, .kaela, .kobo]),
    GenerationGroup(generation: .enMyth, members: [.mori, .kiara, .ina, .gura, .ame]),
    GenerationGroup(generation: .projectHope, members: [.irys]),
    GenerationGroup(generation: .enCouncil, members: [.ceres, .kronii, .mumei, .baelz]),
    GenerationGroup(generation: .starsFirstGen, members: [.miyabi, .izuru, .arurandeisu, .rikka]),
    GenerationGroup(generation: .starsSecondGen, members: [.astel, .temma, .roberu]),
    GenerationGroup(generation: .starsThirdGen, members: [.shien, .oga]),
    GenerationGroup(generation: .uproar, members: [.fuma, .uyu, .gamma, .rio]),
    GenerationGroup(generation: .tempus, members: [.altare, .dezmond, .syrios, .vesper]),
    GenerationGroup(generation: .official, members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight])
]
