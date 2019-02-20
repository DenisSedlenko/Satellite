unit TrajectoryCalculating;
uses SatelliteObject, EarthObject;

type
   Trajectory = class

   public
      _timestep: real;
      Const G = -6.67300e-11;
      function recalc(flag: boolean; sat: Satellite; e: Earth): boolean;
      procedure setTimestep(ts: Real);
end;

function atan2 (yval, xval : real) : real;
begin
if yval=0
then
begin
if xval >= 0
then atan2 := 0
else atan2 := degtorad (180)
END
else
if xval=0
then
begin
if yval >= 0
then atan2 := degtorad (90)
else atan2 := degtorad (-90)
end
else
if xval >= 0
then atan2 := arctan (yval / xval)
else
if yval >= 0
then atan2 := arctan (yval / xval) + degtorad (180)
else atan2 := arctan (yval / xval) - degtorad (180)
end;

procedure Trajectory.setTimestep(ts: Real);
begin
  _timestep:= ts;
end;
  
function Trajectory.recalc(flag: boolean; sat: Satellite; e: Earth): boolean;
var 
  i: integer;
  distance, theta, k: Real;
  collision: boolean;
begin
  collision:= false;
  distance:= (sat._x - e.x) * (sat._x - e.x) + (sat._y - e.y) * (sat._y - e.y);
  if distance<=e.r2 then collision:= true
  else
  begin
    theta:= atan2(sat._y-e.y, sat._x-e.x);
    k:= G * e.m * sat._m / distance;
    sat._u:= sat._u + ((k*Cos(theta)) / sat._m) * _timestep;
    sat._v:= sat._v + ((k*Sin(theta)) / sat._m) * _timestep;
  end;
    
  if flag=true then
  begin
    i:= Length(sat.points)+1;
    SetLength(sat.points,i);
    sat.points[i-1].x:= sat._x;
    sat.points[i-1].y:= sat._y;
  end;
  sat._x:= sat._x + sat._u * _timestep; 
  sat._y:= sat._y + sat._v * _timestep; 
  recalc:= collision;
end;
end.


