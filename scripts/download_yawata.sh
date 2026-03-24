#!/bin/bash
# Download Yawata City (八幡市) Hazard Maps
# Source: https://www.city.yawata.kyoto.jp/0000000570.html

BASE="https://www.city.yawata.kyoto.jp/cmsfiles/contents/0000000/570"
OUT="/home/user/hazard_map/京都府/八幡市"
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

echo "=== 八幡市 防災ハザードマップ（R4版）==="

download "$BASE/R4hyousi-P11.pdf"      "防災情報-全域.pdf"
download "$BASE/R4ootanigawaP12-13.pdf" "洪水-全域-大谷川.pdf"
download "$BASE/R4koukuP18-P19.pdf"    "洪水-地域別-八幡小学校区1.pdf"
download "$BASE/R4koukuP20-P21.pdf"    "洪水-地域別-八幡小学校区2.pdf"
download "$BASE/R4koukuP22-P23.pdf"    "洪水-地域別-楠葉小学校区.pdf"
download "$BASE/R4koukuP24-P25.pdf"    "洪水-地域別-桜小学校区.pdf"
download "$BASE/R4koukuP26-P27.pdf"    "洪水-地域別-橋本小学校区.pdf"
download "$BASE/R4koukuP28-P29.pdf"    "洪水-地域別-有都小学校区.pdf"
download "$BASE/R4koukuP30-P31.pdf"    "洪水-地域別-中央小学校区.pdf"
download "$BASE/R4koukuP32-P33.pdf"    "洪水-地域別-南山小学校区.pdf"
download "$BASE/R4koukuP34-P35.pdf"    "洪水-地域別-美濃山小学校区.pdf"
download "$BASE/R4koukuP36-P37.pdf"    "洪水-地域別-長町・日野口.pdf"
download "$BASE/A2kizugawatizu.pdf"    "洪水-全域-木津川（A2判）.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
