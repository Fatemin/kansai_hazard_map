#!/bin/bash
# Download Uji City (宇治市) Hazard Maps
# Source: https://www.city.uji.kyoto.jp/soshiki/25/5123.html

BASE="https://www.city.uji.kyoto.jp/uploaded/attachment"
OUT="/home/user/hazard_map/京都府/宇治市"
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

echo "=== 宇治市 ハザードマップ ==="

download "$BASE/46895.pdf"  "防災情報-全域-P1.pdf"
download "$BASE/46896.pdf"  "洪水土砂-全域-P1.pdf"
download "$BASE/46897.pdf"  "洪水土砂-全域-P2.pdf"
download "$BASE/46898.pdf"  "防災情報-全域-P2（避難施設一覧）.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
