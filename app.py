from fastapi import FastAPI
import uvicorn
app = FastAPI()

@app.get("/")
def read_root():
    return {"all is well"}

if __name__ == '__main__':
    uvicorn.run(app, host="0.0.0.0", port=5000)