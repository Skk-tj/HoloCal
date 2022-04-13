//
//  Talents.swift
//  holo-wtf
//
//  Created by ??? on 2022-04-02.
//

import Foundation

struct Talent: Codable, Identifiable, Hashable {
    /// The ID shall correspond to the ID given by the API
    let id: Int
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
            Talent(id: 41, names: ["en": "Tokino Sora", "ja": "ときのそら"]),
            Talent(id: 39, names: ["en": "Robocosan", "ja": "ロボ子さん"]),
            Talent(id: 5, names: ["en": "AZKi", "ja": "AZKi"]),
            Talent(id: 12, names: ["en": "Sakura Miko", "ja": "さくらみこ"]),
            Talent(id: 46, names: ["en": "Hoshimachi Suisei", "ja": "星街すいせい"])
        ]
    ),
    // MARK: - 1st gen
    Generation(
        generation: ["en": "1st gen", "ja": "1期生"],
        talents: [
            Talent(id: 1, names: ["en": "Yozora Mel", "ja": "夜空メル"]),
            Talent(id: 32, names: ["en": "Aki Rosenthal", "ja": "アキ・ローゼンタール"]),
            Talent(id: 6, names: ["en": "Akai Haato", "ja": "赤井はあと"]),
            Talent(id: 13, names: ["en": "Shirakami Fubuki", "ja": "白上フブキ"]),
            Talent(id: 24, names: ["en": "Natsuiro Matsuri", "ja": "夏色まつり"])
        ]
    ),
    // MARK: - 2nd gen
    Generation(
        generation: ["en": "2nd gen", "ja": "2期生"],
        talents: [
            Talent(id: 30, names: ["en": "Minato Aqua", "ja": "湊あくあ"]),
            Talent(id: 10, names: ["en": "Murasaki Shion", "ja": "紫咲シオン"]),
            Talent(id: 33, names: ["en": "Nakiri Ayame", "ja": "百鬼あやめ"]),
            Talent(id: 34, names: ["en": "Yuzuki Choco", "ja": "癒月ちょこ"]),
            Talent(id: 43, names: ["en": "Oozora Subaru", "ja": "大空スバル"])
        ]
    ),
    // MARK: - Gamers
    Generation(
        generation: ["en": "Gamers", "ja": "ゲーマーズ"],
        talents: [
            Talent(id: 13, names: ["en": "Shirakami Fubuki", "ja": "白上フブキ"]),
            Talent(id: 11, names: ["en": "Ookami Mio", "ja": "大神ミオ"]),
            Talent(id: 23, names: ["en": "Nekomata Okayu", "ja": "猫又おかゆ"]),
            Talent(id: 4, names: ["en": "Inugami Korone", "ja": "戌神ころね"]),
        ]
    ),
    // MARK: - 3rd gen
    Generation(
        generation: ["en": "3rd gen", "ja": "3期生"],
        talents: [
            Talent(id: 36, names: ["en": "Usada Pekora", "ja": "兎田ぺこら"]),
            Talent(id: 38, names: ["en": "Shiranui Flare", "ja": "不知火フレア"]),
            Talent(id: 26, names: ["en": "Shirogane Noel", "ja": "白銀ノエル"]),
            Talent(id: 44, names: ["en": "Houshou Marine", "ja": "宝鐘マリン"]),
        ]
    ),
    // MARK: - 4th gen
    Generation(
        generation: ["en": "4th gen", "ja": "4期生"],
        talents: [
            Talent(id: 29, names: ["en": "Amane Kanata", "ja": "天音かなた"]),
            Talent(id: 25, names: ["en": "Tsunomaki Watame", "ja": "角巻わため"]),
            Talent(id: 45, names: ["en": "Tokoyami Towa", "ja": "常闇トワ"]),
            Talent(id: 2, names: ["en": "Himemori Luna", "ja": "姫森ルーナ"]),
        ]
    ),
    // MARK: - 5th gen
    Generation(
        generation: ["en": "5th gen", "ja": "5期生"],
        talents: [
            Talent(id: 31879, names: ["en": "Yukihana Lamy", "ja": "雪花ラミィ"]),
            Talent(id: 31880, names: ["en": "Momosuzu Nene", "ja": "桃鈴ねね"]),
            Talent(id: 31881, names: ["en": "Shishiro Botan", "ja": "獅白ぼたん"]),
            Talent(id: 31883, names: ["en": "Omaru Polka", "ja": "尾丸ポルカ"]),
        ]
    ),
    // MARK: - holoX
    Generation(
        generation: ["en": "holoX", "ja": "秘密結社holoX"],
        talents: [
            Talent(id: 2908909, names: ["en": "La+ Darknesss", "ja": "ラプラス・ダークネス"]),
            Talent(id: 2908910, names: ["en": "Takane Lui", "ja": "鷹嶺ルイ"]),
            Talent(id: 2908911, names: ["en": "Hakui Koyori", "ja": "博衣こより"]),
            Talent(id: 2908912, names: ["en": "Sakamata Chloe", "ja": "沙花叉クロヱ"]),
            Talent(id: 2908913, names: ["en": "Kazama Iroha", "ja": "風真いろは"]),
        ]
    ),
    // MARK: - ID 1st gen
    Generation(
        generation: ["en": "ID 1st gen", "ja": "ID 1期生"],
        talents: [
            Talent(id: 31, names: ["en": "Ayunda Risu", "ja": "アユンダ・リス"]),
            Talent(id: 22, names: ["en": "Moona Hoshinova", "ja": "ムーナ・ホシノヴァ"]),
            Talent(id: 19, names: ["en": "Airani Iofifteen", "ja": "アイラニ・イオフィフティーン"]),
        ]
    ),
    // MARK: - ID 2nd gen
    Generation(
        generation: ["en": "ID 2nd gen", "ja": "ID 2期生"],
        talents: [
            Talent(id: 676413, names: ["en": "Kureiji Ollie", "ja": "クレイジー・オリー"]),
            Talent(id: 676414, names: ["en": "Anya Melfissa", "ja": "アーニャ・メルフィッサ"]),
            Talent(id: 676415, names: ["en": "Pavolia Reine", "ja": "パヴォリア・レイネ"]),
        ]
    ),
    // MARK: - ID 3rd gen
