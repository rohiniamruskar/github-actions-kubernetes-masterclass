# syntax=docker/dockerfile:1.7

# Stage 1: Build
FROM golang:1.26-alpine3.23 AS builder

WORKDIR /app

# Better Docker cache usage
COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Build optimized static binary
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 GOOS=linux go build \
    -ldflags="-s -w" \
    -trimpath \
    -o skillpulse .

# Stage 2: Minimal Runtime
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /app

COPY --from=builder /app/skillpulse .

EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/skillpulse"]
