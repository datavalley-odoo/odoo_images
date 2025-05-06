FROM odoo:18.0

USER root

COPY ./odoo/GeoLite2-*.mmdb /usr/share/GeoIP/

COPY ./odoo/odoo.conf /etc/odoo/odoo.conf

COPY ./addons /mnt/addons

RUN chown -R odoo:odoo /usr/share/GeoIP /etc/odoo /mnt/extra-addons

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl nano pkg-config gsfonts build-essential libcairo2-dev python3-pip python3-cairo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    setuptools wheel pip

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    gdown dbfread ofxparse pyzk PyJWT google-auth num2words phonenumbers reportlab \
    openpyxl ebaysdk firebase-admin pdfminer.six qrcode astor email_validator asana \
    pandas pyOpenSSL dropbox pyncclient nextcloud-api-wrapper paramiko geoip2 boto3 \
    lxml_html_clean python-barcode