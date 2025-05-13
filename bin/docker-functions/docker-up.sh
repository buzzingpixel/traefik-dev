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
    localMkCert "craft-slim-bridge.localtest.me";
    localMkCert "craft-scheduler.localtest.me";
    localMkCert "stmark.localtest.me";
    localMkCert "2017.eeconf.localtest.me";
    localMkCert "2018.eeconf.localtest.me";
    localMkCert "2019.eeconf.localtest.me";
    localMkCert "2020.eeconf.localtest.me";
    localMkCert "2021.eeconf.localtest.me";
    localMkCert "2022.eeconf.localtest.me";
    localMkCert "cfp.eeconf.localtest.me";
    localMkCert "eeconf.localtest.me";
    localMkCert "newberry-hospital.localtest.me";
    localMkCert "newberry-test.localtest.me";
    localMkCert "hospice.localtest.me";
    localMkCert "fced.localtest.me";
    localMkCert "fcsc.localtest.me";
    localMkCert "termitepestsolutions.localtest.me";
    localMkCert "anseleephp74.localtest.me";
    localMkCert "anseleephp74.test";
    localMkCert "anseleephp80.localtest.me";
    localMkCert "anseleephp80.test";
    localMkCert "anseleephp81.localtest.me";
    localMkCert "anseleephp81.test";
    localMkCert "anselcraft3php74.localtest.me";
    localMkCert "anselcraft3php74.test";
    localMkCert "anselcraft3php80.localtest.me";
    localMkCert "anselcraft3php80.test";
    localMkCert "anselcraft3php81.localtest.me";
    localMkCert "anselcraft3php81.test";
    localMkCert "anselee7php74.localtest.me";
    localMkCert "anselee7php74.test";
    localMkCert "anselee7php80.localtest.me";
    localMkCert "anselee7php80.test";
    localMkCert "anselee7php81.localtest.me";
    localMkCert "anselee7php81.test";
    localMkCert "anseleecoilpackphp80.localtest.me";
    localMkCert "anseleecoilpackphp80.test";
    localMkCert "anseleecoilpackphp81.localtest.me";
    localMkCert "anseleecoilpackphp81.test";
    localMkCert "sccb.localtest.me";
    localMkCert "sccb2.localtest.me";
    localMkCert "companion-life.localtest.me";
    localMkCert "coilpack-testing-01.localtest.me";
    localMkCert "teg.localtest.me";
    localMkCert "gatch.localtest.me";
    localMkCert "mysccta-sc-broadband-assoc.localtest.me";
    localMkCert "api.mission-control.localtest.me";
    localMkCert "auth.mission-control.localtest.me";
    localMkCert "account.mission-control.localtest.me";
    localMkCert "mailhog.mission-control.localtest.me";
    localMkCert "mission-control.localtest.me";
    localMkCert "colonial-packaging.localtest.me";
    localMkCert "blueoceandocker.localtest.me";
    localMkCert "deltaepsilon.localtest.me";
    localMkCert "dixietools.localtest.me";
    localMkCert "insulationsc.localtest.me";
    localMkCert "hobgoodelectric.localtest.me";
    localMkCert "dwg-dev-up.localtest.me";
    localMkCert "dwg-dev-up.localtest.me";
    localMkCert "intermarkmgt.localtest.me";
    localMkCert "bradleyyccgrant.localtest.me";
    localMkCert "dwg-standards.localtest.me";
    localMkCert "newberryoperahouse.localtest.me";
    localMkCert "mission-control-app.localtest.me";
    localMkCert "bulldog.localtest.me";
    localMkCert "qotd.mikedubose.localtest.me";
    localMkCert "lakemurrayboating.localtest.me";
    localMkCert "iisinet.localtest.me";
    localMkCert "stmarkreformed.localtest.me";
    localMkCert "cms.stmarkreformed.localtest.me";
    localMkCert "auth.stmarkreformed.localtest.me";
    localMkCert "api.stmarkreformed.localtest.me";
    localMkCert "mailhog.stmarkreformed.localtest.me";
    localMkCert "sermons.tjdraper.localtest.me";
    localMkCert "tjdraper.localtest.me";
    localMkCert "ramblings.tjdraper.localtest.me";

    docker compose ${composeFiles} -p traefik-dev up -d;

    return 0;
}
