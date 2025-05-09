FROM odoo:18.0

USER root

LABEL build.name="odoo" build.version="18.0"

RUN mkdir -p /mnt/1st-party/ /mnt/2nd-party/ /mnt/3rd-party/

COPY ./odoo/GeoLite2-*.mmdb /usr/share/GeoIP/

COPY ./odoo/odoo.conf /etc/odoo/

COPY ./extra-addons /mnt/extra-addons/

RUN chown -R odoo:odoo /usr/share/GeoIP/ /etc/odoo/ /mnt/extra-addons/ /mnt/1st-party/ /mnt/2nd-party/ /mnt/3rd-party/

RUN chmod -R 755 /usr/share/GeoIP/ /etc/odoo/ /mnt/extra-addons/ /mnt/1st-party/ /mnt/2nd-party/ /mnt/3rd-party/

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl nano pkg-config gsfonts build-essential libcairo2-dev python3-pip python3-cairo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    setuptools wheel pip

RUN python3 -m pip install --no-cache-dir --upgrade --ignore-installed --break-system-packages \
    gdown dbfread ofxparse pyzk pyOpenSSL google-auth num2words phonenumbers reportlab  \
    lxml_html_clean firebase-admin ebaysdk qrcode astor asana openpyxl email_validator   \
    PyJWT dropbox pyncclient nextcloud-api-wrapper paramiko geoip2 python-barcode pandas \
    pdfminer.six six 'boto3<=1.15.18'