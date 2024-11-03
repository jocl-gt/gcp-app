# Use the official Golang image to build the app
FROM golang:1.20 AS builder

# Set the working directory
WORKDIR /app

# Copy the Go Modules manifests
COPY go.mod go.sum ./

# Download the Go modules
RUN go mod download

# Copy the source code
COPY . .

# Build the Go app
RUN go build -o my-go-app .

# Use a minimal image to run the app
FROM gcr.io/distroless/base-debian10

# Copy the built binary from the builder stage
COPY --from=builder /app/my-go-app /my-go-app

# Expose the port the app runs on
EXPOSE 8080

# Command to run the binary
ENTRYPOINT ["/my-go-app"]
