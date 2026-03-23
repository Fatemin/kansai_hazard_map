#!/bin/bash
# Download Katano City (交野市) Hazard Maps
# Source: https://www.city.katano.osaka.jp/docs/2020091600031/

BASE="https://www.city.katano.osaka.jp/docs/2020091600031/file_contents"
OUT="/home/user/hazard_map/交野市"
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
download "$BASE/P00-01_.pdf"    "洪水内水-表紙索引.pdf"
download "$BASE/P16-17_.pdf"    "洪水内水-区割り図.pdf"
download "$BASE/P18-19_1.pdf"   "洪水内水-区域1.pdf"
download "$BASE/P20-21_2.pdf"   "洪水内水-区域2.pdf"
download "$BASE/P22-23_3.pdf"   "洪水内水-区域3.pdf"
download "$BASE/P24-25_4.pdf"   "洪水内水-区域4.pdf"
download "$BASE/P26-27_5.pdf"   "洪水内水-区域5.pdf"
download "$BASE/P28-29_6.pdf"   "洪水内水-区域6.pdf"
download "$BASE/P30-31_7.pdf"   "洪水内水-区域7.pdf"
download "$BASE/P32-33_8.pdf"   "洪水内水-区域8.pdf"
download "$BASE/P34-35_9.pdf"   "洪水内水-区域9.pdf"
download "$BASE/P36-37_10.pdf"  "洪水内水-区域10.pdf"
download "$BASE/P38-39_11.pdf"  "洪水内水-区域11.pdf"
download "$BASE/P40-41_12.pdf"  "洪水内水-区域12.pdf"
download "$BASE/P42-43_13.pdf"  "洪水内水-区域13.pdf"
download "$BASE/P44-45_14.pdf"  "洪水内水-区域14.pdf"
download "$BASE/P46-47_15.pdf"  "洪水内水-区域15.pdf"
download "$BASE/P48-49_16.pdf"  "洪水内水-区域16.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
