#!/bin/bash
# Download Kumiyama Town (久御山町) Hazard Maps
# Source: http://www.town.kumiyama.lg.jp/0000000882.html

BASE="https://www.town.kumiyama.lg.jp/cmsfiles/contents/0000000/882"
OUT="/home/user/hazard_map/京都府/久御山町"
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

echo "=== 久御山町 洪水ハザードマップ（R7版）==="

download "$BASE/hyoushihinannka-do.pdf"                    "全域-表紙.pdf"
download "$BASE/hinankokoroe.pdf"                          "防災情報-全域.pdf"
download "$BASE/ujigawa_2025032711272356.pdf"              "洪水-全域-宇治川.pdf"
download "$BASE/kizugawa_2025032711265826.pdf"             "洪水-全域-木津川.pdf"
download "$BASE/katsuragawa_2025032711265826.pdf"          "洪水-全域-桂川.pdf"
download "$BASE/furukawa_2025032711265826.pdf"             "洪水-全域-古川.pdf"
download "$BASE/shinsuikeizokujikan_2025032711272356.pdf"  "洪水-全域-浸水継続時間.pdf"
download "$BASE/kaokutoukai_2025032711265826.pdf"          "洪水-全域-家屋倒壊等氾濫想定区域.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
