#!/bin/bash
# Download Kadoma City (門真市) Hazard Maps
# Source: https://www.city.kadoma.osaka.jp/kurashi/anshin/4/4/4358.html

BASE="https://www.city.kadoma.osaka.jp/material/files/group/9"
OUT="/home/user/hazard_map/門真市"
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
download "$BASE/kozui0706.pdf"  "洪水-全域.pdf"
download "$BASE/yodogawa.pdf"   "洪水-地域別-淀川拡大版.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
