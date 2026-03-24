#!/bin/bash
# Download Muko City (向日市) Hazard Maps
# Source: https://www.city.muko.kyoto.jp/soshiki/11/3199.html

BASE="https://www.city.muko.kyoto.jp/uploaded/attachment"
OUT="/home/user/hazard_map/京都府/向日市"
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

echo "=== 向日市 防災マップ ==="

download "$BASE/15094.pdf"  "水害土砂-全域.pdf"
download "$BASE/15107.pdf"  "内水-全域.pdf"
download "$BASE/15108.pdf"  "洪水-全域-河川別.pdf"
download "$BASE/15109.pdf"  "洪水-全域-桂川浸水継続時間.pdf"
download "$BASE/15112.pdf"  "内水-地域別-北部.pdf"
download "$BASE/15113.pdf"  "洪水-地域別-北部（桂川等）.pdf"
download "$BASE/15114.pdf"  "内水-地域別-中部.pdf"
download "$BASE/15115.pdf"  "洪水-地域別-中部（桂川等）.pdf"
download "$BASE/15116.pdf"  "洪水-地域別-中部（小畑川）.pdf"
download "$BASE/15117.pdf"  "内水-地域別-南部.pdf"
download "$BASE/15118.pdf"  "洪水-地域別-南部（桂川等）.pdf"
download "$BASE/15119.pdf"  "洪水-地域別-南部（小畑川）.pdf"
download "$BASE/15121.pdf"  "洪水-全域-桂川・新川・西羽束師川（A2判）.pdf"
download "$BASE/15122.pdf"  "洪水-全域-小畑川（A2判）.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
