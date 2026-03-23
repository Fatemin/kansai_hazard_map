#!/bin/bash
# Download Moriguchi City (守口市) Hazard Maps
# Source: https://www.city.moriguchi.osaka.jp/kakukanoannai/kikikanrishitsu/bousaihazaadomappu/3702.html

BASE="https://www.city.moriguchi.osaka.jp/material/files/group/21"
OUT="/home/user/hazard_map/守口市"
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

echo "=== 洪水ハザードマップ（淀川）==="
download "$BASE/P22-P23.pdf"    "洪水-地域別-淀川1.pdf"
download "$BASE/P24-P25.pdf"    "洪水-地域別-淀川2.pdf"
download "$BASE/P26-P27.pdf"    "洪水-地域別-淀川3.pdf"

echo ""
echo "=== 洪水リスク表示図（寝屋川流域）==="
download "$BASE/P28-P29.pdf"    "洪水-地域別-寝屋川流域1.pdf"
download "$BASE/P30-P31.pdf"    "洪水-地域別-寝屋川流域2.pdf"
download "$BASE/P32-P33.pdf"    "洪水-地域別-寝屋川流域3.pdf"

echo ""
echo "=== 浸水継続時間図 ==="
download "$BASE/P34-P35.pdf"    "浸水継続時間-全域.pdf"

echo ""
echo "=== 内水ハザードマップ ==="
download "$BASE/P36-P37.pdf"    "内水-地域別-1.pdf"
download "$BASE/P38-P39.pdf"    "内水-地域別-2.pdf"
download "$BASE/P40-P41.pdf"    "内水-地域別-3.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
