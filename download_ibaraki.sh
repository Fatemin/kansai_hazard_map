#!/bin/bash
# Download Ibaraki City (茨木市) Hazard Maps
# Source: https://www.city.ibaraki.osaka.jp/kikou/soumu/kikikanri/menu/booklet/suigaidosyasaigaihazadomappu/58463.html

BASE="https://www.city.ibaraki.osaka.jp/material/files/group/3"
OUT="/home/user/hazard_map/茨木市"
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

echo "=== 洪水・内水・土砂災害ハザードマップ ==="
download "$BASE/suigaihaza-domappugaiyoubann.pdf"   "洪水内水土砂-全域-概要版.pdf"
download "$BASE/00hyousi.pdf"                       "洪水内水土砂-全域-表紙.pdf"
download "$BASE/sakuin.pdf"                         "洪水内水土砂-全域-索引図.pdf"
download "$BASE/01haza.pdf"                         "洪水内水土砂-全域-P1.pdf"
download "$BASE/0203haza.pdf"                       "洪水内水土砂-全域-P2-3.pdf"
download "$BASE/0405haza.pdf"                       "洪水内水土砂-全域-過去水害氾濫シミュレーション.pdf"
download "$BASE/0607haza.pdf"                       "洪水内水土砂-全域-マップの見方.pdf"
download "$BASE/0813haza.pdf"                       "洪水内水土砂-全域-索引.pdf"
download "$BASE/1213haza.pdf"                       "洪水内水土砂-全域-P12-13.pdf"
download "$BASE/naisuidosyasaigai2assyuku.pdf"      "内水土砂-全域-旧版.pdf"
download "$BASE/kakonosuigaiassyuku.pdf"            "洪水土砂-全域-旧版.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
