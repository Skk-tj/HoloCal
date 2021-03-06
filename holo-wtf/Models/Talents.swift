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
    case sana = "UCsUj0dszADCGbF3gNrQEuSQ"
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
    /// - Example: `[.en: "Tokino Sora", .ja: "???????????????"]`
    let names: [NameLanguage: String]
    
    /// Represent which generation (group) this talent is in.
    let inGeneration: GenerationEnum
}

let talentsToName: [TalentsEnum: Talent] = [
    // MARK: - 0th gen
    .sora: Talent(id: "UCp6993wxpyDPHUpavwDFqgg", names: [.en: "Tokino Sora", .ja: "???????????????"], inGeneration: .zerothGen),
    .roboco: Talent(id: "UCDqI2jOz0weumE8s7paEk6g", names: [.en: "Robocosan", .ja: "???????????????"], inGeneration: .zerothGen),
    .azki: Talent(id: "UC0TXe_LYZ4scaW2XMyi5_kw", names: [.en: "AZKi", .ja: "AZKi"], inGeneration: .zerothGen),
    .miko: Talent(id: "UC-hM6YJuNYVAmUWxeIr9FeA", names: [.en: "Sakura Miko", .ja: "???????????????"], inGeneration: .zerothGen),
    .suisei: Talent(id: "UC5CwaMl1eIgY8h02uZw7u8A", names: [.en: "Hoshimachi Suisei", .ja: "??????????????????"], inGeneration: .zerothGen),
    
    // MARK: - 1st gen
    .mel: Talent(id: "UCD8HOxPs4Xvsm8H0ZxXGiBw", names: [.en: "Yozora Mel", .ja: "????????????"], inGeneration: .firstGen),
    .aki: Talent(id: "UCFTLzh12_nrtzqBPsTCqenA", names: [.en: "Aki Rosenthal", .ja: "??????????????????????????????"], inGeneration: .firstGen),
    .haato: Talent(id: "UC1CfXB_kRs3C-zaeTG3oGyg", names: [.en: "Akai Haato", .ja: "???????????????"], inGeneration: .firstGen),
    .fubuki: Talent(id: "UCdn5BQ06XqgXoAxIhbqw5Rg", names: [.en: "Shirakami Fubuki", .ja: "???????????????"], inGeneration: .firstGen),
    .matsuri: Talent(id: "UCQ0UDLQCjY0rmuxCDE38FGg", names: [.en: "Natsuiro Matsuri", .ja: "???????????????"], inGeneration: .firstGen),
    
    // MARK: - 2nd gen
    .aqua: Talent(id: "UC1opHUrw8rvnsadT-iGp7Cg", names: [.en: "Minato Aqua", .ja: "????????????"], inGeneration: .secondGen),
    .shion: Talent(id: "UCXTpFs_3PqI41qX2d9tL2Rw", names: [.en: "Murasaki Shion", .ja: "???????????????"], inGeneration: .secondGen),
    .ayame: Talent(id: "UC7fk0CB07ly8oSl0aqKkqFg", names: [.en: "Nakiri Ayame", .ja: "???????????????"], inGeneration: .secondGen),
    .choco: Talent(id: "UC1suqwovbL1kzsoaZgFZLKg", names: [.en: "Yuzuki Choco", .ja: "???????????????"], inGeneration: .secondGen),
    .subaru: Talent(id: "UCvzGlP9oQwU--Y0r9id_jnA", names: [.en: "Oozora Subaru", .ja: "???????????????"], inGeneration: .secondGen),
    
    // MARK: - Gamers
    .mio: Talent(id: "UCp-5t9SrOQwXMU7iIjQfARg", names: [.en: "Ookami Mio", .ja: "????????????"], inGeneration: .gamers),
    .okayu: Talent(id: "UCvaTdHTWBGv3MKj3KVqJVCw", names: [.en: "Nekomata Okayu", .ja: "???????????????"], inGeneration: .gamers),
    .korone: Talent(id: "UChAnqc_AY5_I3Px5dig3X1Q", names: [.en: "Inugami Korone", .ja: "???????????????"], inGeneration: .gamers),
    
    // MARK: - 3rd gen
    .pekora: Talent(id: "UC1DCedRgGHBdm81E1llLhOQ", names: [.en: "Usada Pekora", .ja: "???????????????"], inGeneration: .thirdGen),
    .flare: Talent(id: "UCvInZx9h3jC2JzsIzoOebWg", names: [.en: "Shiranui Flare", .ja: "??????????????????"], inGeneration: .thirdGen),
    .noel: Talent(id: "UCdyqAaZDKHXg4Ahi7VENThQ", names: [.en: "Shirogane Noel", .ja: "???????????????"], inGeneration: .thirdGen),
    .marine: Talent(id: "UCCzUftO8KOVkV4wQG1vkUvg", names: [.en: "Houshou Marine", .ja: "???????????????"], inGeneration: .thirdGen),
    
    // MARK: - 4th gen
    .kanata: Talent(id: "UCZlDXzGoo7d44bwdNObFacg", names: [.en: "Amane Kanata", .ja: "???????????????"], inGeneration: .forthGen),
    .watame: Talent(id: "UCqm3BQLlJfvkTsX_hvm0UmA", names: [.en: "Tsunomaki Watame", .ja: "???????????????"], inGeneration: .forthGen),
    .towa: Talent(id: "UC1uv2Oq6kNxgATlCiez59hw", names: [.en: "Tokoyami Towa", .ja: "????????????"], inGeneration: .forthGen),
    .luna: Talent(id: "UCa9Y57gfeY0Zro_noHRVrnw", names: [.en: "Himemori Luna", .ja: "???????????????"], inGeneration: .forthGen),
    
    // MARK: - 5th gen
    .lamy: Talent(id: "UCFKOVgVbGmX65RxO3EtH3iw", names: [.en: "Yukihana Lamy", .ja: "???????????????"], inGeneration: .fifthGen),
    .nene: Talent(id: "UCAWSyEs_Io8MtpY3m-zqILA", names: [.en: "Momosuzu Nene", .ja: "????????????"], inGeneration: .fifthGen),
    .botan: Talent(id: "UCUKD-uaobj9jiqB-VXt71mA", names: [.en: "Shishiro Botan", .ja: "???????????????"], inGeneration: .fifthGen),
    .polka: Talent(id: "UCK9V2B22uJYu3N7eR_BT9QA", names: [.en: "Omaru Polka", .ja: "???????????????"], inGeneration: .fifthGen),
    
    // MARK: - holoX
    .laplus: Talent(id: "UCENwRMx5Yh42zWpzURebzTw", names: [.en: "La+ Darknesss", .ja: "??????????????????????????????"], inGeneration: .holox),
    .lui: Talent(id: "UCs9_O1tRPMQTHQ-N_L6FU2g", names: [.en: "Takane Lui", .ja: "????????????"], inGeneration: .holox),
    .koyori: Talent(id: "UC6eWCld0KwmyHFbAqK3V-Rw", names: [.en: "Hakui Koyori", .ja: "???????????????"], inGeneration: .holox),
    .chloe: Talent(id: "UCIBY1ollUsauvVi4hW4cumw", names: [.en: "Sakamata Chloe", .ja: "??????????????????"], inGeneration: .holox),
    .iroha: Talent(id: "UC_vMYWcDjmfdpH6r4TTn1MQ", names: [.en: "Kazama Iroha", .ja: "???????????????"], inGeneration: .holox),
    
    // MARK: - ID 1st gen
    .risu: Talent(id: "UCOyYb1c43VlX9rc_lT6NKQw", names: [.en: "Ayunda Risu", .ja: "?????????????????????"], inGeneration: .idFirstGen),
    .moona: Talent(id: "UCP0BspO_AMEe3aQqqpo89Dg", names: [.en: "Moona Hoshinova", .ja: "???????????????????????????"], inGeneration: .idFirstGen),
    .iofi: Talent(id: "UCAoy6rzhSf4ydcYjJw3WoVg", names: [.en: "Airani Iofifteen", .ja: "??????????????????????????????????????????"], inGeneration: .idFirstGen),
    
    // MARK: - ID 2nd gen
    .ollie: Talent(id: "UCYz_5n-uDuChHtLo7My1HnQ", names: [.en: "Kureiji Ollie", .ja: "???????????????????????????"], inGeneration: .idThirdGen),
    .anya: Talent(id: "UC727SQYUvx5pDDGQpTICNWg", names: [.en: "Anya Melfissa", .ja: "?????????????????????????????????"], inGeneration: .idThirdGen),
    .reine: Talent(id: "UChgTyjG-pdNvxxhdsXfHQ5Q", names: [.en: "Pavolia Reine", .ja: "???????????????????????????"], inGeneration: .idThirdGen),
    
    // MARK: - ID 3rd gen
    .zeta: Talent(id: "UCTvHWSfBZgtxE4sILOaurIQ", names: [.en: "KVestia Zeta", .ja: "???????????????????????????"], inGeneration: .idThirdGen),
    .kaela: Talent(id: "UCZLZ8Jjx_RN2CXloOmgTHVg", names: [.en: "Kaela Kovalskia", .ja: "?????????????????????????????????"], inGeneration: .idThirdGen),
    .kobo: Talent(id: "UCjLEmnpCNeisMxy134KPwWw", names: [.en: "Kobo Kanaeru", .ja: "?????????????????????"], inGeneration: .idThirdGen),
    
    // MARK: - EN Myth
    .mori: Talent(id: "UCL_qhgtOy0dy1Agp8vkySQg", names: [.en: "Mori Calliope", .ja: "???????????????"], inGeneration: .enMyth),
    .kiara: Talent(id: "UCHsx4Hqa-1ORjQTh9TYDhww", names: [.en: "Takanashi Kiara", .ja: "??????????????????"], inGeneration: .enMyth),
    .ina: Talent(id: "UCMwGHR0BTZuLsmjY_NT5Pwg", names: [.en: "Ninomae Ina'nis", .ja: "???????????????"], inGeneration: .enMyth),
    .gura: Talent(id: "UCoSrY_IQQVpmIRZ9Xf-y93g", names: [.en: "Gawr Gura", .ja: "??????????????????"], inGeneration: .enMyth),
    .ame: Talent(id: "UCyl1z3jo3XHR1riLFKG5UAg", names: [.en: "Watson Amelia", .ja: "???????????????????????????"], inGeneration: .enMyth),
    
    // MARK: - Project: HOPE
    .irys: Talent(id: "UC8rcEBzJSleTkf_-agPM20g", names: [.en: "IRyS", .ja: "????????????"], inGeneration: .projectHope),
    
    // MARK: - EN Council
    .sana: Talent(id: "UCsUj0dszADCGbF3gNrQEuSQ", names: [.en: "Tsukumo Sana", .ja: "???????????????"], inGeneration: .enCouncil),
    .ceres: Talent(id: "UCO_aKKYxn4tvrqPjcTzZ6EQ", names: [.en: "Ceres Fauna", .ja: "????????????????????????"], inGeneration: .enCouncil),
    .kronii: Talent(id: "UCmbs8T6MWqUHP1tIQvSgKrg", names: [.en: "Ouro Kronii", .ja: "????????????????????????"], inGeneration: .enCouncil),
    .mumei: Talent(id: "UC3n5uGu18FoCy23ggWWp8tA", names: [.en: "Nanashi Mumei", .ja: "???????????????"], inGeneration: .enCouncil),
    .baelz: Talent(id: "UCgmPnx-EEeOrZSg5Tiw7ZRQ", names: [.en: "Hakos Baelz", .ja: "????????????????????????"], inGeneration: .enCouncil),
    
    // MARK: - holostars 1st gen
    .miyabi: Talent(id: "UC6t3-_N8A6ME1JShZHHqOMw", names: [.en: "Hanasaki Miyabi", .ja: "???????????????"], inGeneration: .starsFirstGen),
    .izuru: Talent(id: "UCZgOv3YDEs-ZnZWDYVwJdmA", names: [.en: "Kanade Izuru", .ja: "???????????????"], inGeneration: .starsFirstGen),
    .arurandeisu: Talent(id: "UCKeAhJvy8zgXWbh9duVjIaQ", names: [.en: "Arurandeisu", .ja: "?????????????????????"], inGeneration: .starsFirstGen),
    .rikka: Talent(id: "UC9mf_ZVpouoILRY9NUIaK-w", names: [.en: "Rikka", .ja: "??????"], inGeneration: .starsFirstGen),
    
    // MARK: - holostars 2nd gen
    .astel: Talent(id: "UCNVEsYbiZjH5QLmGeSgTSzg", names: [.en: "Astel Leda", .ja: "?????????????????????"], inGeneration: .starsSecondGen),
    .temma: Talent(id: "UCGNI4MENvnsymYjKiZwv9eg", names: [.en: "Kishido Temma", .ja: "????????????"], inGeneration: .starsSecondGen),
    .roberu: Talent(id: "UCANDOlYTJT7N5jlRC3zfzVA", names: [.en: "Yukoku Roberu", .ja: "???????????????"], inGeneration: .starsSecondGen),
    
    // MARK: - holostars 3rd gen
    .shien: Talent(id: "UChSvpZYRPh0FvG4SJGSga3g", names: [.en: "Kageyama Shien", .ja: "???????????????"], inGeneration: .starsThirdGen),
    .oga: Talent(id: "UCwL7dgTxKo8Y4RFIKWaf8gA", names: [.en: "Aragami Oga", .ja: "???????????????"], inGeneration: .starsThirdGen),
    
    // MARK: - holostars UPROAR!!
    .fuma: Talent(id: "UCc88OV45ICgHbn3ZqLLb52w", names: [.en: "Yatogami Fuma", .ja: "???????????????"], inGeneration: .uproar),
    .uyu: Talent(id: "UCgRqGV1gBf2Esxh0Tz1vxzw", names: [.en: "Utsugi Uyu", .ja: "????????????"], inGeneration: .uproar),
    .gamma: Talent(id: "UCkT1u65YS49ca_LsFwcTakw", names: [.en: "Hizaki Gamma", .ja: "???????????????"], inGeneration: .uproar),
    .rio: Talent(id: "UCdfMHxjcCc2HSd9qFvfJgjg", names: [.en: "Minase Rio", .ja: "???????????????"], inGeneration: .uproar),
    
    // MARK: - holostars TEMPUS
    .altare: Talent(id: "UCyxtGMdWlURZ30WSnEjDOQw", names: [.en: "Regis Altare", .ja: "???????????????????????????"], inGeneration: .tempus),
    .vesper: Talent(id: "UCDRWSO281bIHYVi-OV3iFYA", names: [.en: "Noir Vesper", .ja: "??????????????????????????????"], inGeneration: .tempus),
    .syrios: Talent(id: "UC2hx0xVkMoHGWijwr_lA01w", names: [.en: "Axel Syrios", .ja: "???????????????????????????"], inGeneration: .tempus),
    .dezmond: Talent(id: "UC7MMNHR-kf9EN1rXiesMTMw", names: [.en: "Magni Dezmond", .ja: "???????????????????????????"], inGeneration: .tempus),
    
    // MARK: - Official Channels
    .hololive: Talent(id: "UCJFZiqLMntJufDCHc6bQixg", names: [.en: "hololive", .ja: "???????????????"], inGeneration: .official),
    .hololiveEN: Talent(id: "UCotXwY6s8pWmuWd_snKYjhg", names: [.en: "hololive English", .ja: "hololive English"], inGeneration: .official),
    .hololiveID: Talent(id: "UCfrWoRGlawPQDQxxeIDRP0Q", names: [.en: "hololive Indonesia", .ja: "hololive Indonesia"], inGeneration: .official),
    .holostars: Talent(id: "UCWsfcksUUpoEvhia0_ut0bA", names: [.en: "holostars", .ja: "??????????????????"], inGeneration: .official),
    .midnight: Talent(id: "UCnVbtCwr-5LXxUlGxsgD7sQ", names: [.en: "Midnight Grand Orchestra", .ja: "Midnight Grand Orchestra"], inGeneration: .official)
]

