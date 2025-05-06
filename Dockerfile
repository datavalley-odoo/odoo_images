FROM odoo:18.0

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl nano pkg-config gsfonts build-essential libcairo2-dev python3-pip python3-cairo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    setuptools wheel

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    pip

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    gdown dbfread ofxparse pyzk PyJWT google-auth num2words phonenumbers reportlab \
    openpyxl ebaysdk firebase-admin pdfminer.six qrcode astor email_validator asana \
    pandas pyOpenSSL dropbox pyncclient nextcloud-api-wrapper paramiko geoip2 boto3 \
    lxml_html_clean python-barcode