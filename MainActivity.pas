uses EarthObject, DrawerObject, SatelliteObject, TrajectoryCalculating, GraphABC, Events;
var msat, mearth, vx, vy, ts: Real;
    collision: boolean;
    e: Earth;  
    d: Drawer;
    s: Satellite;
    t: Trajectory;
  procedure MouseDown(x,y,mb: Integer);
  var i: Integer;
    begin
    s:= Satellite.create(x, y, vx, vy, msat);
    d:= Drawer.create(s, e);
    while(true) do             
    begin 
      d.redraw();
      for i:=0 to 30 do
      begin
        collision:= t.recalc(false, s, e);
      end;
      collision:= t.recalc(true, s, e);
      
      if collision=true then break;
      
      sleep(25);                    
      Redraw;
    end;
  end;
begin                    
  SetWindowSize(600,700);
  writeln('Write weight of satellite from 1 to 30');
  readln(msat);
  writeln('Write weight of Earth from 1 to 100');
  readln(mearth);
  writeln('Write time step from 0.01 to 0.1');
  readln(ts);
  t:= new Trajectory;
  t.setTimestep(ts);
  writeln('Write x velocity from -3 to 3');
  readln(vx);
  writeln('Write y velocity from -3 to 3');
  readln(vy);
  lockdrawing; 
  e:= Earth.create(310, 290, 10, 100, mearth);
  d:= Drawer.create(s, e);
  d.drawEarthCircle();
  Redraw;
  OnMouseDown:= MouseDown;               
end.