FROM golang:1.25.1

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
COPY tracker.db ./

# modernc/sqlite использует cgo
ENV CGO_ENABLED=1

RUN go build -o app .

CMD ["./app"]