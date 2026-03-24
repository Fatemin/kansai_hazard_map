#!/bin/bash
# Download Osaka City (大阪市) Hazard Maps
# Source: https://www.city.osaka.lg.jp/kikikanrishitsu/page/0000299877.html
# Coverage: 水害ハザードマップ（洪水・高潮・津波・内水）全24区

BASE="https://www.city.osaka.lg.jp/kikikanrishitsu/cmsfiles/contents/0000300"
OUT="/home/user/hazard_map/大阪市"
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

echo "=== 水害ハザードマップ（全24区）==="

# 01 北区
download "$BASE/300714/1kitaku_chizumen202107.pdf"    "水害-地域別-北区-地図面.pdf"
download "$BASE/300714/01kitaku(keihatu)hp.pdf"       "水害-地域別-北区-啓発面.pdf"
download "$BASE/300714/1kita(tyuusyo).pdf"            "水害-地域別-北区-追加.pdf"

# 02 都島区
download "$BASE/300781/2miyakojimaku_chizumen202107.pdf"  "水害-地域別-都島区-地図面.pdf"
download "$BASE/300781/02miyakojimaku(keihatu)hp.pdf"     "水害-地域別-都島区-啓発面.pdf"
download "$BASE/300781/2miyakojima(tyuusyo).pdf"          "水害-地域別-都島区-追加.pdf"

# 03 福島区
download "$BASE/300816/3hukushimaku_chizumen202107.pdf"   "水害-地域別-福島区-地図面.pdf"
download "$BASE/300816/03fukushimaku(keihatu)hp.pdf"      "水害-地域別-福島区-啓発面.pdf"
download "$BASE/300816/3fukusima(tyuusyo).pdf"            "水害-地域別-福島区-追加.pdf"

# 04 此花区
download "$BASE/300823/4konohanaku_chizumen202107.pdf"    "水害-地域別-此花区-地図面.pdf"
download "$BASE/300823/04konohanaku(keihatu)hp.pdf"       "水害-地域別-此花区-啓発面.pdf"
download "$BASE/300823/4konohana(tyuusyo).pdf"            "水害-地域別-此花区-追加.pdf"

# 05 中央区
download "$BASE/300824/5tyuuouku_chizumen202107.pdf"      "水害-地域別-中央区-地図面.pdf"
download "$BASE/300824/05tyuuouku(keihatu)hp.pdf"         "水害-地域別-中央区-啓発面.pdf"

# 06 西区
download "$BASE/300825/6nishiku_chizumen202107.pdf"       "水害-地域別-西区-地図面.pdf"
download "$BASE/300825/06nishiku(keihatu)hp.pdf"          "水害-地域別-西区-啓発面.pdf"

# 07 港区
download "$BASE/300826/7minatoku_chizumen202107.pdf"      "水害-地域別-港区-地図面.pdf"
download "$BASE/300826/07minatoku(keihatu)hp.pdf"         "水害-地域別-港区-啓発面.pdf"
download "$BASE/300826/7minato(tyuusyo).pdf"              "水害-地域別-港区-追加.pdf"

# 08 大正区
download "$BASE/300829/8taisyouku_chizumen202107.pdf"     "水害-地域別-大正区-地図面.pdf"
download "$BASE/300829/08taishouku(keihatu)hp.pdf"        "水害-地域別-大正区-啓発面.pdf"

# 09 天王寺区
download "$BASE/300831/9tennnoujiku_chizumen202107.pdf"   "水害-地域別-天王寺区-地図面.pdf"
download "$BASE/300831/09tennoojiku(keihatu)hp.pdf"       "水害-地域別-天王寺区-啓発面.pdf"

# 10 浪速区
download "$BASE/300835/10naniwaku_chizumen202107.pdf"     "水害-地域別-浪速区-地図面.pdf"
download "$BASE/300835/10naniwaku(keihatu)hp.pdf"         "水害-地域別-浪速区-啓発面.pdf"
download "$BASE/300835/10naniwa(tyuusyo).pdf"             "水害-地域別-浪速区-追加.pdf"

# 11 西淀川区
download "$BASE/300840/11nishiyodogawaku_chizumen202403.pdf"  "水害-地域別-西淀川区-地図面.pdf"
download "$BASE/300840/11nishiyodogawaku(keihatu)hp.pdf"      "水害-地域別-西淀川区-啓発面.pdf"
download "$BASE/300840/11nishiyodogawaku(sashikomi).pdf"      "水害-地域別-西淀川区-差込版.pdf"

