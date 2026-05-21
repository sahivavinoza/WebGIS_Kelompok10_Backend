from sqlalchemy import Column, Integer, String
from geoalchemy2 import Geometry
from .database import Base

class Kecamatan(Base):
    __tablename__ = "kecamatan"
    id_kecamatan = Column(Integer, primary_key=True, index=True)
    nama_kecamatan = Column(String(100))
    geom_polygon = Column(Geometry(geometry_type='POLYGON', srid=4326))

class RuteAKDP(Base):
    __tablename__ = "rute_akdp"
    id_rute = Column(Integer, primary_key=True, index=True)
    nama_trayek = Column(String(100))
    geometry = Column(Geometry(geometry_type='LINESTRING', srid=4326))

class TitikTransportasi(Base):
    __tablename__ = "titik_transportasi"
    id_titik = Column(Integer, primary_key=True, index=True)
    nama_titik = Column(String(100))
    geom_point = Column(Geometry(geometry_type='POINT', srid=4326))