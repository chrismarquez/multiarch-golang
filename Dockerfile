
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
WORKDIR /app
COPY . .
RUN go run scripts/env.go $TARGETPLATFORM
RUN source ./env.txt && go build  -o build/main ./src

FROM alpine
COPY --from=build /app/build/main .
CMD [ "./main" ]

