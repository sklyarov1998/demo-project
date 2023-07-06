FROM python:3.9-alpine

RUN apk update && apk add sed

WORKDIR /app

COPY app.py Pipfile ./

# Install pipenv and project dependencies
RUN pip install pipenv && \
    pipenv install --deploy

# Run the application
ENTRYPOINT ["pipenv", "run", "python3", "app.py"]