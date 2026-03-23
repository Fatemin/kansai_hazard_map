#!/bin/bash
# Download Shijonawate City (四條畷市) Hazard Maps
# Source: https://www.city.shijonawate.lg.jp/site/bousai/9101.html

BASE="https://www.city.shijonawate.lg.jp/uploaded/attachment"
OUT="/home/user/hazard_map/四條畷市"
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

echo "=== 洪水・土砂・地震ハザードマップ ==="
download "$BASE/21365.pdf"  "洪水土砂地震-全域.pdf"

echo ""
echo "=== 洪水・土砂・地震（地域別）==="
download "$BASE/21536.pdf"  "洪水土砂地震-地域別-砂蔀屋北出二丁通岡山中野美田江瀬美雁屋米崎塚脇楠公.pdf"
download "$BASE/21537.pdf"  "洪水土砂地震-地域別-岡山JR東側清滝南野.pdf"
download "$BASE/21538.pdf"  "洪水土砂地震-地域別-逢阪下田原田原台1-2丁目.pdf"
download "$BASE/21539.pdf"  "洪水土砂地震-地域別-田原台3-9丁目上田原緑風台さつきヶ丘.pdf"
download "$BASE/21540.pdf"  "洪水土砂地震-地域別-上田原阪奈道路南側.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
