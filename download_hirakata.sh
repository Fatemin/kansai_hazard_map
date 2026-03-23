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
download "$BASE/01P44.pdf"          "洪水内水-索引図.pdf"
download "$BASE/02P45.pdf"          "洪水-木津川沿岸.pdf"
download "$BASE/003P46-48.pdf"      "洪水内水-エリア①③.pdf"
download "$BASE/004P49-52.pdf"      "洪水内水-エリア④⑦.pdf"
download "$BASE/005P53-55.pdf"      "洪水内水-エリア⑧⑩.pdf"
download "$BASE/006P56-60.pdf"      "洪水内水-エリア⑪⑬.pdf"
download "$BASE/007P61-65.pdf"      "洪水内水-エリア⑭⑯.pdf"
download "$BASE/008P66-69.pdf"      "洪水内水-エリア⑰⑱.pdf"
download "$BASE/009P70-71.pdf"      "洪水内水-エリア⑲⑳.pdf"
download "$BASE/010P72-76.pdf"      "洪水内水-エリア㉑.pdf"
download "$BASE/011P77-80.pdf"      "洪水内水-エリア㉒.pdf"
download "$BASE/012P81-82.pdf"      "洪水内水-エリア㉓.pdf"
download "$BASE/013P83-84.pdf"      "洪水内水-エリア㉔.pdf"
download "$BASE/014P85-86.pdf"      "洪水内水-P85-86.pdf"
download "$BASE/015P87-89.pdf"      "洪水内水-P87-89.pdf"
download "$BASE/016P90-92.pdf"      "洪水内水-P90-92.pdf"
download "$BASE/017P93-96.pdf"      "洪水内水-P93-96.pdf"
download "$BASE/018P97-102.pdf"     "洪水内水-P97-102.pdf"
download "$BASE/019P103-105.pdf"    "洪水内水-P103-105.pdf"
download "$BASE/020P106-107.pdf"    "洪水内水-P106-107.pdf"
download "$BASE/021P108.pdf"        "洪水内水-P108.pdf"
download "$BASE/022P109.pdf"        "洪水内水-P109.pdf"
download "$BASE/023P110.pdf"        "洪水内水-P110.pdf"
download "$BASE/024P111.pdf"        "洪水内水-P111.pdf"
download "$BASE/026P112.pdf"        "洪水内水-P112.pdf"
download "$BASE/027P113-115.pdf"    "洪水内水-P113-115.pdf"
download "$BASE/028P116-118.pdf"    "浸水継続時間図-全域.pdf"

echo ""
echo "=== 洪水・内水（全域マップ）==="
download "$BASE/tyubu.pdf"          "洪水内水-全域中部.pdf"
download "$BASE/tobu.pdf"           "洪水内水-全域東部.pdf"
download "$BASE/nanbu.pdf"          "洪水内水-全域南部.pdf"
download "$BASE/100hokubu.pdf"      "洪水内水-全域北部.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
