# Stage 1: Build
#FROM golang:1.26-alpine AS builder

#WORKDIR /app

#COPY . .
#RUN go mod tidy && CGO_ENABLED=0 GOOS=linux go build -o skillpulse .

# Stage 2: Run
#FROM alpine:3.23

#RUN apk --no-cache add ca-certificates

#WORKDIR /app

#COPY --from=builder /app/skillpulse .

#EXPOSE 8080

#CMD ["./skillpulse"]



# Stage 1: Build
FROM golang:1.26-alpine AS builder

WORKDIR /app

# Better Docker cache usage
COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Build optimized static binary
RUN CGO_ENABLED=0 GOOS=linux go build \
    -ldflags="-s -w" \
    -trimpath \
    -o skillpulse .

# Stage 2: Minimal Runtime
FROM gcr.io/distroless/static-debian12

WORKDIR /app

COPY --from=builder /app/skillpulse .

EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/skillpulse"]
