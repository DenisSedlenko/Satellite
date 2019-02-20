unit DrawerObject;
uses GraphABC, SatelliteObject, EarthObject;

Type
    Drawer = class
    
    private
        _satellite: Satellite;
        _earth: Earth;
        
    public
        constructor create(sat: Satellite; e: Earth);
        procedure reDraw();
        procedure drawEarthCircle();
        procedure drawSatelliteCircle(x,y,r: Real; points: array of CoordinateRecord);        
    end;
    
  constructor Drawer.create(sat: Satellite; e: Earth);
  begin
      _earth:= e;
      _satellite:= sat; 
  end;
  
  procedure Drawer.drawEarthCircle();
  begin 
      SetBrushColor(clBlue);
      Circle(_earth.x, _earth.y, _earth.r);
  end;
  
  procedure Drawer.drawSatelliteCircle(x,y,r: Real; points: array of CoordinateRecord);
  var j: integer;
  begin
      for j:=0 to Length(points)-1 do
      begin
        SetBrushColor(clYellow);
        Circle(Round(points[j].x),Round(points[j].y), 1);
      end;
      SetBrushColor(clGreen);
      Circle(Round(x), Round(y), Round(r));
  end;   
      
  procedure Drawer.reDraw();
  begin
      clearwindow;
      drawSatelliteCircle(_satellite._x,_satellite._y,_satellite._r, _satellite.points); 
      drawEarthCircle();
  end;  
end.