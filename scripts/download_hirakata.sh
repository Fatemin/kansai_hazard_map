#!/bin/bash
# Download Hirakata City (枚方市) Hazard Maps
# Source: https://www.city.hirakata.osaka.jp/0000017941.html

BASE="https://www.city.hirakata.osaka.jp/cmsfiles/contents/0000017/17941"
OUT="/home/user/hazard_map/枚方市"
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

echo "=== 洪水・内水ハザードマップ ==="
download "$BASE/01P44.pdf"          "洪水内水-全域-索引図.pdf"
download "$BASE/02P45.pdf"          "洪水-地域別-木津川沿岸.pdf"
download "$BASE/003P46-48.pdf"      "洪水内水-地域別-エリア①～③.pdf"
download "$BASE/004P49-52.pdf"      "洪水内水-地域別-エリア④～⑦.pdf"
download "$BASE/005P53-55.pdf"      "洪水内水-地域別-エリア⑧～⑩.pdf"
download "$BASE/006P56-60.pdf"      "洪水内水-地域別-エリア⑪～⑬.pdf"
download "$BASE/007P61-65.pdf"      "洪水内水-地域別-エリア⑭～⑯.pdf"
download "$BASE/008P66-69.pdf"      "洪水内水-地域別-エリア⑰～⑱.pdf"
download "$BASE/009P70-71.pdf"      "洪水内水-地域別-エリア⑲～⑳.pdf"
download "$BASE/010P72-76.pdf"      "洪水内水-地域別-エリア㉑.pdf"
download "$BASE/011P77-80.pdf"      "洪水内水-地域別-エリア㉒.pdf"
download "$BASE/012P81-82.pdf"      "洪水内水-地域別-エリア㉓.pdf"
download "$BASE/013P83-84.pdf"      "洪水内水-地域別-エリア㉔.pdf"
download "$BASE/014P85-86.pdf"      "洪水内水-地域別-P85-86.pdf"
download "$BASE/015P87-89.pdf"      "洪水内水-地域別-P87-89.pdf"
download "$BASE/016P90-92.pdf"      "洪水内水-地域別-P90-92.pdf"
download "$BASE/017P93-96.pdf"      "洪水内水-地域別-P93-96.pdf"
download "$BASE/018P97-102.pdf"     "洪水内水-地域別-P97-102.pdf"
download "$BASE/019P103-105.pdf"    "洪水内水-地域別-P103-105.pdf"
download "$BASE/020P106-107.pdf"    "洪水内水-地域別-P106-107.pdf"
download "$BASE/021P108.pdf"        "洪水内水-地域別-P108.pdf"
download "$BASE/022P109.pdf"        "洪水内水-地域別-P109.pdf"
download "$BASE/023P110.pdf"        "洪水内水-地域別-P110.pdf"
download "$BASE/024P111.pdf"        "洪水内水-地域別-P111.pdf"
download "$BASE/026P112.pdf"        "洪水内水-地域別-P112.pdf"
download "$BASE/027P113-115.pdf"    "洪水内水-地域別-P113-115.pdf"
download "$BASE/028P116-118.pdf"    "浸水継続時間図-全域.pdf"

echo ""
echo "=== 洪水・内水（全域マップ）==="
download "$BASE/tyubu.pdf"          "洪水内水-全域-中部.pdf"
download "$BASE/tobu.pdf"           "洪水内水-全域-東部.pdf"
download "$BASE/nanbu.pdf"          "洪水内水-全域-南部.pdf"
download "$BASE/100hokubu.pdf"      "洪水内水-全域-北部.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
