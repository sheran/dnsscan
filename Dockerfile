FROM golang:alpine

RUN apk update && apk add --no-cache bind-tools unbound ca-certificates tzdata && update-ca-certificates
RUN go install github.com/OJ/gobuster/v3@latest
ENV TZ=Asia/Singapore
COPY pi-hole.conf /etc/unbound/unbound.conf
COPY root.hints /etc/unbound/root.hints
COPY runner.sh /usr/bin/runner.sh
ADD https://raw.githubusercontent.com/sheran/SecLists/master/Discovery/DNS/subdomains-top1million-110000.txt /usr/lib/dnsscan/wordlist.txt
EXPOSE 5335/tcp
EXPOSE 5335/udp
ENTRYPOINT [ "runner.sh" ]
