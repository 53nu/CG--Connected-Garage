#!/bin/bash
# 이 파일을 더블클릭하면 로컬 서버가 열립니다
cd "$(dirname "$0")"

# 포트 충돌 방지: 8080 → 8081 → 8082 순으로 빈 포트 찾기
PORT=8080
while lsof -i :$PORT &>/dev/null; do
  PORT=$((PORT + 1))
done

echo "================================================"
echo "  Room Archive 포트폴리오 서버 시작 중..."
echo "  주소: http://localhost:$PORT"
echo "  종료하려면 이 창을 닫으세요"
echo "================================================"

# 브라우저를 약간 지연 후 자동으로 엽니다
(sleep 0.8 && open "http://localhost:$PORT") &

python3 -m http.server $PORT
