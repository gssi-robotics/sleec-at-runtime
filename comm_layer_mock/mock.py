from multiprocessing import Process
from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn

probe = FastAPI()
obligation = FastAPI()

class TaskRequest(BaseModel):
    task: str

@probe.get("/probe/conditions")
async def get_conditions():
    # Add mock logic here
    return {"some_condition": "condition_value"}

@obligation.post("/obligation/execute")
async def execute_obligation(task: TaskRequest):
    # Add mock logic here
    return {"result": "Done!"}

def run_conditions():
    uvicorn.run(probe, host="0.0.0.0", port=8000)

def run_execute():
    uvicorn.run(obligation, host="0.0.0.0", port=8001)

if __name__ == "__main__":
    p1 = Process(target=run_conditions)
    p2 = Process(target=run_execute)

    p1.start()
    p2.start()

    p1.join()
    p2.join()