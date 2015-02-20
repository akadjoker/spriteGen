unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, OpenGL,jpeg,
  StdCtrls, ExtCtrls, Dialogs, ExtDlgs, XPMan, ComCtrls,GraphicEx ,
core3d;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TrackBar4: TTrackBar;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button4: TButton;
    edit1: TEdit;
    Edit2: TEdit;
    Label13: TLabel;
    Button5: TButton;
    CheckBox1: TCheckBox;
    XPManifest1: TXPManifest;
    Label14: TLabel;
    Edit3: TEdit;
    Button6: TButton;
    Label15: TLabel;
    Button7: TButton;
    TrackBar8: TTrackBar;
    Label18: TLabel;
    TrackBar3: TTrackBar;
    TrackBar9: TTrackBar;
    TrackBar10: TTrackBar;
    Label5: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button8: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    RadioGroup1: TRadioGroup;
    Label21: TLabel;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    ScrollBar1: TScrollBar;
    Label4: TLabel;
    Label16: TLabel;
    ScrollBar2: TScrollBar;
    Label17: TLabel;
    Button2: TButton;
    OpenDialog2: TOpenDialog;
    Button9: TButton;
    ComboBox: TComboBox;
    Panel1: TPanel;
    Button12: TButton;
    Button13: TButton;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button3: TButton;
    ProgressBar2: TProgressBar;
    Label28: TLabel;
    Label29: TLabel;
    CheckBox2: TCheckBox;
    Label12: TLabel;
    TrackBar13: TTrackBar;
    TrackBar14: TTrackBar;
    TrackBar15: TTrackBar;
    Label22: TLabel;
    Label23: TLabel;
    Label30: TLabel;
    chk1: TCheckBox;
    scrlbr1: TScrollBar;
    lbl1: TLabel;
    Label24: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar11: TTrackBar;
    TrackBar12: TTrackBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar9Change(Sender: TObject);
    procedure TrackBar10Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Button10Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBoxChange(Sender: TObject);

    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure TrackBar13Change(Sender: TObject);
    procedure TrackBar14Change(Sender: TObject);
    procedure TrackBar15Change(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
  private
    { Private declarations }
  public
       procedure IdleEvent(Sender: TObject; var Done: Boolean);

    { Public declarations }
  end;

  PGLRGBQUAD = ^TGLRGBQUAD;
  tagGLRGBQUAD = packed record
    red : Byte;
    green : Byte;
    blue : Byte;
    alpha : Byte;
  end;
    TGLRGBQUAD = tagGLRGBQUAD;


var
  Form1: TForm1;
 rendercam, camera:ICAMERA;

  imagepower:integer;
  imagex:integer=800 div 2;
  imagey:integer=500 div 2;

  disablerect:boolean=false;

  vmbleft:boolean;
  vmbright:boolean;

  tex:Itexture;

  scale:single=1;



  drtex:ITEXTURE;
  gunmodel,model:INOde;
  dt:single;
    FRC            : HGLRC;           // Rendering Context
    FDC            : HDC;             // Device Context

    minframe:single=1000;
    maxFrame:single=-1000;
    frame:single;

    maxtextures:integer;
    maxjoints:integer;

    loadmd2gun:boolean=false;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure ScreenShot(px,py,w,h:integer;FileName: TFileName);
var
  rgbBits : PGLRGBQUAD;
  x, y : Integer;
  pixel : PGLRGBQUAD;
  tmp : Byte;

  I : Integer;            // Loop counter
  top : PGLRGBQUAD;          // Pointer to top line in the image
  bottom : PGLRGBQUAD;       // Pointer to bottom line in the image
  tmpBits : PGLRGBQUAD; // Temporarily holds one line in image
  line : Integer;


begin
  GetMem(rgbBits, w*h*4);
  glFinish();
  glPixelStorei( $8758, 1);
  glPixelStorei(GL_PACK_ALIGNMENT, 4);
  glPixelStorei(GL_PACK_ROW_LENGTH, 0);
  glPixelStorei(GL_PACK_SKIP_ROWS, 0);
  glPixelStorei(GL_PACK_SKIP_PIXELS, 0);
//  glReadPixels(px,py,w,h, GL_RGBA, GL_UNSIGNED_BYTE, rgbBits);
 glReadPixels(px,py,w,h, $80E1, GL_UNSIGNED_BYTE, rgbBits);



    line := w * 4;
    GetMem(tmpBits, line);

    top := rgbBits;
    bottom := Ptr(Integer(rgbBits) + line*(h-1));

    for I := 0 to (h shr 1)-1 do
    begin
      Move(top^, tmpBits^, line);
      Move(bottom^, top^, line);
      Move(tmpBits^, bottom^, line);
      top := Ptr(Integer(top) + line);
      bottom := Ptr(Integer(bottom) - line);
    end;
    FreeMem(tmpBits);

               {
   pixel := rgbBits;
  for x := 0 to w - 1 do begin
    for y := 0 to h - 1 do begin
      tmp := pixel.blue;
      pixel.blue := pixel.red;
      pixel.red := tmp;

      Inc(pixel);
    end;
  end;  }

     SaveBufferToFile(rgbBits,w,h,pchar(filename));

     FreeMem(rgbBits);
     rgbBits := nil;


end;

procedure ScreenMultiShot(x,y,w,h:integer);
var FileName: String;
var i: Integer;
begin
  i:=0;
  repeat
    inc(i);
    FileName:=ExtractFilePath(ParamStr(0))+'save\'+FormatFloat('Screen0000', i)+'.png';
  until not FileExists(FileName);
  ScreenShot(x,y,w,h,FileName);
  disablerect:=false;
end;



procedure setFrame(node:INOde; fbegin,fend:integer;speed:single);
begin

   if ((CurrentFrame(node)>fend) or (CurrentFrame(node)<fbegin)) then
   begin
   AnimateFrame(node,fbegin);
   AnimateFrameLoop(node,fbegin,fend);
   AnimateLoop(node,true);
   AnimateSpeed(node,speed);
   end;

end;

procedure TForm1.IdleEvent(Sender: TObject; var Done: Boolean);
begin


done:=false;
end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  application.OnIdle:=nil;
 // EndEngine;
timer1.Enabled:=false;
//FreeEngine;
end;



procedure TForm1.FormCreate(Sender: TObject);
var pfd : TPIXELFORMATDESCRIPTOR;
    pf  : Integer;
begin




InitEngineEx(DOPENGL,panel1.Handle,panel1.Width,panel1.Height,32,false,false);
BackGroundColor(TrackBar3.Position,TrackBar9.Position,TrackBar10.Position);
AmbientLight(128,128,128);




//rendercam:=CreateCamera();
rendercam:=CreateCameraIsometric(800,600,-100000,100000);
//CameraTarget(rendercam,0,0,0);
//PositionNode(rendercam,0,0,-10);

//camera := CreateCamera();
camera:=CreateCameraIsometric(800,600,-10000,10000);
//CameraTarget(camera,0,0,0);
//PositionNode(camera,0,0,-100);

model:=loadmesh('media\models\marine.MD2');
NodeTexture(model,LoadTexture('media\textures\marine.MD2USMC_resultado.jpg'),0);
NodeLight(model,FALSE);
NodeCulling(model,EAC_OFF);

gunmodel:=loadmesh('media\models\MARINE weapon.MD2');
NodeTexture(gunmodel,LoadTexture('media\textures\MARINE weapon.MD2.jpg'),0);
NodeLight(gunmodel,FALSE);
NodeCulling(gunmodel,EAC_OFF);


NodeParent(gunmodel,model);



tex:=CreateRTT(128,128);


maxtextures:=MaterialCount(model);
label3.Caption:='Total Of Materials:'+inttostr(maxtextures);


ScrollBar1.Max:=maxtextures-1;

label4.Caption:='Texture Layer:'+inttostr(ScrollBar1.Position);
      {
 FDC := GetDC(Handle);

  FDC:=GetDC(form1.Handle);
  pfd.nSize:=SizeOf(pfd);
  pfd.nVersion:=1;
  pfd.dwFlags:=PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER or 0;
  pfd.iPixelType:=PFD_TYPE_RGBA;      // PFD_TYPE_RGBA or PFD_TYPEINDEX
  pfd.cColorBits:=32;

  pf :=ChoosePixelFormat(FDC, @pfd);   // Returns format that most closely matches above pixel format
  SetPixelFormat(FDC, pf, @pfd);

  FRC :=wglCreateContext(FDC);    // Rendering Context = window-glCreateContext
  wglMakeCurrent(FDC,FRC);        // Make the DC (Form1) the rendering Context

  }




timer1.Enabled:=true;
//application.OnIdle:=IdleEvent;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

minframe:=1000;
maxframe:=-1000;

SetMd2Animation(model,pchar(edit1.text));
AnimateSpeed(model,TrackBar8.Position/1);
AnimateLoop(model,true);

if assigned(gunmodel) then
begin
SetMd2Animation(gunmodel,pchar(edit1.text));
AnimateSpeed(gunmodel,TrackBar8.Position/1);
AnimateLoop(gunmodel,true);
end;



end;

procedure TForm1.Button5Click(Sender: TObject);
begin
TrackBar4.Max:=strtoint(edit2.Text);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
TrackBar4.Min:=strtoint(edit3.Text);
end;

procedure TForm1.TrackBar8Change(Sender: TObject);
begin
 label15.Caption:='Frame Speed:'+floattostr(TrackBar8.Position/1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
AnimateSpeed(model,TrackBar8.Position/1);

if assigned(gunmodel) then
begin
AnimateSpeed(gunmodel,TrackBar8.Position/1);
end;


end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
RotateNodeDeg(model,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
if assigned(gunmodel) then
begin
//RotateNodeDeg(gunmodel,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
end;

end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
RotateNodeDeg(model,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
if assigned(gunmodel) then
begin
//RotateNodeDeg(gunmodel,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
end;

end;

procedure TForm1.TrackBar7Change(Sender: TObject);
begin
RotateNodeDeg(model,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
if assigned(gunmodel) then
begin
//RotateNodeDeg(gunmodel,trackbar5.Position*deg,trackbar6.Position*deg,trackbar7.Position*deg);
end;

end;

procedure TForm1.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
  value:single;
begin
value:=ScrollPos/100;
ScaleNode(model,value,value,value);
label18.Caption:=floattostr(value);
if assigned(gunmodel) then
begin
//  ScaleNode(gunmodel,value,value,value);
end;


end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
BackGroundColor(TrackBar3.Position,TrackBar9.Position,TrackBar10.Position);
end;

procedure TForm1.TrackBar9Change(Sender: TObject);
begin
BackGroundColor(TrackBar3.Position,TrackBar9.Position,TrackBar10.Position);
end;

procedure TForm1.TrackBar10Change(Sender: TObject);
begin
BackGroundColor(TrackBar3.Position,TrackBar9.Position,TrackBar10.Position);
end;

procedure SaveSpriteShet(index:integer;prefixx,ftype:string);
var FileName: String;
begin
    FileName:=ExtractFilePath(ParamStr(0))+'save\'+FormatFloat(prefixx+'0000', index)+'.'+ftype;
     SaveTextureToFile(tex,pchar(FileName));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
left,top,loop,new_width,arrow,totalframes,imagewidth,  framebegin,frameend:integer;

imgblit,imagesave:IImage;
frame_tile:integer;
savepowerof2:boolean;

FileName,savetype:string;
begin

case RadioGroup3.ItemIndex of
0:savetype:='png';
1:savetype:='tga';
2:savetype:='bmp';
end;


 // timer1.Enabled:=false;



framebegin:=strtoint(edit7.Text);
frameend:=strtoint(edit8.Text);

ProgressBar2.Max:=frameend;
ProgressBar2.Min:=framebegin;

totalframes:=(frameend-framebegin);
arrow:=round(sqrt(totalframes));

imagewidth:=(imagepower*arrow);
if (RadioGroup2.ItemIndex=0) then    savepowerof2:=true else savepowerof2:=false;


  if (savepowerof2) then
  begin
  new_width := 1;
		while( new_width < imagewidth )  do
    begin
      new_width:=new_width*2;
    end;
    imagesave:=CreateImage(new_width,new_width);
 end else
begin
imagesave:=CreateImage(imagewidth,imagewidth);
end;



AnimateFrame(model,framebegin);
if assigned(gunmodel) then
begin
AnimateFrame(gunmodel,framebegin);
end;

EngineRun(dt);



 frame_tile:=0;
for loop:=framebegin to frameend-1 do
begin
  application.ProcessMessages;

BeginScene;
ActiveCamera(rendercam);
DrawSceneToTexture(tex,TrackBar1.Position,TrackBar2.Position,TrackBar11.Position,TrackBar12.Position);
UpdateEngine;
EndScene;
AnimateFrame(model,loop);
if assigned(gunmodel) then
begin
AnimateFrame(gunmodel,loop);
end;





imgblit:=CreateImageFromTexture(tex,0,0);
  Left := ( frame_tile mod arrow) ;
  Top :=  ( frame_tile div arrow) ;


  if (savepowerof2) then
  BltImage(imgblit,imagesave,left*imagepower,top*imagepower) else
  BltImage(imgblit,imagesave,left*imagepower,top*imagepower);

   if CheckBox2.Checked then SaveSpriteShet(loop,edit9.Text,savetype);



ProgressBar2.Position:=loop;
inc( frame_tile);
EngineRun(dt);

end;

ProgressBar2.Position:=0;




 FileName:=ExtractFilePath(ParamStr(0))+'save\'+FormatFloat(edit9.Text+'_'+'0000', frame_tile)+'.'+savetype;

//FileName:=ExtractFilePath(ParamStr(0)+'save\'+edit9.Text+'.'+savetype);


 // if (savepowerof2) then
//  SaveImage(imagesave,pchar('save\'+edit9.Text+'.'+savetype)) else
  SaveImage(imagesave,pchar(filename));


 // imagesave:=nil;
 // imgblit:=nil;






//SaveImage(imagesave,'save\spriteshetp2.png');


 // timer1.Enabled:=true;

end;


procedure TForm1.Button8Click(Sender: TObject);
var
  texture:string;
begin
OpenPictureDialog1.InitialDir:= ExtractFilePath(ParamStr(0))+'media\textures';
OpenPictureDialog1.Title:=ExtractFilePath(ParamStr(0))+'media\textures';

if OpenPictureDialog1.Execute then
begin
texture:=OpenPictureDialog1.FileName;

if fileexists(texture) then
begin
NodeTexture(model,LoadTexture(pchar(texture)),ScrollBar1.Position);
end;

//setcurrentdir(extractfilepath(
end;

end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
 var
    value:single;
begin



//scale:=scale+(WheelDelta/1000);

//if scale>=100 then scale:=100;
//if scale <0.05 then scale:=0.05;

//value:=WheelDelta/100;

//caption:=floattostr(scale);

//  ScaleNode(model,scale,scale,scale);

     if assigned(gunmodel) then
begin
//ScaleNode(gunmodel,scale,scale,scale);
end;




end;



procedure TForm1.CheckBox4Click(Sender: TObject);
begin
BeginScene;

EndScene;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
//CameraAspectRatio(camera,TrackBar1.Position/100);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//minframe:=1000;
//maxframe:=-1000;

if assigned(gunmodel) then
begin
DeleteNode(gunmodel);
gunmodel:=nil;
end;



DeleteNode(model);
model:=nil;


openDialog1.InitialDir:= ExtractFilePath(ParamStr(0))+'media\models';
openDialog1.Title:=openDialog1.InitialDir;



if (openDialog1.Execute) then
begin

model := LoadMesh(pchar(opendialog1.FileName));
NodeLight(model,FALSE);
NodeCulling(model,EAC_OFF);

maxtextures:=MaterialCount(model);

ScrollBar1.Max:=maxtextures-1;

label3.Caption:='Total Of Materials:'+inttostr(maxtextures);

if (ExtractFileExt(opendialog1.FileName)='.md2') then exit;

maxjoints:=CountJoint(model);
label16.Caption:='Total Of Joints:'+inttostr(maxjoints);
ScrollBar2.Max:=maxjoints;


end;




end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
label4.Caption:='Texture Layer:'+inttostr(ScrollBar1.Position);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if assigned(gunmodel) then
begin
DeleteNode(gunmodel);
gunmodel:=nil;


end;

openDialog2.InitialDir:= ExtractFilePath(ParamStr(0))+'media\models';
openDialog2.Title:=openDialog2.InitialDir;


if (openDialog2.Execute) then
begin
gunmodel := LoadMesh(pchar(opendialog2.FileName));
NodeLight(gunmodel,FALSE);
NodeParent(gunmodel,model);
NodeLight(gunmodel,FALSE);

end;


end;

procedure TForm1.Button9Click(Sender: TObject);
var
  texture:string;
begin
if assigned(gunmodel) then
begin

OpenPictureDialog1.InitialDir:= ExtractFilePath(ParamStr(0))+'media\textures';
OpenPictureDialog1.Title:=ExtractFilePath(ParamStr(0))+'media\textures';


if OpenPictureDialog1.Execute then
begin
texture:=OpenPictureDialog1.FileName;

if fileexists(texture) then
begin
NodeTexture(gunmodel,LoadTexture(pchar(texture)),0);
end;

end;
end;

end;



procedure SaveSprite(prefixx:string);
var FileName: String;
var i: Integer;
begin
  i:=0;
  repeat
    inc(i);
    FileName:=ExtractFilePath(ParamStr(0))+'save\'+FormatFloat('Screen0000', i)+'.png';
  until not FileExists(FileName);
  SaveTextureToFile(tex,pchar(FileName));
end;



procedure TForm1.Button10Click(Sender: TObject);
var
left,top,loop,new_width,arrow,totalframes,imagewidth,  framebegin,frameend:integer;

imgblit,imagesave:IImage;
frame_tile:integer;
savepowerof2:boolean;

savetype:string;
begin
       {
case RadioGroup3.ItemIndex of
0:savetype:='png';
1:savetype:='tga';
2:savetype:='bmp';
end;


  timer1.Enabled:=false;



framebegin:=strtoint(edit4.Text);
frameend:=strtoint(edit5.Text);

ProgressBar1.Max:=frameend;
ProgressBar1.Min:=framebegin;

totalframes:=(frameend-framebegin);
arrow:=round(sqrt(totalframes));

imagewidth:=(imagepower*arrow);
if (RadioGroup2.ItemIndex=0) then
savepowerof2:=true else
savepowerof2:=false;

  if (savepowerof2) then
  begin
  new_width := 1;
		while( new_width < imagewidth )  do
    begin
      new_width:=new_width*2;
    end;
    imagesave:=CreateImage(new_width,new_width);
 end else
begin
imagesave:=CreateImage(imagewidth,imagewidth);
end;



AnimateFrame(model,framebegin);
if assigned(gunmodel) then
begin
AnimateFrame(gunmodel,framebegin);
end;

EngineRun(dt);



 frame_tile:=0;
for loop:=framebegin to frameend-1 do
begin
BeginScene;
ActiveCamera(rendercam);
DrawSceneToTexture(tex,TrackBar1.Position,TrackBar2.Position,TrackBar11.Position,TrackBar12.Position);
UpdateEngine;
EndScene;
AnimateFrame(model,loop);
if assigned(gunmodel) then
begin
AnimateFrame(gunmodel,loop);
end;



if CheckBox2.Checked then SaveSpriteShet(loop,edit6.Text,savetype);

imgblit:=CreateImageFromTexture(tex,0,0);
  Left := ( frame_tile mod arrow) ;
  Top :=  ( frame_tile div arrow) ;


  if (savepowerof2) then
  BltImage(imgblit,imagesave,left*imagepower,top*imagepower) else
  BltImage(imgblit,imagesave,left*imagepower,top*imagepower);


EngineRun(dt);
application.ProcessMessages;
ProgressBar1.Position:=loop;
inc( frame_tile);

end;

ProgressBar1.Position:=0;

  if (savepowerof2) then
  SaveImage(imagesave,pchar('save\'+edit6.Text+'.'+savetype)) else
  SaveImage(imagesave,pchar('save\'+edit6.Text+'.'+savetype));


  imagesave:=nil;






//SaveImage(imagesave,'save\spriteshetp2.png');


  timer1.Enabled:=true;
    }
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin

case RadioGroup1.ItemIndex of
0:imagepower:=32;
1:imagepower:=64;
2:imagepower:=128;
3:imagepower:=256;
4:imagepower:=512;
end;












EngineRun(dt);



BeginScene;


ActiveCamera(rendercam);
SetCameraViewPort(0,0,imagepower,imagepower);
DrawSceneToTexture(tex,TrackBar1.Position,TrackBar2.Position,TrackBar11.Position,TrackBar12.Position);

ActiveCamera(camera);
SetCameraViewPort(0,0,panel1.Width,panel1.Height);
if CheckBox3.Checked then   DrawNodeTrasformBox(model,$FFFFFFFF);


 	UpdateEngine;


   Image(tex,0,0);
   Colors(255,255,0);
   Line2D(0,0,imagepower,0);
   Line2D(0,imagepower,imagepower,imagepower);
   Line2D(imagepower,0,imagepower,imagepower);
   Line2D(imagepower,0,imagepower,0);



EndScene;




if CheckBox1.Checked then
begin
TrackBar4.Enabled:=true;
AnimateFrame(model,TrackBar4.Position);
if assigned(gunmodel) then
begin
AnimateFrame(gunmodel,TrackBar4.Position);
end;

end else
begin
  TrackBar4.Enabled:=false;
end;

label7.Caption:='X:'+inttostr(TrackBar5.Position);
label8.Caption:='Y:'+inttostr(TrackBar6.Position);
label9.Caption:='Z:'+inttostr(TrackBar7.Position);

frame:=CurrentFrame(model);
label10.Caption:='Frame:'+ftos(frame);
label11.Caption:='Speed:'+ftos(CurrentFrameSpeed(model));
label25.Caption:='Frame:'+ftos(frame);
label26.Caption:='Speed:'+ftos(CurrentFrameSpeed(model));


minframe:=min(frame,minframe);
maxframe:=max(frame,maxframe);


label1.Caption:='Min Frame:'+ftos(minframe);
label2.Caption:='Max Frame:'+ftos(maxframe);

label28.Caption:='Min Frame:'+ftos(minframe);
label29.Caption:='Max Frame:'+ftos(maxframe);



label5.Caption:='B:'+inttostr(TrackBar3.Position);
label19.Caption:='G:'+inttostr(TrackBar9.Position);
label20.Caption:='R:'+inttostr(TrackBar10.Position);

label22.Caption:='X:'+inttostr(Round(TrackBar13.Position/scale));
label30.Caption:='Y:'+inttostr(Round(TrackBar14.Position/scale));
label23.Caption:='Z:'+inttostr(Round(TrackBar15.Position/scale));




caption:='Sprite Creator By Luis Santos AKA Djoker - FPS['+floattostr(GetFps)+']';


end;

procedure TForm1.ComboBoxChange(Sender: TObject);
begin
minframe:=1000;
maxframe:=-1000;

SetMd2AnimationIndex(model,ComboBox.ItemIndex);
AnimateSpeed(model,TrackBar8.Position/1);
AnimateLoop(model,true);


if assigned(gunmodel) then
begin
SetMd2AnimationIndex(gunmodel,ComboBox.ItemIndex);
AnimateSpeed(gunmodel,TrackBar8.Position/1);
AnimateLoop(gunmodel,true);
end;


end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

if (button=mbLeft) then
begin
  vmbleft:=true;
  vmbright:=false;



end else
if (button=mbRight) then
begin
  vmbleft:=false;
  vmbright:=true;


end;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var posy, posx:single;
begin
  if (vmbleft) then
  begin

     posx:=500-x;
     posy:=300-y;


     PositionNode(model,-posx/1,posy/1,0);

  

   end;
end;

procedure TForm1.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 vmbleft:=false;
  vmbright:=false;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin

  PositionNode(model,0,0,0);
  RotateNodeDeg(model,0,0,0);
  ScaleNode(model,1,1,1);

TrackBar13.Position:=0;
TrackBar14.Position:=0;
TrackBar15.Position:=0;
TrackBar5.Position:=0;
TrackBar6.Position:=0;
TrackBar7.Position:=0;

end;

procedure TForm1.Button13Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0:imagepower:=32;
1:imagepower:=64;
2:imagepower:=128;
3:imagepower:=256;
4:imagepower:=512;
end;

RemoveTexture(tex);
tex:=nil;
tex:=CreateRTT(imagepower,imagepower);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
panel1.SetFocus;
end;

procedure TForm1.TrackBar13Change(Sender: TObject);
begin

if (chk1.Checked) then
begin
 trackbar14.Position:=trackbar13.Position;
 trackbar15.Position:=trackbar13.Position;

end;

ScaleNode(model,trackbar13.Position/scale,trackbar14.Position/scale,trackbar15.Position/scale);

end;

procedure TForm1.TrackBar14Change(Sender: TObject);
begin
if (chk1.Checked) then
begin
 trackbar13.Position:=trackbar14.Position;
 trackbar15.Position:=trackbar14.Position;

end;

ScaleNode(model,trackbar13.Position/scale,trackbar14.Position/scale,trackbar15.Position/scale);

end;

procedure TForm1.TrackBar15Change(Sender: TObject);
begin
if (chk1.Checked) then
begin
 trackbar13.Position:=trackbar15.Position;
 trackbar14.Position:=trackbar15.Position;


end;
ScaleNode(model,trackbar13.Position/scale,trackbar14.Position/scale,trackbar15.Position/scale);

end;

procedure TForm1.scrlbr1Change(Sender: TObject);
begin
scale:=scrlbr1.Position;
ScaleNode(model,trackbar13.Position/scale,trackbar14.Position/scale,trackbar15.Position/scale);
end;

end.
