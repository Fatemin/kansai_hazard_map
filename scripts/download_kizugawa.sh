#!/bin/bash
# Download Kizugawa City (木津川市) Hazard Maps
# Source: https://www.city.kizugawa.lg.jp/index.cfm/6,13034,12,369,html

BASE="https://www.city.kizugawa.lg.jp/cmsfiles/contents/0000000/482"
OUT="/home/user/hazard_map/京都府/木津川市"
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

echo "=== 木津川市 総合防災マップ（R7版）==="

download "$BASE/20250328-131915.pdf"  "全域-表紙.pdf"
download "$BASE/20250328-122243.pdf"  "全域-目次.pdf"
download "$BASE/20250331-152816.pdf"  "水害土砂-地域別-木津地区.pdf"
download "$BASE/20250328-143235.pdf"  "洪水-地域別-木津地区浸水継続時間.pdf"
download "$BASE/20250328-143827.pdf"  "水害土砂-地域別-加茂地区.pdf"
download "$BASE/20250331-123234.pdf"  "洪水-地域別-加茂地区浸水継続時間.pdf"
download "$BASE/20250328-145844.pdf"  "水害土砂-地域別-山城地区.pdf"
download "$BASE/20250328-144232.pdf"  "洪水-地域別-山城地区浸水継続時間.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
