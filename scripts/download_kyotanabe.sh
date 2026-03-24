#!/bin/bash
# Download Kyotanabe City (京田辺市) Hazard Maps
# Source: https://www.city.kyotanabe.lg.jp/0000002071.html

BASE="https://www.city.kyotanabe.lg.jp/cmsfiles/contents/0000002/2071"
OUT="/home/user/hazard_map/京都府/京田辺市"
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

echo "=== 京田辺市 水害ハザードマップ（R5版）==="

download "$BASE/R5_jouhou_1.pdf"                         "水害-全域-情報版1.pdf"
download "$BASE/R5_jouhou_2.pdf"                         "水害-全域-情報版2.pdf"
download "$BASE/R5_suigai_hazardmap_tizu_kyoutofu.pdf"   "水害-全域-京都府河川.pdf"
download "$BASE/R5_map_kizugawa.pdf"                     "洪水-全域-木津川.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
