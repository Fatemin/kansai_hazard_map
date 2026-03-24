#!/bin/bash
# Download Higashiosaka City (東大阪市) Hazard Maps
# Source: https://www.city.higashiosaka.lg.jp/kikikanri/0000030406.html

BASE="https://www.city.higashiosaka.lg.jp/cmsfiles/contents/0000030/30406"
OUT="/home/user/hazard_map/東大阪市"
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
download "$BASE/neyagawaryuuiki.pdf"                        "洪水-地域別-寝屋川流域（地図・避難情報）.pdf"
download "$BASE/yamatogawayodogawatameikekijimen.pdf"        "洪水ため池-地域別-大和川・淀川（地図・避難情報）.pdf"
download "$BASE/neyagawaryuuikihaza-do.pdf"                 "洪水-地域別-寝屋川流域（ハザードのみ）.pdf"
download "$BASE/yaatogawayodogawahaza-do.pdf"               "洪水-地域別-大和川・淀川（ハザードのみ）.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
