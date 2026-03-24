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
download "$BASE_FLOOD/guidebook.pdf"        "洪水内水-全域-水害対応ガイドブック.pdf"
download "$BASE_FLOOD/yodogawa__p.pdf"      "洪水-地域別-淀川（避難所記載あり）.pdf"
download "$BASE_FLOOD/yodogawa.pdf"         "洪水-地域別-淀川（避難所記載なし）.pdf"
download "$BASE_FLOOD/aigawa_p.pdf"         "洪水-地域別-安威川等（避難所記載あり）.pdf"
download "$BASE_FLOOD/aigawa.pdf"           "洪水-地域別-安威川等（避難所記載なし）.pdf"
download "$BASE_FLOOD/yodogawa_time.pdf"    "洪水-地域別-淀川（浸水継続時間）.pdf"
download "$BASE_FLOOD/aigawa_time.pdf"      "洪水-地域別-安威川等（浸水継続時間）.pdf"
download "$BASE_FLOOD/kasaneawase.pdf"      "洪水-全域-淀川・安威川等重ね合わせ図.pdf"

echo ""
echo "=== 内水ハザードマップ ==="
download "$BASE_NAISUI/shinsui-shin-zeniki.pdf"     "内水-全域-浸水深.pdf"
download "$BASE_NAISUI/shinsui-jikan-zeniki.pdf"    "内水-全域-浸水継続時間.pdf"
download "$BASE_NAISUI/shinsui-shin-ihoku11.pdf"    "内水-地域別-安威川以北（浸水深）.pdf"
download "$BASE_NAISUI/shinsui-shin-inan.pdf"       "内水-地域別-安威川以南（浸水深）.pdf"
download "$BASE_NAISUI/shinsui-jikan-ihoku11.pdf"   "内水-地域別-安威川以北（浸水継続時間）.pdf"
download "$BASE_NAISUI/shinsui-jikan-inan.pdf"      "内水-地域別-安威川以南（浸水継続時間）.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
