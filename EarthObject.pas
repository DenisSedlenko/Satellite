unit EarthObject;
  type
     Earth = class
     public
        x,y,r,r2: Integer;
        m: Real;
        constructor create(_x,_y,_r,_r2: Integer; _m: Real);
  end;
  
  constructor Earth.create(_x,_y,_r,_r2: Integer; _m: Real);
  begin
    x:= _x;
    y:= _y;
    r:= _r;
    r2:= _r2;
    m:= _m*10e10;
  end;
end.