#!/bin/bash
# Download Shimamoto Town (島本町) Hazard Maps
# Source: https://www.town.shimamoto.lg.jp/site/bousai/30122.html
# Note: PDFs are hosted on town.shimamoto.osaka.jp (old domain)

BASE="https://www.town.shimamoto.lg.jp/uploaded/attachment"
OUT="/home/user/hazard_map/島本町"
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

echo "=== 洪水・土砂ハザードマップ ==="
download "$BASE/13293.pdf"  "洪水土砂-淀川流域.pdf"
download "$BASE/13294.pdf"  "洪水土砂-水無瀬川流域.pdf"
download "$BASE/13297.pdf"  "水害-水害への備えガイド全域.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
