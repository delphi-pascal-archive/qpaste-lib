unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, QPasteLib {QPasteLib support include}, Buttons;

type
  TForm1 = class(TForm)
    lib_context: TListBox;
    lib_list: TListBox;
    editor: TMemo;
    path: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lib_listClick(Sender: TObject);
    procedure lib_contextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  list_var : tstringlist;
  items_list : tstringlist;
  p : string;

implementation

{$R *.dfm}

function replaceATs(text,replace:string):string; // Функция для замены @@@
var fin:string;
begin
fin:=stringreplace(text,'@@@',replace,[rfReplaceAll, rfIgnoreCase]);
result:=fin;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if DirectoryExists(p+path.Text) then begin
QPasteLib.GetQPLLibs(p+path.Text,list_var); // Ищем в папке LIBS библиотеки
lib_list.Items.Text:=list_var.Text;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
list_var:=TStringList.Create;
items_list:=TStringList.Create;
p:=ExtractFilePath(application.ExeName);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
list_var.Free;
items_list.Free;
end;

procedure TForm1.lib_listClick(Sender: TObject);
begin
if lib_list.ItemIndex<>-1 then
begin
QPasteLib.GetItemsList(qpastelib.QPLFilePath.Strings[lib_list.itemindex],items_list); // Забиваем содержимое выбранной библиотеки
lib_context.Items.Text:=items_list.Text;
end;
end;

procedure TForm1.lib_contextClick(Sender: TObject);
begin
if lib_context.ItemIndex<>-1 then
begin
editor.SelText:=replaceATs(qpastelib.PasteItem(lib_context.ItemIndex,qpastelib.QPLFilePath.Strings[lib_list.itemindex]),Editor.SelText); // Добавляем содержимое пункта
editor.SetFocus;
end;
end;

end.
