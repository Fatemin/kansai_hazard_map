#!/bin/bash
# Download Kameoka City (亀岡市) Hazard Maps
# Source: https://www.city.kameoka.kyoto.jp/soshiki/15/2470.html

BASE="https://www.city.kameoka.kyoto.jp/uploaded/attachment"
OUT="/home/user/hazard_map/京都府/亀岡市"
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

echo "=== 亀岡市 洪水・土砂ハザードマップ ==="

download "$BASE/11193.pdf"  "洪水土砂-地域別-篠町.pdf"
download "$BASE/11194.pdf"  "洪水土砂-地域別-亀岡地区・つつじヶ丘.pdf"
download "$BASE/11195.pdf"  "洪水土砂-地域別-河原林町・穂津.pdf"
download "$BASE/11196.pdf"  "洪水土砂-地域別-馬路・旭・千歳町.pdf"
download "$BASE/11197.pdf"  "洪水土砂-地域別-大井・千代川町.pdf"
download "$BASE/11198.pdf"  "洪水土砂-地域別-吉川・稗田野町.pdf"
download "$BASE/11199.pdf"  "洪水土砂-地域別-曽我部町.pdf"
download "$BASE/11200.pdf"  "洪水土砂-地域別-宮前・本梅東.pdf"
download "$BASE/11201.pdf"  "洪水土砂-地域別-本梅町.pdf"
download "$BASE/30524.pdf"  "洪水土砂-地域別-別院東.pdf"
download "$BASE/30525.pdf"  "洪水土砂-地域別-別院西.pdf"
download "$BASE/30526.pdf"  "洪水土砂-地域別-畑野町.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
