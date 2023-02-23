FROM golang:1.20.1-alpine AS builder

WORKDIR /src/app

COPY hello.go .

RUN go build -o /app hello.go


FROM scratch

COPY --from=builder /app .

CMD [ "/app" ]