#!/bin/bash
# Download Suita City Hazard Maps (Flood / Inner Water / Storm Surge)
# File naming: 地図種別-地域名.pdf

BASE="https://www.city.suita.osaka.jp/_res/projects/default_project/_page_"
OUT="/home/user/hazard_map/吹田市"

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
download "$BASE/001/004/277/suitafloodhmjpn202203.pdf" "洪水-全域.pdf"

echo ""
echo "=== 内水ハザードマップ ==="
download "$BASE/001/004/278/naisuihzzeniki.pdf"      "内水-全域.pdf"
download "$BASE/001/004/278/1201020181724.pdf"        "内水-地域別-千里NT・万博・阪大地域北部.pdf"
download "$BASE/001/004/278/1201020182148.pdf"        "内水-地域別-千里NT・万博・阪大地域南部.pdf"
download "$BASE/001/004/278/120102018221.pdf"         "内水-地域別-山田・千里丘地域.pdf"
download "$BASE/001/004/278/1201020182338.pdf"        "内水-地域別-千里山・佐井寺地域.pdf"
download "$BASE/001/004/278/1201020182354.pdf"        "内水-地域別-豊津・江坂・南吹田地域.pdf"
download "$BASE/001/004/278/120102018248.pdf"         "内水-地域別-片山・岸部地域.pdf"
download "$BASE/001/004/278/1201020182427.pdf"        "内水-地域別-JR以南地域.pdf"

echo ""
echo "=== 高潮ハザードマップ ==="
download "$BASE/001/004/276/suitastormsurgehmjpn.pdf" "高潮-地域別-南部.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
