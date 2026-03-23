#!/bin/bash
# Download Neyagawa City (寝屋川市) Hazard Maps
# Source: https://www.city.neyagawa.osaka.jp/organization_list/kikikanri/bousaika/hinanbasyo/1376645989698.html

BASE="https://www.city.neyagawa.osaka.jp/material/files/group/125"
OUT="/home/user/hazard_map/寝屋川市"
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
download "$BASE/jisinngouudosya.pdf"    "洪水地震土砂-淀川系全域.pdf"
download "$BASE/neyaawahaza-.pdf"       "洪水-寝屋川古川支川全域.pdf"

echo ""
echo "=== 内水ハザードマップ ==="
download "$BASE/naisuihaza-do.pdf"      "内水-全域.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
