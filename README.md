# docker-mongo-seed

> A Docker image to seed your Mongo database.

[![](https://images.microbadger.com/badges/image/knowankit/docker-mongo-seed.svg)](https://microbadger.com/images/knowankit/docker-mongo-seed "Get your own image badge on microbadger.com")

---

## Purpose

Docker image to seed your mongo database with ease. Available on [Docker Hub](https://hub.docker.com/r/knowankit/docker-mongo-seed)

## Installation

```
$ docker pull knowankit/docker-mongo-seed[:<version>]
```

## Usage

```yaml
version: '3.3'

services:

  mongo:
    image: mongo
    container_name: mongo
    ports:
      - 27017:27017

  docker-mongo-seed:
    image: knowankit/docker-mongo-seed
    environment:
      - MONGODB_HOST=mongo
      - MONGODB_PORT=27017
    volumes:
      - ./mongo-seed/json:/json
    depends_on:
      - mongo
```