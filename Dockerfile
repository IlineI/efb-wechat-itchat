FROM alpine
MAINTAINER Phoenix <hkxseven007@gmail.com>

ENV LANG C.UTF-8

RUN set -ex \
        && apk update && apk upgrade \
        && apk add --no-cache udns \
        && apk add --no-cache --virtual .run-deps \
                ca-certificates \
                ffmpeg \
                libmagic \
                tiff \
                libwebp \
                freetype \
                lcms2 \
                openjpeg \
                py3-olefile \
                openblas \
                py3-numpy \
                py3-pillow \
                py3-requests \
                python3-dev \
                py3-pip \
                py3-cryptography \
                py3-decorator \
                git \
                jpeg-dev \
                zlib-dev \
                tzdata \
                iproute2 \
                cairo-dev \
                cairo \
                cairo-tools \
                jpeg-dev \
                freetype-dev \
                lcms2-dev \
                openjpeg-dev \
                tiff-dev \
                tk-dev \
                tcl-dev \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

RUN set -ex \
        && pip3 install --upgrade pip \
        && pip3 install git+https://github.com/ehForwarderBot/ehForwarderBot \
        && pip3 install git+https://github.com/ehForwarderBot/efb-telegram-master \
        && pip3 install git+https://github.com/ehForwarderBot/efb-wechat-slave \
        && pip3 install lottie \
        && pip3 install cairosvg \
        && sed -i 's/channel_emoji = "💬"/channel_emoji = "𝙒𝙚𝙘𝙝𝙖𝙩"/g' /usr/lib/python3.8/site-packages/efb_wechat_slave/__init__.py \
        && sed -i "s/{self.chat_type_emoji}/丨/g" /usr/lib/python3.8/site-packages/efb_telegram_master/chat.py \
        && pip3 install git+https://github.com/ehForwarderBot/efb-mp-instantview-middleware \
        && pip3 install git+https://github.com/ehForwarderBot/efb-link_preview-middleware \
        && pip3 install git+https://github.com/ehForwarderBot/efb-patch-middleware \
        && pip3 install git+https://github.com/ehForwarderBot/efb-voice_recog-middleware

CMD ["ehforwarderbot"]
