#!/usr/bin/env bash

function docker-up-help() {
    printf "(Brings Docker environment online)";
}

function docker-up() {
    # Make sure requirements are met
    if [ ! $(command -v mkcert) ]; then
        printf "${Red}'mkcert' must be installed. To install mkcert, run the following: ${Reset}\n";
        printf "${Cyan}(homebrew is required)\n\n";
        printf "${Green}    brew install mkcert\n";
        printf "    brew install nss\n";
        printf "    mkcert -install${Reset}\n\n";
        printf "${Red}Halting docker-up ${Reset}\n";

        return 1;
    fi

    # Local, reusable function to make certs
    function localMkCert() {
        # Only run if our cert or key is missing
        printf "${Cyan}Generating new local cert for ${1} with mkcert...${Reset}\n";

        mkcert \
            -cert-file certs/${1}.cert \
            -key-file certs/${1}.key \
            ${1};

        printf "${Green}${1} cert created${Reset}\n";
    }

    # Ensure certificates exist with or reusable local function
    localMkCert "localhost";
    localMkCert "buzzingpixel.localtest.me";
    localMkCert "nightowl.localtest.me";
    localMkCert "eeconf.localtest.me";
    localMkCert "craft-slim-bridge.localtest.me";
    localMkCert "craft-scheduler.localtest.me";

    docker compose ${composeFiles} -p traefik-dev up -d;

    return 0;

}
