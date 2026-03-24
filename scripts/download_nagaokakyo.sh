#!/bin/bash
# Download Nagaokakyo City (長岡京市) Hazard Maps
# Source: https://www.city.nagaokakyo.lg.jp/0000000329.html

BASE="https://www.city.nagaokakyo.lg.jp/cmsfiles/contents/0000000/329"
OUT="/home/user/hazard_map/京都府/長岡京市"
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

echo "=== 長岡京市 防災ハザードマップ（R7版）==="

download "$BASE/R7_05-06.pdf"    "洪水-全域-大雨による氾濫（情報）.pdf"
download "$BASE/R7_07-08.pdf"    "土砂-全域-大雨による土砂災害（情報）.pdf"
download "$BASE/R7_13-14.pdf"    "洪水土砂-全域-索引図.pdf"
download "$BASE/R7_15-16.pdf"    "洪水土砂-地域別-危険区域1.pdf"
download "$BASE/R7_17-18.pdf"    "洪水土砂-地域別-危険区域2.pdf"
download "$BASE/R7_19-20.pdf"    "洪水土砂-地域別-危険区域3.pdf"
download "$BASE/R7_21-22.pdf"    "洪水土砂-地域別-危険区域4.pdf"
download "$BASE/R7_23-24.pdf"    "洪水土砂-地域別-危険区域5.pdf"
download "$BASE/R7_27.pdf"       "洪水-地域別-桂川.pdf"
download "$BASE/R7_28.pdf"       "洪水-地域別-小畑川.pdf"
download "$BASE/R7_29.pdf"       "洪水-地域別-小泉川.pdf"
download "$BASE/R7_30.pdf"       "洪水-地域別-犬川.pdf"
download "$BASE/R7_31.pdf"       "洪水-地域別-善峰川.pdf"
download "$BASE/R7_32.pdf"       "洪水-地域別-西羽束師川.pdf"
download "$BASE/R7_33-34.pdf"    "洪水-全域-桂川浸水継続時間.pdf"
download "$BASE/R7_35.pdf"       "洪水-全域-小畑川浸水継続時間.pdf"
download "$BASE/R7_36.pdf"       "洪水-全域-小泉川浸水継続時間.pdf"
download "$BASE/R7_37-38.pdf"    "内水-全域-索引図.pdf"
download "$BASE/R7_39-40.pdf"    "内水-地域別-区域1.pdf"
download "$BASE/R7_41-42.pdf"    "内水-地域別-区域2.pdf"
download "$BASE/R7_43-44.pdf"    "内水-地域別-区域3.pdf"
download "$BASE/R7_45-46.pdf"    "内水-全域-浸水継続時間.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
