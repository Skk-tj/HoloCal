//
//  Talents.swift
//  holo-wtf
//
// 
//

import Foundation

struct Talent: Codable, Identifiable, Hashable {
    /// The ID shall correspond to the ID given by the API
    let id: String
    /// Example: `["en": "Tokino Sora", "ja": "ときのそら"]`
    let names: [String: String]
}

struct Generation: Codable, Hashable {
    let generation: [String: String]
    let talents: [Talent]
}

let talentsByGeneration = [
    // MARK: - 0th gen
    Generation(
        generation: ["en": "0th gen", "ja": "0期生"],
        talents: [
            Talent(id: "UCp6993wxpyDPHUpavwDFqgg", names: ["en": "Tokino Sora", "ja": "ときのそら"]),
            Talent(id: "UCDqI2jOz0weumE8s7paEk6g", names: ["en": "Robocosan", "ja": "ロボ子さん"]),
            Talent(id: "UC0TXe_LYZ4scaW2XMyi5_kw", names: ["en": "AZKi", "ja": "AZKi"]),
            Talent(id: "UC-hM6YJuNYVAmUWxeIr9FeA", names: ["en": "Sakura Miko", "ja": "さくらみこ"]),
            Talent(id: "UC5CwaMl1eIgY8h02uZw7u8A", names: ["en": "Hoshimachi Suisei", "ja": "星街すいせい"])
        ]
    ),
    // MARK: - 1st gen
    Generation(
        generation: ["en": "1st gen", "ja": "1期生"],
        talents: [
            Talent(id: "UCD8HOxPs4Xvsm8H0ZxXGiBw", names: ["en": "Yozora Mel", "ja": "夜空メル"]),
            Talent(id: "UCFTLzh12_nrtzqBPsTCqenA", names: ["en": "Aki Rosenthal", "ja": "アキ・ローゼンタール"]),
            Talent(id: "UC1CfXB_kRs3C-zaeTG3oGyg", names: ["en": "Akai Haato", "ja": "赤井はあと"]),
            Talent(id: "UCdn5BQ06XqgXoAxIhbqw5Rg", names: ["en": "Shirakami Fubuki", "ja": "白上フブキ"]),
            Talent(id: "UCQ0UDLQCjY0rmuxCDE38FGg", names: ["en": "Natsuiro Matsuri", "ja": "夏色まつり"])
        ]
    ),
    // MARK: - 2nd gen
    Generation(
        generation: ["en": "2nd gen", "ja": "2期生"],
        talents: [
            Talent(id: "UC1opHUrw8rvnsadT-iGp7Cg", names: ["en": "Minato Aqua", "ja": "湊あくあ"]),
            Talent(id: "UCXTpFs_3PqI41qX2d9tL2Rw", names: ["en": "Murasaki Shion", "ja": "紫咲シオン"]),
            Talent(id: "UC7fk0CB07ly8oSl0aqKkqFg", names: ["en": "Nakiri Ayame", "ja": "百鬼あやめ"]),
            Talent(id: "UC1suqwovbL1kzsoaZgFZLKg", names: ["en": "Yuzuki Choco", "ja": "癒月ちょこ"]),
            Talent(id: "UCvzGlP9oQwU--Y0r9id_jnA", names: ["en": "Oozora Subaru", "ja": "大空スバル"])
        ]
    ),
    // MARK: - Gamers
    Generation(
        generation: ["en": "Gamers", "ja": "ゲーマーズ"],
        talents: [
            Talent(id: "UCdn5BQ06XqgXoAxIhbqw5Rg", names: ["en": "Shirakami Fubuki", "ja": "白上フブキ"]),
            Talent(id: "UCp-5t9SrOQwXMU7iIjQfARg", names: ["en": "Ookami Mio", "ja": "大神ミオ"]),
            Talent(id: "UCvaTdHTWBGv3MKj3KVqJVCw", names: ["en": "Nekomata Okayu", "ja": "猫又おかゆ"]),
            Talent(id: "UChAnqc_AY5_I3Px5dig3X1Q", names: ["en": "Inugami Korone", "ja": "戌神ころね"]),
        ]
    ),
    // MARK: - 3rd gen
    Generation(
        generation: ["en": "3rd gen", "ja": "3期生"],
        talents: [
            Talent(id: "UC1DCedRgGHBdm81E1llLhOQ", names: ["en": "Usada Pekora", "ja": "兎田ぺこら"]),
            Talent(id: "UCvInZx9h3jC2JzsIzoOebWg", names: ["en": "Shiranui Flare", "ja": "不知火フレア"]),
            Talent(id: "UCdyqAaZDKHXg4Ahi7VENThQ", names: ["en": "Shirogane Noel", "ja": "白銀ノエル"]),
            Talent(id: "UCCzUftO8KOVkV4wQG1vkUvg", names: ["en": "Houshou Marine", "ja": "宝鐘マリン"]),
        ]
    ),
    // MARK: - 4th gen
    Generation(
        generation: ["en": "4th gen", "ja": "4期生"],
        talents: [
            Talent(id: "UCZlDXzGoo7d44bwdNObFacg", names: ["en": "Amane Kanata", "ja": "天音かなた"]),
            Talent(id: "UCqm3BQLlJfvkTsX_hvm0UmA", names: ["en": "Tsunomaki Watame", "ja": "角巻わため"]),
            Talent(id: "UC1uv2Oq6kNxgATlCiez59hw", names: ["en": "Tokoyami Towa", "ja": "常闇トワ"]),
            Talent(id: "UCa9Y57gfeY0Zro_noHRVrnw", names: ["en": "Himemori Luna", "ja": "姫森ルーナ"]),
        ]
    ),
    // MARK: - 5th gen
    Generation(
        generation: ["en": "5th gen", "ja": "5期生"],
        talents: [
            Talent(id: "UCFKOVgVbGmX65RxO3EtH3iw", names: ["en": "Yukihana Lamy", "ja": "雪花ラミィ"]),
            Talent(id: "UCAWSyEs_Io8MtpY3m-zqILA", names: ["en": "Momosuzu Nene", "ja": "桃鈴ねね"]),
            Talent(id: "UCUKD-uaobj9jiqB-VXt71mA", names: ["en": "Shishiro Botan", "ja": "獅白ぼたん"]),
            Talent(id: "UCK9V2B22uJYu3N7eR_BT9QA", names: ["en": "Omaru Polka", "ja": "尾丸ポルカ"]),
        ]
    ),
    // MARK: - holoX
    Generation(
        generation: ["en": "holoX", "ja": "秘密結社holoX"],
        talents: [
            Talent(id: "UCENwRMx5Yh42zWpzURebzTw", names: ["en": "La+ Darknesss", "ja": "ラプラス・ダークネス"]),
            Talent(id: "UCs9_O1tRPMQTHQ-N_L6FU2g", names: ["en": "Takane Lui", "ja": "鷹嶺ルイ"]),
            Talent(id: "UC6eWCld0KwmyHFbAqK3V-Rw", names: ["en": "Hakui Koyori", "ja": "博衣こより"]),
            Talent(id: "UCIBY1ollUsauvVi4hW4cumw", names: ["en": "Sakamata Chloe", "ja": "沙花叉クロヱ"]),
            Talent(id: "UC_vMYWcDjmfdpH6r4TTn1MQ", names: ["en": "Kazama Iroha", "ja": "風真いろは"]),
        ]
    ),
    // MARK: - ID 1st gen
    Generation(
        generation: ["en": "ID 1st gen", "ja": "ID 1期生"],
        talents: [
            Talent(id: "UCOyYb1c43VlX9rc_lT6NKQw", names: ["en": "Ayunda Risu", "ja": "アユンダ・リス"]),
            Talent(id: "UCP0BspO_AMEe3aQqqpo89Dg", names: ["en": "Moona Hoshinova", "ja": "ムーナ・ホシノヴァ"]),
            Talent(id: "UCAoy6rzhSf4ydcYjJw3WoVg", names: ["en": "Airani Iofifteen", "ja": "アイラニ・イオフィフティーン"]),
        ]
    ),
    // MARK: - ID 2nd gen
    Generation(
        generation: ["en": "ID 2nd gen", "ja": "ID 2期生"],
        talents: [
            Talent(id: "UCYz_5n-uDuChHtLo7My1HnQ", names: ["en": "Kureiji Ollie", "ja": "クレイジー・オリー"]),
            Talent(id: "UC727SQYUvx5pDDGQpTICNWg", names: ["en": "Anya Melfissa", "ja": "アーニャ・メルフィッサ"]),
            Talent(id: "UChgTyjG-pdNvxxhdsXfHQ5Q", names: ["en": "Pavolia Reine", "ja": "パヴォリア・レイネ"]),
        ]
    ),
    // MARK: - ID 3rd gen
    Generation(
        generation: ["en": "ID 3rd gen", "ja": "ID 3期生"],
        talents: [
            Talent(id: "UCTvHWSfBZgtxE4sILOaurIQ", names: ["en": "KVestia Zeta", "ja": "ベスティア・ゼータ"]),
            Talent(id: "UCZLZ8Jjx_RN2CXloOmgTHVg", names: ["en": "Kaela Kovalskia", "ja": "カエラ・コヴァルスキア"]),
            Talent(id: "UCjLEmnpCNeisMxy134KPwWw", names: ["en": "Kobo Kanaeru", "ja": "こぼ・かなえる"]),
        ]
    ),
    // MARK: - EN Myth
    Generation(
        generation: ["en": "hololive English -Myth-", "ja": "hololive English -Myth-"],
        talents: [
            Talent(id: "UCL_qhgtOy0dy1Agp8vkySQg", names: ["en": "Mori Calliope", "ja": "森カリオペ"]),
            Talent(id: "UCHsx4Hqa-1ORjQTh9TYDhww", names: ["en": "Takanashi Kiara", "ja": "小鳥遊キアラ"]),
            Talent(id: "UCMwGHR0BTZuLsmjY_NT5Pwg", names: ["en": "Ninomae Ina'nis", "ja": "一伊那尓栖"]),
            Talent(id: "UCoSrY_IQQVpmIRZ9Xf-y93g", names: ["en": "Gawr Gura", "ja": "がうる・ぐら"]),
            Talent(id: "UCyl1z3jo3XHR1riLFKG5UAg", names: ["en": "Watson Amelia", "ja": "ワトソン・アメリア"]),
        ]
    ),
    // MARK: - Project: HOPE
    Generation(
        generation: ["en": "Project: HOPE", "ja": "Project: HOPE"],
        talents: [
            Talent(id: "UC8rcEBzJSleTkf_-agPM20g", names: ["en": "IRyS", "ja": "アイリス"]),
        ]
    ),
    // MARK: - EN Council
    Generation(
        generation: ["en": "hololive English -Council-", "ja": "hololive English -Council-"],
        talents: [
            Talent(id: "UCsUj0dszADCGbF3gNrQEuSQ", names: ["en": "Tsukumo Sana", "ja": "九十九佐命"]),
            Talent(id: "UCO_aKKYxn4tvrqPjcTzZ6EQ", names: ["en": "Ceres Fauna", "ja": "セレス・ファウナ"]),
            Talent(id: "UCmbs8T6MWqUHP1tIQvSgKrg", names: ["en": "Ouro Kronii", "ja": "オーロ・クロニー"]),
            Talent(id: "UC3n5uGu18FoCy23ggWWp8tA", names: ["en": "Nanashi Mumei", "ja": "七詩ムメイ"]),
            Talent(id: "UCgmPnx-EEeOrZSg5Tiw7ZRQ", names: ["en": "Hakos Baelz", "ja": "ハコス・ベールズ"]),
        ]
    ),
    // MARK: - holostars 1st gen
    Generation(
        generation: ["en": "holostars 1st gen", "ja": "ホロスターズ 1期生"],
        talents: [
            Talent(id: "UC6t3-_N8A6ME1JShZHHqOMw", names: ["en": "Hanasaki Miyabi", "ja": "花咲みやび"]),
            Talent(id: "UCZgOv3YDEs-ZnZWDYVwJdmA", names: ["en": "Kanade Izuru", "ja": "奏手イヅル"]),
            Talent(id: "UCKeAhJvy8zgXWbh9duVjIaQ", names: ["en": "Arurandeisu", "ja": "アルランディス"]),
            Talent(id: "UC9mf_ZVpouoILRY9NUIaK-w", names: ["en": "Rikka", "ja": "律可"]),
        ]
    ),
    // MARK: - holostars 2nd gen
    Generation(
        generation: ["en": "holostars 2nd gen", "ja": "ホロスターズ 2期生"],
        talents: [
            Talent(id: "UCNVEsYbiZjH5QLmGeSgTSzg", names: ["en": "Astel Leda", "ja": "アステル・レダ"]),
            Talent(id: "UCGNI4MENvnsymYjKiZwv9eg", names: ["en": "Kishido Temma", "ja": "岸堂天真"]),
            Talent(id: "UCANDOlYTJT7N5jlRC3zfzVA", names: ["en": "Yukoku Roberu", "ja": "夕刻ロベル"]),
        ]
    ),
    // MARK: - holostars 3rd gen
    Generation(
        generation: ["en": "holostars 3nd gen", "ja": "ホロスターズ 3期生"],
        talents: [
            Talent(id: "UChSvpZYRPh0FvG4SJGSga3g", names: ["en": "Kageyama Shien", "ja": "影山シエン"]),
            Talent(id: "UCwL7dgTxKo8Y4RFIKWaf8gA", names: ["en": "Aragami Oga", "ja": "荒咬オウガ"]),
        ]
    ),
    // MARK: - holostars UPROAR!!
    Generation(
        generation: ["en": "holostars UPROAR!!", "ja": "ホロスターズ アップロー!!"],
        talents: [
            Talent(id: "UCc88OV45ICgHbn3ZqLLb52w", names: ["en": "Yatogami Fuma", "ja": "夜十神封魔"]),
            Talent(id: "UCgRqGV1gBf2Esxh0Tz1vxzw", names: ["en": "Utsugi Uyu", "ja": "羽継烏有"]),
            Talent(id: "UCkT1u65YS49ca_LsFwcTakw", names: ["en": "Hizaki Gamma", "ja": "緋崎ガンマ"]),
            Talent(id: "UCdfMHxjcCc2HSd9qFvfJgjg", names: ["en": "Minase Rio", "ja": "水無世燐央"]),
        ]
    ),
    // MARK: - Official Channels
    Generation(
        generation: ["en": "Official Channels", "ja": "オフィシャルチャンネル"],
        talents: [
            Talent(id: "UCJFZiqLMntJufDCHc6bQixg", names: ["en": "hololive", "ja": "ホロライブ"]),
            Talent(id: "UCotXwY6s8pWmuWd_snKYjhg", names: ["en": "hololive English", "ja": "hololive English"]),
            Talent(id: "UCfrWoRGlawPQDQxxeIDRP0Q", names: ["en": "hololive Indonesia", "ja": "hololive Indonesia"]),
            Talent(id: "UCWsfcksUUpoEvhia0_ut0bA", names: ["en": "holostars", "ja": "ホロスターズ"])
        ]
    ),
]
