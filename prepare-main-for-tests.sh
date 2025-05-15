#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    sed -i '' 's/import Week/import SolutionWeek/g' test/*tests.hs
else ; then
    sed -i 's/import Week/import SolutionWeek/g' test/*tests.hs
fi
