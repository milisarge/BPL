program main;
uses
  SysUtils, {plongint}
  Sort;

type
  intarr=array of longint;

const
  MAXN=10;

var
  a:intarr;
  i:longint;

Function cmp(a,b:pointer): longint;
Begin
    cmp := plongint(a)^-plongint(b)^;
End;


begin
  randomize;
  SetLength(a,MAXN);
  for i:=low(a) to high(a) do
    a[i]:=random(MAXN*10);

  bsort(@a,length(a),sizeof(longint),@cmp,false);

  for i:=low(a) to high(a) do
    writeln(a[i]);

  if is_sorted(@a,length(a),sizeof(longint),@cmp,false) then
    writeln('sorted!!')
  else
    writeln('unsorted!!');
  a:=nil;
end.
