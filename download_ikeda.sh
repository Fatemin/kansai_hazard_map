#!/bin/bash
# Download Ikeda City (池田市) Hazard Maps
# Source: https://www.city.ikeda.osaka.jp/soshiki/sogoseisaku/kikikanri/bousai/kozui/15148.html

BASE="https://www.city.ikeda.osaka.jp/material/files/group"
OUT="/home/user/hazard_map/池田市"
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
download "$BASE/1/ikedasizennikinaisuikouzui.pdf"           "洪水内水-全域余野川箕面川石澄川神田川.pdf"
download "$BASE/1/230915ikedasizennikikouzuidosha.pdf"      "洪水土砂-全域猪名川.pdf"

echo ""
echo "=== 洪水・内水（校区別）==="
download "$BASE/1/koda-kureha240911.pdf"                    "洪水内水-神田小学校呉服小学校区.pdf"
download "$BASE/3/kitateshima-ishibashiminami2404.pdf"      "洪水内水-北豊島小学校石橋南小学校区.pdf"
download "$BASE/1/ikeda-satsukigaoka240917.pdf"             "洪水内水-池田小学校五月丘小学校区.pdf"
download "$BASE/3/midorigaoka-ishibashi25-04.pdf"           "洪水内水-緑丘小学校石橋小学校区.pdf"
download "$BASE/3/hatano2504.pdf"                           "洪水内水-秦野小学校区.pdf"
download "$BASE/1/hosogo240911.pdf"                         "洪水内水-ほそごう学園区.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
