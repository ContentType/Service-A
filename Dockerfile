FROM golang:1.24.3-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod init service-a && go mod tidy && go build -o /service-a .

FROM alpine:3.21
RUN adduser -D -u 1000 appuser
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata
WORKDIR /app
COPY --from=builder /service-a .
RUN chown -R appuser:appuser /app
EXPOSE 5000
USER appuser
CMD ["/app/service-a"]