from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from .database import SessionLocal
from . import models
from geoalchemy2.shape import to_shape

# BARIS INI WAJIB ADA DI ATAS SEBELUM MENGGUNAKAN @app.get
app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/transportasi/")
def read_transportasi(db: Session = Depends(get_db)):
    data = db.query(models.TitikTransportasi).all()
    result = []
    for item in data:
        if item.geom_point:
            point = to_shape(item.geom_point)
            result.append({
                "id": item.id_titik,
                "nama": item.nama_titik,
                "koordinat": [point.x, point.y]
            })
    return result