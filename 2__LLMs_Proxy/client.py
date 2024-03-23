import sys
import asyncio
from openai import AsyncOpenAI

os.environ["OPENAI_BASE_URL"] = "http://localhost:4000"

client = AsyncOpenAI()


async def main():
    user_message = " ".join(sys.argv[1:])
    stream = await client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": user_message}],
        stream=True,
    )
    async for chunk in stream:
        print(chunk.choices[0].delta.content or "", end="")
    print()


if __name__ == "__main__":
    asyncio.run(main())
