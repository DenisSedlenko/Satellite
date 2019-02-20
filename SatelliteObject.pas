unit SatelliteObject;

type
  CoordinateRecord = record
  public
    x,y: Real;
end;

type
   Satellite = class
   
   public
      _x,_y,_r,_u,_v,_m: Real;
      points: array of CoordinateRecord;
      constructor create(x,y,u,v,m: Real);
end;

constructor Satellite.create(x,y,u,v,m: Real);
begin
  _r:= 4;
  _x:= x;
  _y:= y;
  _u:= u;
  _v:= v;
  _m:= m;
end;
end.


