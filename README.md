# Streamlit-Starter
Starter Templete repository

## Streamlit Starter Templete 

## Setting up Virtual Environment
```
$ pip install virtualenv
$ python -m venv env

# Activate virtualenv
$ env/Scripts/activate

# Install dependencies
$ pip install -r requirements.txt

```

## Running Streamlit Application

```
$ streamlit run main.py

# Run Streamlit Application on Different port

$ streamlit run main.py --port 8501

```

## Docker Build Locally

```
docker build -t streamlitstarter:v1 .

docker images

docker run -p 8501:8501 streamlitstarter:v1

```
To view your app, users can browse to http://0.0.0.0:8501 or http://localhost:8501


## Reference 
- https://docs.streamlit.io/deploy/tutorials/docker





