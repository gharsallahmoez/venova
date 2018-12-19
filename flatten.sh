#!/usr/bin/env bash

rm -rf flats/*
./node_modules/.bin/truffle-flattener contracts/Venova.sol > flats/Venova_flat.sol

./node_modules/.bin/truffle-flattener contracts/VenovaCrowdsale.sol > flats/VenovaCrowdsale_flat.sol