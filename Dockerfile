FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /bot

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc  
RUN apt-get install -y ffmpeg
RUN apt-get install -y python3-pip

COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r ./requirements.txt

COPY . .

CMD ["python", "-m", "tg_bot"]