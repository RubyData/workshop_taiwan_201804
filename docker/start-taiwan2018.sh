#!/bin/bash

set -e

if [[ -n "$JUPYTER_NOTEBOOK_TOKEN" ]]; then
  token="--NotebookApp.token=$JUPYTER_NOTEBOOK_TOKEN"
fi

cd $HOME/taiwan2018
bundle exec sh -c "cd; /usr/local/bin/start.sh jupyter notebook $token $*"
