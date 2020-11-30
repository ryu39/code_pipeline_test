# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1
FROM alpine:3.6

# nginxのインストール
RUN apk update && \
  apk add --no-cache nginx

# ドキュメントルート
ADD app /app
ADD default.conf /etc/nginx/conf.d/default.conf

# ポート設定
EXPOSE 80

RUN mkdir -p /run/nginx

# フォアグラウンドでnginx実行
CMD nginx -g "daemon off;"
