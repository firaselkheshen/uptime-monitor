from fastapi import FastAPI

app = FastAPI(title="Uptime Monitor")


@app.get("/healthz")
def healthz() -> dict[str, str]:
    """Liveness check: answers as long as the process is running."""
    return {"status": "ok"}
