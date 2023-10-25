#!/bin/sh

# Сгенерировать ssl сертификат и создать секрет для HOST - домена сайта
#
# Использование:
#   sslgen.sh HOST [secretname]

HOST="${1}"
KEY_FILE=cert.key
CERT_FILE=ssl.crt
SECRET="${2:-ssl-cert-secret}"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}" -addext "subjectAltName = DNS:${HOST}"
kubectl create secret tls "${SECRET}" --key ${KEY_FILE} --cert ${CERT_FILE}
rm -f $KEY_FILE