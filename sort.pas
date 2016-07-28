unit Sort;
{==============================interface block==============================}
interface
uses
  SysUtils; {pyte}
type
  TSortCompareFunc=function(a,b:pointer):longint;
procedure bsort(base:pointer;numOfElement,sizeOfElement:longint;compare:TSortCompareFunc;isStatic:boolean);
function is_sorted(base:pointer;numOfElement,sizeOfElement:longint;compare:TSortCompareFunc;isStatic:boolean):boolean;
{==============================implementation block==============================}
implementation
procedure bsort(base:pointer;numOfElement,sizeOfElement:longint;compare:TSortCompareFunc;isStatic:boolean);
var
  i,j,k: longint;
  ptr: pbyte;
  tmp: byte;
begin
  if isStatic then
    ptr := pbyte(base)
  else
    ptr:=pbyte(base^);
  for i:=0 to numOfElement-1 do
    for j:=0 to numOfElement-2-i do
      if compare(ptr+j*sizeOfElement,ptr+(j+1)*sizeOfElement)>0 then
        for k:=0 to sizeOfElement-1 do
        begin
          tmp := ptr[j*sizeOfElement+k];
          ptr[j*sizeOfElement+k] := ptr[(j+1)*sizeOfElement+k];
          ptr[(j+1)*sizeOfElement+k] := tmp;
        end;
end;
{is sorted}
function is_sorted(base:pointer;numOfElement,sizeOfElement:longint;compare:TSortCompareFunc;isStatic:boolean):boolean;
var
  i:longint;
  ptr:pbyte;
begin
  if isStatic then
    ptr := pbyte(base)
  else
    ptr:=pbyte(base^);
  i:=1;
  while i<numOfElement do
  begin
    if compare(ptr+(i-1)*sizeOfElement,ptr+i*sizeOfElement)>0 then
      break;
    inc(i);
  end;
  is_sorted:=i=numOfElement;
end;
{==============================initialization block==============================}
initialization

{==============================finalization block==============================}
finalization

end.
