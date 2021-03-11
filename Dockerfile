
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
WORKDIR /app
COPY . .
RUN go run scripts/env.go $TARGETPLATFORM
RUN source ./vars && go build  -o build/main ./src

FROM alpine
COPY --from=build /app/build/main .
CMD [ "./main" ]

