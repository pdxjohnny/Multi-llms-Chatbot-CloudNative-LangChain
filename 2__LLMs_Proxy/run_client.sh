if [[ "x${OPENAI_API_KEY}" == "x" ]]; then
  OPENAI_API_KEY="$(python -m keyring get $USER openai.api.key)"
fi

export OPENAI_API_KEY

export OPENAI_BASE_URL="http://localhost:4000"

exec python -u client.py $@
