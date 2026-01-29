FROM python:3.10-slim

WORKDIR /app

# 安裝依賴
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製程式與資料
COPY src /app/src
COPY data /app/data

ENV PYTHONUNBUFFERED=1

CMD ["sh", "-c", "MCP_TRANSPORT=sse MCP_HOST=0.0.0.0 MCP_PORT=${PORT:-8000} MCP_MODULES=icd MCP_OFFLINE=1 python src/server.py"]