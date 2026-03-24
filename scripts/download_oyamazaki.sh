#!/bin/bash
# Download Oyamazaki Town (大山崎町) Hazard Maps
# Source: http://www.town.oyamazaki.kyoto.jp/annai/somuka/kikikanri/hinanjo/1383.html

BASE="https://www.town.oyamazaki.kyoto.jp/material/files/group/32"
OUT="/home/user/hazard_map/京都府/大山崎町"
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

echo "=== 大山崎町 防災ハザードマップ ==="

download "$BASE/oyamazaki_p10_11web.pdf"      "水害-全域-情報ページ.pdf"
download "$BASE/oyamazaki_p12_13_2web.pdf"    "洪水-全域-桂川浸水想定区域.pdf"
download "$BASE/oyamazaki_p14_15_2web.pdf"    "洪水-全域-小泉川・小畑川浸水想定区域.pdf"
download "$BASE/oyamazaki_p16_17web.pdf"      "洪水-全域-浸水継続時間.pdf"
download "$BASE/oyamazaki_p18_19web.pdf"      "洪水-全域-家屋倒壊等氾濫想定区域.pdf"
download "$BASE/oyamazaki_p20_21_2web.pdf"    "土砂-全域.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