# 12 淀川区
download "$BASE/300843/12yodogawa_chizumen202403.pdf"         "水害-地域別-淀川区-地図面.pdf"
download "$BASE/300843/12yodogawaku(keihatu)hp.pdf"           "水害-地域別-淀川区-啓発面.pdf"
download "$BASE/300843/12yodogawa_sashikomi202505.pdf"        "水害-地域別-淀川区-差込版.pdf"

# 13 東淀川区
download "$BASE/300847/13higashiyodogawaku_chizumen202403.pdf"  "水害-地域別-東淀川区-地図面.pdf"
download "$BASE/300847/13higashiyodogawaku(keihatu)hp.pdf"      "水害-地域別-東淀川区-啓発面.pdf"
download "$BASE/300847/13higashiyodogawaku(sashikomi).pdf"      "水害-地域別-東淀川区-差込版.pdf"

# 14 東成区
download "$BASE/300850/14higashinariku_chizumen202107.pdf"    "水害-地域別-東成区-地図面.pdf"
download "$BASE/300850/14higashinariku(keihatu)hp.pdf"        "水害-地域別-東成区-啓発面.pdf"

# 15 生野区
download "$BASE/300870/15ikunoku_chizumen202107.pdf"          "水害-地域別-生野区-地図面.pdf"
download "$BASE/300870/15ikunoku(keihatu)hp.pdf"              "水害-地域別-生野区-啓発面.pdf"

# 16 旭区
download "$BASE/300876/16asahiku_chizumen202107.pdf"          "水害-地域別-旭区-地図面.pdf"
download "$BASE/300876/16asahiku(keihatu)hp.pdf"              "水害-地域別-旭区-啓発面.pdf"
download "$BASE/300876/16asahi(tyuusyo).pdf"                  "水害-地域別-旭区-追加.pdf"

# 17 城東区
download "$BASE/300877/17joutouku_chizumen202107.pdf"         "水害-地域別-城東区-地図面.pdf"
download "$BASE/300877/17joutouku(keihatu)hp.pdf"             "水害-地域別-城東区-啓発面.pdf"
download "$BASE/300877/17joutou(tyuusyo).pdf"                 "水害-地域別-城東区-追加.pdf"

# 18 鶴見区
download "$BASE/300880/18tsurumiku_chizumen202107.pdf"        "水害-地域別-鶴見区-地図面.pdf"
download "$BASE/300880/18tsurumiku(keihatu)hp.pdf"            "水害-地域別-鶴見区-啓発面.pdf"

# 19 阿倍野区
download "$BASE/300886/19abenoku_chizumen202107.pdf"          "水害-地域別-阿倍野区-地図面.pdf"
download "$BASE/300886/19abenoku(keihatu)hp.pdf"              "水害-地域別-阿倍野区-啓発面.pdf"

# 20 住之江区
download "$BASE/300890/20suminoeku_chizumen202107-2.pdf"      "水害-地域別-住之江区-地図面.pdf"
download "$BASE/300890/20suminoeku(keihatu)hp.pdf"            "水害-地域別-住之江区-啓発面.pdf"

# 21 住吉区
download "$BASE/300892/21sumiyoshiku_chizumen202107.pdf"      "水害-地域別-住吉区-地図面.pdf"
download "$BASE/300892/21sumiyoshiku(keihatu)hp.pdf"          "水害-地域別-住吉区-啓発面.pdf"

# 22 東住吉区
download "$BASE/300898/22higashisumiyoshiku_chizumen202107-2.pdf"  "水害-地域別-東住吉区-地図面.pdf"
download "$BASE/300898/22higashisumiyoshiku(keihatu)hp.pdf"        "水害-地域別-東住吉区-啓発面.pdf"

# 23 平野区
download "$BASE/300900/23hiranoku_chizumen202107.pdf"         "水害-地域別-平野区-地図面.pdf"
download "$BASE/300900/23hiranoku(keihatu)hp.pdf"             "水害-地域別-平野区-啓発面.pdf"

# 24 西成区
download "$BASE/300907/24nishinariku_chizumen202107.pdf"      "水害-地域別-西成区-地図面.pdf"
download "$BASE/300907/24nishinariku(keihatu)hp.pdf"          "水害-地域別-西成区-啓発面.pdf"
download "$BASE/300907/24nishinari(tyuusyo).pdf"              "水害-地域別-西成区-追加.pdf"

echo ""
echo "=== 完了 ==="
ls -lh "$OUT/"
