#!/bin/bash
# Download Settsu City (摂津市) Hazard Maps
# Sources:
#   洪水: https://www.city.settsu.osaka.jp/soshiki/soumubu/bousaikikikannrika/bousai/suigaitaisaku/25412.html
#   内水: https://www.city.settsu.osaka.jp/soshiki/jougesuidoubu/gesuidoujigyou/sougouzisinntaisaku/kuikizu/768.html

BASE_FLOOD="https://www.city.settsu.osaka.jp/material/files/group/61"
BASE_NAISUI="https://www.city.settsu.osaka.jp/material/files/group/7"
OUT="/home/user/hazard_map/摂津市"
mkdir -p "$OUT"

download() {
    local url="$1"
    local filename="$2"
    echo "Downloading: $filename"
    curl -L --retry 3 --retry-delay 2 -o "$OUT/$filename" "$url"
    if [ $? -eq 0 ]; then
        echo "  OK: $filename ($(du -h "$OUT/$filename" | cut -f1))"
    else
        echo "  FAILED: $filename"
    fi
}

echo "=== 洪水ハザードマップ ==="
download "$BASE_FLOOD/guidebook.pdf"        "洪水内水-水害対応ガイドブック全市.pdf"
download "$BASE_FLOOD/yodogawa__p.pdf"      "洪水-淀川避難所記載あり.pdf"
download "$BASE_FLOOD/yodogawa.pdf"         "洪水-淀川避難所記載なし.pdf"
download "$BASE_FLOOD/aigawa_p.pdf"         "洪水-安威川等避難所記載あり.pdf"
download "$BASE_FLOOD/aigawa.pdf"           "洪水-安威川等避難所記載なし.pdf"
download "$BASE_FLOOD/yodogawa_time.pdf"    "洪水-淀川浸水継続時間.pdf"
download "$BASE_FLOOD/aigawa_time.pdf"      "洪水-安威川等浸水継続時間.pdf"
download "$BASE_FLOOD/kasaneawase.pdf"      "洪水-淀川安威川等重ね合わせ図.pdf"

echo ""
echo "=== 内水ハザードマップ ==="
download "$BASE_NAISUI/shinsui-shin-zeniki.pdf"     "内水-全市浸水深.pdf"
download "$BASE_NAISUI/shinsui-jikan-zeniki.pdf"    "内水-全市浸水継続時間.pdf"
download "$BASE_NAISUI/shinsui-shin-ihoku11.pdf"    "内水-安威川以北浸水深.pdf"
download "$BASE_NAISUI/shinsui-shin-inan.pdf"       "内水-安威川以南浸水深.pdf"
download "$BASE_NAISUI/shinsui-jikan-ihoku11.pdf"   "内水-安威川以北浸水継続時間.pdf"
download "$BASE_NAISUI/shinsui-jikan-inan.pdf"      "内水-安威川以南浸水継続時間.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
