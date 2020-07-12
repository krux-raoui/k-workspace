FROM kindest/node:v1.18.2

# COPY Workwspace ca root certificate to trust on all nodes
COPY kws.pem /usr/local/share/ca-certificates/kws.crt
RUN chmod 644 /usr/local/share/ca-certificates/kws.crt 
RUN update-ca-certificates
