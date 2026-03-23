#!/bin/bash
# Download Daito City (大東市) Hazard Maps
# Source: https://www.city.daito.lg.jp/site/bousai/1498.html

BASE="https://www.city.daito.lg.jp/uploaded/attachment"
OUT="/home/user/hazard_map/大東市"
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

echo "=== 洪水・内水・土砂ハザードマップ ==="
download "$BASE/39908.pdf"  "洪水内水土砂-索引図.pdf"
download "$BASE/39909.pdf"  "洪水内水土砂-凡例.pdf"
download "$BASE/39910.pdf"  "洪水内水土砂-区域1.pdf"
download "$BASE/39911.pdf"  "洪水内水土砂-区域2.pdf"
download "$BASE/39912.pdf"  "洪水内水土砂-区域3.pdf"
download "$BASE/39913.pdf"  "洪水内水土砂-区域4.pdf"
download "$BASE/39914.pdf"  "洪水内水土砂-区域5.pdf"
download "$BASE/39915.pdf"  "洪水内水土砂-区域6.pdf"
download "$BASE/39916.pdf"  "洪水内水土砂-区域7.pdf"
download "$BASE/39917.pdf"  "洪水内水土砂-区域8.pdf"
download "$BASE/39918.pdf"  "洪水内水土砂-区域9.pdf"
download "$BASE/39919.pdf"  "洪水内水土砂-区域10.pdf"
download "$BASE/39920.pdf"  "洪水内水土砂-区域11.pdf"
download "$BASE/39921.pdf"  "洪水内水土砂-区域12.pdf"
download "$BASE/39922.pdf"  "洪水内水土砂-区域13.pdf"
download "$BASE/39923.pdf"  "洪水内水土砂-区域14.pdf"
download "$BASE/39924.pdf"  "洪水内水土砂-区域15.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
