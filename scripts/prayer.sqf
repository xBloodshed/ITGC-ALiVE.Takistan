//////////////////////
// TAREAS EN CICLO  //
//     M4RT14L      //
//////////////////////
_mosque = [minarete_1,minarete_2,minarete_3,minarete_4,minarete_5,minarete_6,minarete_7];
_times_to_play = [5, 12, 15, 18, 19];
_played_times = [0, 0, 0, 0, 0];
_i = 0;
while {true} do
{
   _i = 0;
   {
      if (abs (dayTime - _x) < 0.05) then
      {
         if ((_played_times select _i) == 0) then
         {
            _played_times set [_i, 1];
            {_x say3D "muezzin"} forEach _mosque;
         };
      };
      _i = _i + 1;
   } forEach _times_to_play;  

   if (dayTime > ((_times_to_play select 4) + 0.1)) then
   {
      _played_times = [0, 0, 0, 0, 0];
   };

   Sleep 10;
};