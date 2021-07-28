# deploy

Files and Documentation Neccecary to deploy ChiefSend

# Requirements List

1. Build the API
2. Build the Frontend
3. Build the Admin Panel

4. nginx
5. SSL certificates
6. redis-server
7. database

# Requirements Preparation

## 1. Nginx

Just have it installed, no further/initial configuration needed

## 2. SSL certificates

Currently only letsencrypt certificates, managed by certbot are supported.

The have to be generated for the examt same domain you want to use as the server name.

You can generate certificates like this:

```
sudo certbot certonly -d ${DOMAIN}
```

# Install

```
sudo sh install.sh
```
