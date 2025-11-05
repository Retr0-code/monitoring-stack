#!/bin/sh

/usr/bin/openssl req -new -newkey rsa:2048 -nodes\
    -keyout api-proxy.key \
    -out api-proxy.csr \
    -config san.cnf

/usr/bin/openssl x509 -req -in api-proxy.csr \
    -CA ~/.minikube/ca.crt \
    -CAkey ~/.minikube/ca.key \
    -CAcreateserial \
    -out api-proxy.crt \
    -days 365 \
    -sha256 \
    -extfile san.cnf \
    -extensions v3_req
