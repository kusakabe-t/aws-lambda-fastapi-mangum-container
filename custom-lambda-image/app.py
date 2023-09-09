from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()

@app.get('/test1')
async def test1():
  return {"message": "test"}

@app.post('/test2')
async def test():
  return {'message': "test2"}

@app.post('/test3')
async def test1(message: str):
  return {'message': message}

# export port 8080
handler = Mangum(app)
