#!/bin/bash
# Download Kyoto City (京都市) Hazard Maps
# Source: https://www.bousai.city.kyoto.lg.jp/0000000143.html

BASE="https://www.bousai.city.kyoto.lg.jp/cmsfiles/contents/0000000/143"
OUT="/home/user/hazard_map/京都府/京都市"
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

echo "=== 水害ハザードマップ（京都市各区）==="

# 北区
download "$BASE/01kitasuigai.pdf"              "水害-地域別-北区-地図面.pdf"
download "$BASE/01kitasuigaijyouhou.pdf"        "水害-地域別-北区-情報版.pdf"

# 上京区・中京区
download "$BASE/02kamigyou_nakagyou.pdf"        "水害-地域別-上京区・中京区-地図面.pdf"
download "$BASE/02kamigyou_nakagyoujoho.pdf"    "水害-地域別-上京区・中京区-情報版.pdf"

# 左京区
download "$BASE/03sakyou.pdf"                   "水害-地域別-左京区-地図面.pdf"
download "$BASE/03sakyoujoho.pdf"               "水害-地域別-左京区-情報版.pdf"

# 東山区・下京区
download "$BASE/04higasiyama_simogyou.pdf"      "水害-地域別-東山区・下京区-地図面.pdf"
download "$BASE/04higasiyama_simogyoujoho.pdf"  "水害-地域別-東山区・下京区-情報版.pdf"

# 山科区（2024-08更新）
download "$BASE/240807_M_yamasina_ol.pdf"       "水害-地域別-山科区-地図面.pdf"
download "$BASE/05yamasinajoho.pdf"             "水害-地域別-山科区-情報版.pdf"

# 南区
download "$BASE/06minami.pdf"                   "水害-地域別-南区-地図面.pdf"
download "$BASE/06minamijoho.pdf"               "水害-地域別-南区-情報版.pdf"

# 右京区（京北除く）
download "$BASE/07ukyou.pdf"                    "水害-地域別-右京区-地図面.pdf"
download "$BASE/07ukyoujoho.pdf"                "水害-地域別-右京区-情報版.pdf"

# 右京区（京北地区）
download "$BASE/08keihoku.pdf"                  "水害-地域別-右京区（京北地区）-地図面.pdf"
download "$BASE/08keihokujoho.pdf"              "水害-地域別-右京区（京北地区）-情報版.pdf"

# 西京区
download "$BASE/09nishigyou_map.pdf"            "水害-地域別-西京区-地図面.pdf"
download "$BASE/09nishikyoujoho.pdf"            "水害-地域別-西京区-情報版.pdf"

# 伏見区（西部）
download "$BASE/10fusimi_seibu.pdf"             "水害-地域別-伏見区（西部）-地図面.pdf"
download "$BASE/10fusimi_seibujoho.pdf"         "水害-地域別-伏見区（西部）-情報版.pdf"

# 伏見区（東部）
download "$BASE/11fusimi_toubu.pdf"             "水害-地域別-伏見区（東部）-地図面.pdf"
download "$BASE/11fusimi_toubujoho.pdf"         "水害-地域別-伏見区（東部）-情報版.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
