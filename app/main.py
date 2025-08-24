from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI!"}

@app.get("/db-test")
def db_test():
    db_url = os.getenv("POSTGRES_URL", "Not Set")
    return {"database_url": db_url}