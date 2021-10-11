{
QPasteLib 3.0

Разработан специально для Cool Editor 2005!
Made by Black [all_here@mail.ru] 
}

unit QPasteLib;

interface

uses Classes, Windows, SysUtils;

// ===

procedure GetQPLLibs(path:string;lst:TStringList);
procedure GetItemsList(fn:string;lst:TStringList);
function GetTitle(fn:string):string;
function GetAuthor(fn:string):string;
function GetDiscription(fn:string):string;
function PasteItem(i_index:integer;fn:string):string;

// ===

var
QPLFilePath:TStringList;
QPLItems:TStringList;

implementation

// ===

function GetTitle(fn:string):string;
var s : TStringList;
    i_start : integer;
    t : string;
    i : integer;
begin
s:=TStringList.Create;
s.LoadFromFile(fn);
for i:=0 to s.Count-1 do begin
t:=s.Strings[i];
i_start:=pos('#QPLNAME: ',UpperCase(t));
if i_start>0 then
begin
delete(t,i_start,Length('#QPLNAME: '));
result:=t;
exit;
end;
end;
s.Free;
end;

function GetAuthor(fn:string):string;
var s : TStringList;
    i_start : integer;
    t : string;
    i : integer;
begin
s:=TStringList.Create;
s.LoadFromFile(fn);
for i:=0 to s.Count-1 do begin
t:=s.Strings[i];
i_start:=pos('#QPLAUTHOR: ',UpperCase(t));
if i_start>0 then
begin
delete(t,i_start,Length('#QPLAUTHOR: '));
result:=t;
exit;
end;
end;
s.Free;
end;

function GetDiscription(fn:string):string;
var s : TStringList;
    i_start : integer;
    t : string;
    i : integer;
begin
s:=TStringList.Create;
s.LoadFromFile(fn);
for i:=0 to s.Count-1 do begin
t:=s.Strings[i];
i_start:=pos('#QPLDISCRIPTION: ',UpperCase(t));
if i_start>0 then
begin
delete(t,i_start,Length('#QPLDISCRIPTION: '));
result:=t;
exit;
end;
end;
s.Free;
end;

procedure GetQPLLibs(path:string;lst:TStringList);
var SearchRec : TSearchRec;
    i : integer;
begin
QPLFilePath.Clear;
if FindFirst(path+'*.qpl',faAnyFile,SearchRec) = 0 then begin
if FileExists(path+SearchRec.Name) then
QPLFilePath.Add(path+SearchRec.Name);
while FindNext(SearchRec) = 0 do begin
if FileExists(path+SearchRec.Name) then
QPLFilePath.Add(path+SearchRec.Name);
end
end;
FindClose(SearchRec);            
for i:=0 to QPLFilePath.Count-1 do
lst.Add(GetTitle(QPLFilePath.Strings[i]));
end;

procedure GetItemsList(fn:string;lst:TStringList);
var s : TStringList;
    i , i_start : integer;
    t : string;
begin
QPLItems.Clear;
s:=TStringList.Create;
s.LoadFromFile(fn);
for i:=0 to s.Count-1 do begin
t:=s.Strings[i];
i_start:=pos('#ITEM: ',UpperCase(t));
if i_start>0 then
begin
delete(t,i_start,Length('#ITEM: '));
QPLItems.Add(t);
end;
end;
lst.Assign(QPLItems);
s.Free;
end;

function PasteItem(i_index:integer;fn:string):string;
var s , topaste : TStringList;
    i_start , i_end, i : integer;
    it_text : string;
begin
s:=TStringList.Create;
topaste:=TStringList.Create;
s.LoadFromFile(fn);
it_text:=QPLItems.Strings[i_index];
i_start:=s.IndexOf('#ITEM: '+it_text);
if i_index=QPLItems.Count-1 then
i_end:=s.Count-1
else
if i_index<QPLItems.Count-1 then
i_end:=s.IndexOf('#ITEM: '+QPLItems.Strings[i_index+1])-1;
topaste.Clear;
for i:=i_start+1 to i_end do
topaste.Add(s.Strings[i]);
result:=copy(topaste.Text,0,Length(topaste.Text)-2);
topaste.Free;
s.Free;
end;

// ===

initialization
QPLFilePath:=TStringList.Create;
QPLItems:=TStringList.Create;

finalization
QPLFilePath.Free;
QPLItems.Free;


end.
