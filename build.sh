#!/usr/bin/env bash
#
# builds release CI

readonly VERSION="v0.1_mc26.x"
readonly DATA_PACK="pets_can_ride_horses"
readonly RESOURCE_PACK="invisible_acacia_boat"

mkdir -p dist

zip -r "dist/${DATA_PACK}_${VERSION}.zip" "$DATA_PACK" "$RESOURCE_PACK" README.md