//    [
//        "generation": [
//            "en": "ID 3rd gen",
//            "ja": "ID 3期生"
//        ],
//        "talents": [
//            Talent(id: 31, names: ["en": "KVestia Zeta", "ja": "ベスティア・ゼータ"]),
//            Talent(id: 22, names: ["en": "Kaela Kovalskia", "ja": "カエラ・コヴァルスキア"]),
//            Talent(id: 19, names: ["en": "Kobo Kanaeru", "ja": "こぼ・かなえる"]),
//        ]
//    ],
    // MARK: - EN Myth
    Generation(
        generation: ["en": "hololive English -Myth-", "ja": "hololive English -Myth-"],
        talents: [
            Talent(id: 199073, names: ["en": "Mori Calliope", "ja": "森カリオペ"]),
            Talent(id: 199074, names: ["en": "Takanashi Kiara", "ja": "小鳥遊キアラ"]),
            Talent(id: 199075, names: ["en": "Ninomae Ina'nis", "ja": "一伊那尓栖"]),
            Talent(id: 199076, names: ["en": "Gawr Gura", "ja": "がうる・ぐら"]),
            Talent(id: 199077, names: ["en": "Watson Amelia", "ja": "ワトソン・アメリア"]),
        ]
    ),
    // MARK: - Project: HOPE
    Generation(
        generation: ["en": "Project: HOPE", "ja": "Project: HOPE"],
        talents: [
            Talent(id: 2024827, names: ["en": "IRyS", "ja": "アイリス"]),
        ]
    ),
    // MARK: - EN Council
    Generation(
        generation: ["en": "hololive English -Council-", "ja": "hololive English -Council-"],
        talents: [
            Talent(id: 2260364, names: ["en": "Tsukumo Sana", "ja": "九十九佐命"]),
            Talent(id: 2260365, names: ["en": "Ceres Fauna", "ja": "セレス・ファウナ"]),
            Talent(id: 2260366, names: ["en": "Ouro Kronii", "ja": "オーロ・クロニー"]),
            Talent(id: 2260367, names: ["en": "Nanashi Mumei", "ja": "七詩ムメイ"]),
            Talent(id: 2260368, names: ["en": "Hakos Baelz", "ja": "ハコス・ベールズ"]),
        ]
    ),
    // MARK: - holostars 1st gen
    Generation(
        generation: ["en": "holostars 1st gen", "ja": "ホロスターズ 1期生"],
        talents: [
            Talent(id: 28, names: ["en": "Hanasaki Miyabi", "ja": "花咲みやび"]),
            Talent(id: 42, names: ["en": "Kanade Izuru", "ja": "奏手イヅル"]),
            Talent(id: 7, names: ["en": "Arurandeisu", "ja": "アルランディス"]),
            Talent(id: 17, names: ["en": "Rikka", "ja": "律可"]),
        ]
    ),
    // MARK: - holostars 2nd gen
    Generation(
        generation: ["en": "holostars 2nd gen", "ja": "ホロスターズ 2期生"],
        talents: [
            Talent(id: 28, names: ["en": "Astel Leda", "ja": "アステル・レダ"]),
            Talent(id: 37, names: ["en": "Kishido Temma", "ja": "岸堂天真"]),
            Talent(id: 20, names: ["en": "Yukoku Roberu", "ja": "夕刻ロベル"]),
        ]
    ),
    Generation(
        generation: ["en": "Official Channels", "ja": "オフィシャルチャンネル"],
        talents: [
            Talent(id: 9, names: ["en": "hololive", "ja": "ホロライブ"]),
            Talent(id: 200275, names: ["en": "hololive English", "ja": "hololive English"]),
            Talent(id: 214950, names: ["en": "hololive Indonesia", "ja": "hololive Indonesia"]),
            Talent(id: 214951, names: ["en": "holostar", "ja": "ホロスターズ"])
        ]
    ),
    // MARK: - holostars UPROAR!!
//    [
//        "generation": [
//            "en": "holostars 3rd gen",
//            "ja": "ホロスターズ 3期生"
//        ],
//        "talents": [
//            Talent(id: 40, names: ["en": "Kageyama Shien", "ja": "影山シエン"]),
//            Talent(id: 3, names: ["en": "Aragami Oga", "ja": "荒咬オウガ"]),
//            Talent(id: 3, names: ["en": "Aragami Oga", "ja": "荒咬オウガ"]),
//            Talent(id: 3, names: ["en": "Aragami Oga", "ja": "荒咬オウガ"]),
//        ]
//    ],
]