let generationToName: [GenerationEnum: [NameLanguage: String]] = [
    .zerothGen: [.en: "0th gen", .ja: "0??????"],
    .firstGen: [.en: "1st gen", .ja: "1??????"],
    .secondGen: [.en: "2nd gen", .ja: "2??????"],
    .gamers: [.en: "Gamers", .ja: "???????????????"],
    .thirdGen: [.en: "3rd gen", .ja: "3??????"],
    .forthGen: [.en: "4th gen", .ja: "4??????"],
    .fifthGen: [.en: "5th gen", .ja: "5??????"],
    .holox: [.en: "holoX", .ja: "????????????holoX"],
    .idFirstGen: [.en: "ID 1st gen", .ja: "ID 1??????"],
    .idSecondGen: [.en: "ID 2nd gen", .ja: "ID 2??????"],
    .idThirdGen: [.en: "ID 3rd gen", .ja: "ID 3??????"],
    .enMyth: [.en: "hololive English -Myth-", .ja: "hololive English -Myth-"],
    .projectHope: [.en: "Project: HOPE", .ja: "Project: HOPE"],
    .enCouncil: [.en: "hololive English -Council-", .ja: "hololive English -??????-"],
    .starsFirstGen: [.en: "holostars 1st gen", .ja: "?????????????????? 1??????"],
    .starsSecondGen: [.en: "holostars 2nd gen", .ja: "?????????????????? 2??????"],
    .starsThirdGen: [.en: "holostars 3nd gen", .ja: "?????????????????? 3??????"],
    .uproar: [.en: "holostars UPROAR!!", .ja: "?????????????????? ???????????????!!"],
    .tempus: [.en: "HOLOSTARS English -TEMPUS-", .ja: "HOLOSTARS English -TEMPUS-"],
    .official: [.en: "Official Channels", .ja: "?????????????????????"],
    .other: [.en: "Other", .ja: "???"]
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
    GenerationGroup(generation: .enCouncil, members: [.sana, .ceres, .kronii, .mumei, .baelz]),
    GenerationGroup(generation: .starsFirstGen, members: [.miyabi, .izuru, .arurandeisu, .rikka]),
    GenerationGroup(generation: .starsSecondGen, members: [.astel, .temma, .roberu]),
    GenerationGroup(generation: .starsThirdGen, members: [.shien, .oga]),
    GenerationGroup(generation: .uproar, members: [.fuma, .uyu, .gamma, .rio]),
    GenerationGroup(generation: .tempus, members: [.altare, .dezmond, .syrios, .vesper]),
    GenerationGroup(generation: .official, members: [.hololive, .hololiveEN, .hololiveID, .holostars, .midnight])
]
