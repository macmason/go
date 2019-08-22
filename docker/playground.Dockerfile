FROM golang

RUN go get github.com/huytd/playgo

RUN cd / &&                                                 \
    git clone https://github.com/alephzero/alephzero.git && \
    cd /alephzero &&                                        \
    make install -j &&                                      \
    cd / &&                                                 \
    rm -rf /alephzero

WORKDIR /go/src/github.com/huytd/playgo
ENTRYPOINT ["go"]
CMD ["run", ".", "--mode", "web"]