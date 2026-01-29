FROM python:3.10-slim

WORKDIR /app

# 安裝依賴
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製程式與資料
COPY src /app/src
COPY data /app/data

ENV PYTHONUNBUFFERED=1

CMD ["python", "src/server.py"]