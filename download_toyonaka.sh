#!/bin/bash
# Download Toyonaka City (豊中市) Hazard Maps
# Sources:
#   洪水・内水: https://www.city.toyonaka.osaka.jp/kurashi/bosai/bousai_info/hazardmap/sinsuiHM.html
#   高潮: https://www.city.toyonaka.osaka.jp/kurashi/bosai/bousai_info/hazardmap/takashio.html

BASE_FLOOD="https://www.city.toyonaka.osaka.jp/kurashi/bosai/bousai_info/hazardmap/sinsuiHM.files"
BASE_SURGE="https://www.city.toyonaka.osaka.jp/kurashi/bosai/bousai_info/hazardmap/takashio.files"
OUT="/home/user/hazard_map/豊中市"
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

echo "=== 洪水・内水ハザードマップ ==="
download "$BASE_FLOOD/shinsuihazardmap.pdf"         "洪水内水-全域.pdf"
download "$BASE_FLOOD/naisui.pdf"                   "内水-全域-浸水想定区域.pdf"
download "$BASE_FLOOD/0hyoushi.pdf"                 "洪水内水-全域-表紙.pdf"
download "$BASE_FLOOD/saigaiwoshiru.pdf"            "洪水内水-全域-災害を知る.pdf"
download "$BASE_FLOOD/saigainisonaeru.pdf"          "洪水内水-全域-災害に備える.pdf"
download "$BASE_FLOOD/ooamezinotorubekikoudou.pdf"  "洪水内水-全域-大雨時にとるべき行動.pdf"

echo ""
echo "=== 高潮ハザードマップ ==="
download "$BASE_SURGE/takashiohyoushi1.pdf"                 "高潮-全域-表紙.pdf"
download "$BASE_SURGE/takashioP1.pdf"                       "高潮-全域-P1.pdf"
download "$BASE_SURGE/takashioP2-3.pdf"                     "高潮-全域-浸水想定区域図.pdf"
download "$BASE_SURGE/takashioP4.pdf"                       "高潮-全域-索引図.pdf"
download "$BASE_SURGE/1nakateshimanaksakuraduka.pdf"        "高潮-地域別-中豊島、南桜塚小学校区.pdf"
download "$BASE_SURGE/2haradaminowa.pdf"                    "高潮-地域別-原田、箕輪小学校区.pdf"
download "$BASE_SURGE/3kitazyouryokuti.pdf"                 "高潮-地域別-北条、緑地小学校区.pdf"
download "$BASE_SURGE/4teshimateshimakita.pdf"              "高潮-地域別-豊島、豊島北小学校区.pdf"
download "$BASE_SURGE/5teshimanisi.pdf"                     "高潮-地域別-豊島西小学校区.pdf"
download "$BASE_SURGE/6ozonehounantakagawa.pdf"             "高潮-地域別-小曽根、豊南、高川小学校区.pdf"
download "$BASE_SURGE/7nodasyounaisimada.pdf"               "高潮-地域別-野田、庄内、島田小学校区.pdf"
download "$BASE_SURGE/8syounaiminamisennnari.pdf"           "高潮-地域別-庄内南、千成小学校区.pdf"
download "$BASE_SURGE/9syounainisi.pdf"                     "高潮-地域別-庄内西小学校区.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
