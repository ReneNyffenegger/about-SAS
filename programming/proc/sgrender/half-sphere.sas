data xyz;
  do tq84_x=-1 to 1 by 0.1;
  do tq84_y=-1 to 1 by 0.1;
     if sqrt(tq84_x**2 + tq84_y**2) > 1
        then tq84_z=0;
        else tq84_z=sqrt(1 - tq84_x**2 - tq84_y**2);
  output;
  end; end;
run;

proc template;
  define statgraph tq84_surface;
  begingraph;
    layout overlay3d;
      surfaceplotparm
        x=tq84_x
        y=tq84_y
        z=tq84_z;
    endlayout;
  endgraph;
  end;
run;

proc sgrender
     data     = xyz
     template = tq84_surface;
run;
