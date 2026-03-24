#!/bin/bash
# Download Joyo City (城陽市) Hazard Maps
# Source: https://www.city.joyo.kyoto.jp/0000001149.html

BASE="https://www.city.joyo.kyoto.jp/cmsfiles/contents/0000001/1149"
OUT="/home/user/hazard_map/京都府/城陽市"
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

echo "=== 城陽市 ハザードマップ（R6.12版）==="

download "$BASE/kouzuidoshaR6.12.pdf"  "洪水土砂-全域.pdf"
download "$BASE/jishinR6.12.pdf"       "地震-全域.pdf"
download "$BASE/R6.12.pdf"             "防災ブック-全域.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
