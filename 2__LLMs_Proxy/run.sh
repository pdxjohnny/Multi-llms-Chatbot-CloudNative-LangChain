set -x

if [ -n "${OPENAI_API_KEY}" ]; then
  OPENAI_API_KEY="$(python -m keyring get $USER openai.api.key)"
fi

export OPENAI_API_KEY

set -x
exec python -u server.py --model gpt-3.5-turbo --config config.yaml $@
