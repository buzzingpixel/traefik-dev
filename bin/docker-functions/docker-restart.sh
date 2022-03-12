#!/usr/bin/env bash

function docker-restart-help() {
    printf "(Spins down the Docker environment then bring it back online)";
}

function docker-restart() {
    docker-down;
    docker-up;

    return 0;
}
