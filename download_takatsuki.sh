#!/bin/bash
# Download Takatsuki City (高槻市) Hazard Maps
# Source: https://www.city.takatsuki.osaka.jp/soshiki/55/4004.html

BASE="https://www.city.takatsuki.osaka.jp/uploaded/attachment"
OUT="/home/user/hazard_map/高槻市"
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
download "$BASE/44871.pdf"  "洪水内水土砂-町名別索引50音順.pdf"
download "$BASE/44124.pdf"  "洪水内水土砂-索引図.pdf"
download "$BASE/44712.pdf"  "洪水内水土砂-マップ1-4.pdf"
download "$BASE/44713.pdf"  "洪水内水土砂-マップ5-8.pdf"
download "$BASE/44714.pdf"  "洪水内水土砂-マップ9-12.pdf"
download "$BASE/44715.pdf"  "洪水内水土砂-マップ13-15.pdf"
download "$BASE/44716.pdf"  "洪水内水土砂-マップ16-18.pdf"
download "$BASE/44717.pdf"  "洪水内水土砂-マップ19-21.pdf"
download "$BASE/44718.pdf"  "洪水内水土砂-マップ22-24.pdf"
download "$BASE/44719.pdf"  "洪水内水土砂-マップ25-28.pdf"
download "$BASE/44728.pdf"  "洪水内水土砂-表紙目次学習ページ.pdf"

echo ""
echo "=== 洪水（大判図）==="
download "$BASE/44134.pdf"  "洪水-大判図淀川.pdf"
download "$BASE/44135.pdf"  "洪水-大判図芥川女瀬川檜尾川安威川水無瀬川.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
