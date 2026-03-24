#!/bin/bash
# Download Minoh City (箕面市) Hazard Maps
# Source: https://www.city.minoh.lg.jp/bousai/hazardmap/hazardmap_top.html

BASE="https://www.city.minoh.lg.jp/bousai/hazardmap/documents"
OUT="/home/user/hazard_map/箕面市"
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

echo "=== 洪水・内水・土砂災害ハザードマップ ==="
download "$BASE/omote.pdf"                          "洪水内水土砂-全域-表面.pdf"
download "$BASE/ura.pdf"                            "洪水内水土砂-全域-裏面.pdf"
download "$BASE/030624bousaimap-tizumena3.pdf"      "洪水内水土砂-全域-地図面R3年6月版.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
