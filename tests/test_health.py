from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_healthz_returns_ok() -> None:
    response = client.get("/healthz")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_nothing_returns_404() -> None:
    response = client.get("/nothing")

    assert response.status_code == 404
    assert response.json() == {"detail": "Not Found"}
