#!/bin/sh
set -ex

mkdir -p packages/preview/athena-tu-darmstadt-exercise
mkdir -p packages/preview/athena-tu-darmstadt-thesis
mkdir -p packages/preview/not-tudabeamer-2023

source ./scripts/versions.sh
ln -s ../../../templates/tudaexercise packages/preview/athena-tu-darmstadt-exercise/$athena_tu_darmstadt_exercise_version
ln -s ../../../templates/tudapub packages/preview/athena-tu-darmstadt-thesis/$athena_tu_darmstadt_thesis_version
ln -s ../../../templates/not-tudabeamer-2023 packages/preview/not-tudabeamer-2023/$not_tudabeamer_2023_version
