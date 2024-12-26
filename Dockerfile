from golang:1.20 AS builder

workdir /app

copy fullcycle.go ./

run go build fullcycle.go

from scratch

workdir /app

copy --from=builder /app/fullcycle .

cmd ["./fullcycle"]