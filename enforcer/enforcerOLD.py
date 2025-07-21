import asyncio
import httpx

async def enforcer_loop():
    try:
        async with httpx.AsyncClient() as client:
            conditions_response = await client.get("http://localhost:8000/probe/conditions")
            conditions_data_json = conditions_response.json()

            print(f"Conditions: {conditions_data_json}")

            conditions_data = conditions_data_json.get("some_condition")
            if conditions_data is None:
                print("No conditions data")
                return

            # Data analysis, then when done and if needed
            task = "Some task"

            obligation_response = await client.post(
                "http://localhost:8001/obligation/execute",
                json={"task": task}
            )
            obligation_response_json = obligation_response.json()

            print(f"Obligation service response: {obligation_response_json}")

    except Exception as e:
        print(f"Error in REST call: {e}")


async def main():
    while True:
        await enforcer_loop()
        await asyncio.sleep(5.0)

if __name__ == "__main__":
    asyncio.run(main())