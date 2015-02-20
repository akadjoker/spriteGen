unit Core3D;

interface
uses windows;

                                                                                   
const
DOPENGL=0;
DDIRECT3D9=1;


 Rad:Single=0.017453292519;   // Pi/180
 Deg:Single=57.29577951308;   // 180/Pi


const
		MF_WIREFRAME = $1;
		MF_POINTCLOUD = $2;
		MF_GOURAUD_SHADING = $4;
  	MF_LIGHTING = $8;
		MF_ZBUFFER = $10;
		MF_ZWRITE_ENABLE = $20;
		MF_BACK_FACE_CULLING = $40;
		MF_FRONT_FACE_CULLING = $80;
		MF_BILINEAR_FILTER = $100;
		MF_TRILINEAR_FILTER = $200;
		MF_ANISOTROPIC_FILTER = $400;
		MF_FOG_ENABLE = $800;
		MF_NORMALIZE_NORMALS = $1000;
		MF_TEXTURE_WRAP = $2000;
		MF_ANTI_ALIASING = $4000;
		MF_COLOR_MASK = $8000;
		MF_COLOR_MATERIAL = $10000;
		MF_USE_MIP_MAPS = $20000;
		MF_BLEND_OPERATION = $40000;
		MF_POLYGON_OFFSET = $80000 ;



 BLEND_SCREEN       = 0;
 BLEND_ADD          = 1;
 BLEND_SUBTRACT     = 2;
 BLEND_MULTIPLY     = 3;
 BLEND_DIVIDE       = 4;


 TOP_EDGE	=0;
 BOTTOM_EDGE	=1;
 LEFT_EDGE	=2;
 RIGHT_EDGE	=3;

type
ITEXTURE=pointer;
IMOtion=pointer;
IFONT=pointer;

INODE=pointer;
ICAMERA=INODE;
IMesh=pointer;
IMaterial=pointer;
ITerrainLOD=INODE;
ILAndscape=INODE;
IAnimator=Pointer;
ISurface=pointer;
ILIGHT=INODE;
IImage=pointer;
ISPRITE=INODE;

ISteer=pointer;
IObstacle=Pointer;
ItseerPath=Pointer;

IPARTICLE=INODE;
ISHADER=pointer;
IEMITTER=pointer;

ITriangleSelector=pointer;
ITriangleList=ITriangleSelector;
IQuadLand=pointer;
Void=pointer;
IZone=pointer;
ILODNOD=pointer;
ISERVICE=pointer;
IDevice=pointer;



TShaderCallBack=procedure(service:IService;userdata:integer);stdcall;

 E_CULLING_TYPE=(
		EAC_OFF = 0,
		EAC_BOX = 1,
		EAC_FRUSTUM_BOX = 2,
		EAC_FRUSTUM_SPHERE = 4,
		EAC_OCC_QUERY = 8
	);


EMD2_ANIMATION_TYPE=(

		EMAT_STAND = 0,
		EMAT_RUN,
		EMAT_ATTACK,
		EMAT_PAIN_A,
		EMAT_PAIN_B,
		EMAT_PAIN_C,
		EMAT_JUMP,
		EMAT_FLIP,
		EMAT_SALUTE,
		EMAT_FALLBACK,
		EMAT_WAVE,
		EMAT_POINT,
		EMAT_CROUCH_STAND,
		EMAT_CROUCH_WALK,
		EMAT_CROUCH_ATTACK,
		EMAT_CROUCH_PAIN,
		EMAT_CROUCH_DEATH,
		EMAT_DEATH_FALLBACK,
		EMAT_DEATH_FALLFORWARD,
		EMAT_DEATH_FALLBACKSLOW,
		EMAT_BOOM,

		//! Not an animation, but amount of animation types.
		EMAT_COUNT
	);


  TMeshTYPE=(
ESNT_CUBE=0,
ESNT_SPHERE=1,
ESNT_TEXT=2,
ESNT_WATER_SURFACE=3,
ESNT_TERRAIN=4,
ESNT_SKY_BOX=5,
ESNT_SKY_DOME=6,
ESNT_OCTREE=7,
ESNT_MESH=8,
ESNT_LIGHT=9,
ESNT_EMPTY=10,
ESNT_DUMMY_TRANSFORMATION=11,
ESNT_CAMERA=12,
ESNT_BILLBOARD=13,
ESNT_ANIMATED_MESH=14,
ESNT_PARTICLE_SYSTEM=15,
ESNT_UNKNOWN=16);

TPRIMITIVETYPE=(
		TPOINTS=0,
		TLINE_STRIP,
		TLINE_LOOP,
		TLINES,
		TTRIANGLE_STRIP,
		TTRIANGLE_FAN,
		TTRIANGLES,
		TQUAD_STRIP,
		TQUADS,
		TPOLYGON,
		TPOINT_SPRITES);



TMATERIALTYPE=(
		EMT_SOLID = 0,
		EMT_SOLID_2_LAYER,
		EMT_LIGHTMAP,
		EMT_LIGHTMAP_ADD,
		EMT_LIGHTMAP_M2,
		EMT_LIGHTMAP_M4,
		EMT_LIGHTMAP_LIGHTING,
		EMT_LIGHTMAP_LIGHTING_M2,
		EMT_LIGHTMAP_LIGHTING_M4,
		EMT_DETAIL_MAP,
		EMT_SPHERE_MAP,
		EMT_REFLECTION_2_LAYER,
		EMT_TRANSPARENT_ADD_COLOR,
		EMT_TRANSPARENT_ALPHA_CHANNEL,
		EMT_TRANSPARENT_ALPHA_CHANNEL_REF,
		EMT_TRANSPARENT_VERTEX_ALPHA,
		EMT_TRANSPARENT_REFLECTION_2_LAYER,
		EMT_NORMAL_MAP_SOLID,
		EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR,
		EMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA,
		EMT_PARALLAX_MAP_SOLID,
		EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR,
		EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA,
		EMT_ONETEXTURE_BLEND,
 		EMT_FOUR_DETAIL_MAP,
		EMT_TRANSPARENT_ADD_ALPHA_CHANNEL_REF,
		EMT_TRANSPARENT_ADD_ALPHA_CHANNEL,
		EMT_FORCE_32BIT = $7fffffff
	);







TLIGHTTYPE=(
	LPOINT = 0,
	LSPOT,
	LDIRECTIONAL);

ITERRAINLODPATCHSIZE=(
    ETPS_9 = 9,
    ETPS_17 = 17,
    ETPS_33 = 33 ,
    ETPS_65 = 65,
    ETPS_129 = 129);


IVERTEX_SHADER_TYPE=(
	EVST_VS_1_1 = 0,
	EVST_VS_2_0,
	EVST_VS_2_a,
	EVST_VS_3_0,
	EVST_VS_4_0,
	EVST_VS_4_1,
	EVST_VS_5_0,
	EVST_COUNT);


IPIXEL_SHADER_TYPE=(
	EPST_PS_1_1 = 0,
	EPST_PS_1_2,
	EPST_PS_1_3,
	EPST_PS_1_4,
	EPST_PS_2_0,
	EPST_PS_2_a,
	EPST_PS_2_b,
	EPST_PS_3_0,
	EPST_PS_4_0,
	EPST_PS_4_1,
	EPST_PS_5_0,
	EPST_COUNT);


    
  IKEYCODE = (
    KEY_LBUTTON = $01,
    // Left mouse button
    KEY_RBUTTON = $02,
    // Right mouse button
    KEY_CANCEL = $03,
    // Control-break processing
    KEY_MBUTTON = $04,
    // Middle mouse button (three-button mouse)
    KEY_XBUTTON1 = $05,
    // Windows 2000/XP: X1 mouse button
    KEY_XBUTTON2 = $06,
    // Windows 2000/XP: X2 mouse button
    KEY_BACK = $08,
    // BACKSPACE key
    KEY_TAB = $09,
    // TAB key
    KEY_CLEAR = $0C,
    // CLEAR key
    KEY_RETURN = $0D,
    // ENTER key
    KEY_SHIFT = $10,
    // SHIFT key
    KEY_CONTROL = $11,
    // CTRL key
    KEY_MENU = $12,
    // ALT key
    KEY_PAUSE = $13,
    // PAUSE key
    KEY_CAPITAL = $14,
    // CAPS LOCK key
    KEY_KANA = $15,
    // IME Kana mode
    KEY_HANGUEL = $15,
    // IME Hanguel mode (maintained for compatibility use KEY_HANGUL)
    KEY_HANGUL = $15,
    // IME Hangul mode
    KEY_JUNJA = $17,
    // IME Junja mode
    KEY_FINAL = $18,
    // IME final mode
    KEY_HANJA = $19,
    // IME Hanja mode
    KEY_KANJI = $19,
    // IME Kanji mode
    KEY_ESCAPE = $1B,
    // ESC key
    KEY_CONVERT = $1C,
    // IME convert
    KEY_NONCONVERT = $1D,
    // IME nonconvert
    KEY_ACCEPT = $1E,
    // IME accept
    KEY_MODECHANGE = $1F,
    // IME mode change request
    KEY_SPACE = $20,
    // SPACEBAR
    KEY_PRIOR = $21,
    // PAGE UP key
    KEY_NEXT = $22,
    // PAGE DOWN key
    KEY_END = $23,
    // END key
    KEY_HOME = $24,
    // HOME key
    KEY_LEFT = $25,
    // LEFT ARROW key
    KEY_UP = $26,
    // UP ARROW key
    KEY_RIGHT = $27,
    // RIGHT ARROW key
    KEY_DOWN = $28,
    // DOWN ARROW key
    KEY_SELECT = $29,
    // SELECT key
    KEY_PRINT = $2A,
    // PRINT key
    KEY_EXECUT = $2B,
    // EXECUTE key
    KEY_SNAPSHOT = $2C,
    // PRINT SCREEN key
    KEY_INSERT = $2D,
    // INS key
    KEY_DELETE = $2E,
    // DEL key
    KEY_HELP = $2F,
    // HELP key
    KEY_0 = $30,
    // 0 key
    KEY_1 = $31,
    // 1 key
    KEY_2 = $32,
    // 2 key
    KEY_3 = $33,
    // 3 key
    KEY_4 = $34,
    // 4 key
    KEY_5 = $35,
    // 5 key
    KEY_6 = $36,
    // 6 key
    KEY_7 = $37,
    // 7 key
    KEY_8 = $38,
    // 8 key
    KEY_9 = $39,
    // 9 key
    KEY_A = $41,
    // A key
    KEY_B = $42,
    // B key
    KEY_C = $43,
    // C key
    KEY_D = $44,
    // D key
    KEY_E = $45,
    // E key
    KEY_F = $46,
    // F key
    KEY_G = $47,
    // G key
    KEY_H = $48,
    // H key
    KEY_I = $49,
    // I key
    KEY_J = $4A,
    // J key
    KEY_K = $4B,
    // K key
    KEY_L = $4C,
    // L key
    KEY_M = $4D,
    // M key
    KEY_N = $4E,
    // N key
    KEY_O = $4F,
    // O key
    KEY_P = $50,
    // P key
    KEY_Q = $51,
    // Q key
    KEY_R = $52,
    // R key
    KEY_S = $53,
    // S key
    KEY_T = $54,
    // T key
    KEY_U = $55,
    // U key
    KEY_V = $56,
    // V key
    KEY_W = $57,
    // W key
    KEY_X = $58,
    // X key
    KEY_Y = $59,
    // Y key
    KEY_Z = $5A,
    // Z key
    KEY_LWIN = $5B,
    // Left Windows key (Microsoft® Natural® keyboard)
    KEY_RWIN = $5C,
    // Right Windows key (Natural keyboard)
    KEY_APPS = $5D,
    // Applications key (Natural keyboard)
    KEY_SLEEP = $5F,
    // Computer Sleep key
    KEY_NUMPAD0 = $60,
    // Numeric keypad 0 key
    KEY_NUMPAD1 = $61,
    // Numeric keypad 1 key
    KEY_NUMPAD2 = $62,
    // Numeric keypad 2 key
    KEY_NUMPAD3 = $63,
    // Numeric keypad 3 key
    KEY_NUMPAD4 = $64,
    // Numeric keypad 4 key
    KEY_NUMPAD5 = $65,
    // Numeric keypad 5 key
    KEY_NUMPAD6 = $66,
    // Numeric keypad 6 key
    KEY_NUMPAD7 = $67,
    // Numeric keypad 7 key
    KEY_NUMPAD8 = $68,
    // Numeric keypad 8 key
    KEY_NUMPAD9 = $69,
    // Numeric keypad 9 key
    KEY_MULTIPLY = $6A,
    // Multiply key
    KEY_ADD = $6B,
    // Add key
    KEY_SEPARATOR = $6C,
    // Separator key
    KEY_SUBTRACT = $6D,
    // Subtract key
    KEY_DECIMAL = $6E,
    // Decimal key
    KEY_DIVIDE = $6F,
    // Divide key
    KEY_F1 = $70,
    // F1 key
    KEY_F2 = $71,
    // F2 key
    KEY_F3 = $72,
    // F3 key
    KEY_F4 = $73,
    // F4 key
    KEY_F5 = $74,
    // F5 key
    KEY_F6 = $75,
    // F6 key
    KEY_F7 = $76,
    // F7 key
    KEY_F8 = $77,
    // F8 key
    KEY_F9 = $78,
    // F9 key
    KEY_F10 = $79,
    // F10 key
    KEY_F11 = $7A,
    // F11 key
    KEY_F12 = $7B,
    // F12 key
    KEY_F13 = $7C,
    // F13 key
    KEY_F14 = $7D,
    // F14 key
    KEY_F15 = $7E,
    // F15 key
    KEY_F16 = $7F,
    // F16 key
    KEY_F17 = $80,
    // F17 key
    KEY_F18 = $81,
    // F18 key
    KEY_F19 = $82,
    // F19 key
    KEY_F20 = $83,
    // F20 key
    KEY_F21 = $84,
    // F21 key
    KEY_F22 = $85,
    // F22 key
    KEY_F23 = $86,
    // F23 key
    KEY_F24 = $87,
    // F24 key
    KEY_NUMLOCK = $90,
    // NUM LOCK key
    KEY_SCROLL = $91,
    // SCROLL LOCK key
    KEY_LSHIFT = $A0,
    // Left SHIFT key
    KEY_RSHIFT = $A1,
    // Right SHIFT key
    KEY_LCONTROL = $A2,
    // Left CONTROL key
    KEY_RCONTROL = $A3,
    // Right CONTROL key
    KEY_LMENU = $A4,
    // Left MENU key
    KEY_RMENU = $A5,
    // Right MENU key
    KEY_PLUS = $BB,
    // Plus Key (+)
    KEY_COMMA = $BC,
    // Comma Key (,)
    KEY_MINUS = $BD,
    // Minus Key (-)
    KEY_PERIOD = $BE,
    // Period Key (.)
    KEY_ATTN = $F6,
    // Attn key
    KEY_CRSEL = $F7,
    // CrSel key
    KEY_EXSEL = $F8,
    // ExSel key
    KEY_EREOF = $F9,
    // Erase EOF key
    KEY_PLAY = $FA,
    // Play key
    KEY_ZOOM = $FB,
    // Zoom key
    KEY_PA1 = $FD,
    // PA1 key
    KEY_OEM_CLEAR = $FE,
    // Clear key
    KEY_CODES_COUNT = $FF
    // this is not a key, but the amount of keycodes there are.
  );


size2f=record
w,h:single;
end;

vector2d=record
x,y:single
end;

vector3d=record
x,y,z:single
end;
box3d=record
boxmin,boxmax:vector3d;
end;

triangle3d=record
a,b,c:vector3d;
end;

Ray3D=record
raybegin,rayend:vector3d;
end;

S3DVertex=record
 Pos, Normal:vector3d;
 Color:integer;
 TCoords:vector2d;
end;
  PMatrix4 = ^Matrix4;
  Matrix4 = packed record
    case integer of
      0 : (_11, _12, _13, _14: Single;
           _21, _22, _23, _24: Single;
           _31, _32, _33, _34: Single;
           _41, _42, _43, _44: Single);
      1 : (m : array [0..3, 0..3] of Single);
    end;



PParticle=^TParticle;
TParticle=record
     pos,dir,acc:vector3d;
		 r,g,b,alpha:single;
     userdata:integer;
		 size:size2f;
		 time:integer;
		 life:integer;
		 dead:boolean;
	end;



  const

DEBUGOFF      =0;// No Debug Data ( Default )<br>
DEBUGBBOX    =1;// Show Bounding Boxes of SceneNode<br>
DEBUGNORMALS =2;//  Show Vertex Normals<br>
DEBUGSKELETON=3;//  Shows Skeleton/Tags<br>
DEBUGMESH_WIRE_OVERLAY=4;//  Overlays Mesh Wireframe<br>
DEBUGHALF_TRANSPARENCY=5;// Temporary use transparency Material Type<br>
DEBUGBBOX_BUFFERS=6;     //  Show Bounding Boxes of all MeshBuffers<br>
DEBUGBBOX_ALL    = DEBUGBBOX or DEBUGBBOX_BUFFERS;
DEBUGFULL=7;             //   Show all debug infos.




//SYSTEM

function getDevice:IDevice;Cdecl external 'Core3D.dll';
 procedure  AppTitle(const t:pchar);Cdecl external 'Core3D.dll';
 Function SupportGLSL:boolean;Cdecl external 'Core3D.dll';
 Function SupportHardwareTL:boolean;Cdecl external 'Core3D.dll';
 Function SupportStencilBuffer:boolean;Cdecl external 'Core3D.dll';
 Function SupportMultiTexture:boolean;Cdecl external 'Core3D.dll';
 Function SupportARB:boolean;Cdecl external 'Core3D.dll';
 Function AvailableMemory:integer;Cdecl external 'Core3D.dll';
 Function TotalMemory:integer;Cdecl external 'Core3D.dll';
 Function VideoModeCount:integer;Cdecl external 'Core3D.dll';
 Function VideoModeDepth:integer;Cdecl external 'Core3D.dll';
 Function VideoModeResolutionWidth:integer;Cdecl external 'Core3D.dll';
 Function VideoModeResolutionHeight :integer;Cdecl external 'Core3D.dll';
 Function ProcessorSpeed:integer;Cdecl external 'Core3D.dll';



 procedure  BackGroundColor(r,g,b:integer);Cdecl external 'Core3D.dll';
 procedure  AmbientLight  (r,g,b:integer);Cdecl external 'Core3D.dll';
 procedure  ShadowColor (r,g,b,a:integer);Cdecl external 'Core3D.dll';
 procedure  ScreenShot;Cdecl external 'Core3D.dll';
 procedure  TakeScreenShotEx(const  filename:pchar);Cdecl external 'Core3D.dll';
 procedure  TakeScreenShot(const Path:pchar);Cdecl external 'Core3D.dll';


 procedure  InitEngine ( driver,w,h,bpp: Integer;vsync, Fullscreen :boolean);Cdecl external 'Core3D.dll';
 procedure  InitEngineEx(driver,handle:integer;w,h,bpp: Integer;vsync, Fullscreen :boolean);Cdecl external 'Core3D.dll';

 //function EngineGlHDc:HDC;Cdecl external 'Core3D.dll';

 Function   EngineRun(var timedelta:single):boolean;Cdecl external 'Core3D.dll';
 procedure  UpdateEngine;Cdecl;external 'Core3D.dll';
 procedure  CloseEngine;Cdecl external 'Core3D.dll';
 procedure  EndEngine;Cdecl external 'Core3D.dll';

 procedure FrameRateLimit(limit:integer);Cdecl external 'Core3D.dll';


 procedure setFog(r,g,b:integer;Density:single);Cdecl external 'Core3D.dll';


 procedure  EnableAntialias;Cdecl external 'Core3D.dll';
 procedure  BeginScene;Cdecl external 'Core3D.dll';
 procedure  EndScene;Cdecl external 'Core3D.dll';

 Function GetFps:single;Cdecl external 'Core3D.dll';
 Function GetTrisRendered:integer;Cdecl external 'Core3D.dll';
 Function LightCount:integer;Cdecl external 'Core3D.dll';


 ///****************OCCLISUION
 

procedure AddNodeToOcclusion(ent:INode);Cdecl external 'Core3D.dll';
procedure RunOcclusionQueries(visible:boolean=false);Cdecl external 'Core3D.dll';
procedure UpdateOcclusionQueries(block:boolean=true);Cdecl external 'Core3D.dll';
function  GetOcclusionQuerieResult(ent:INode):dword;Cdecl external 'Core3D.dll';
procedure RemoveFromOcclusionQuerie(ent:INode);Cdecl external 'Core3D.dll';
procedure RemoveAllOcclusionQueries;Cdecl external 'Core3D.dll';



procedure Draw3DLine(linebegin,lineend:vector3d;color:integer);Cdecl external 'Core3D.dll';
procedure Draw3DBox(box:box3d;color:dword);Cdecl external 'Core3D.dll';
procedure Draw3DTriangle(triangle:triangle3d;color:dword;wire:boolean=true);Cdecl external 'Core3D.dll';
procedure Draw3DGrid(countx, county, Size:integer);Cdecl external 'Core3D.dll';
procedure Draw3DRect(Position:vector3d; Width, Deph:single);Cdecl external 'Core3D.dll';
procedure Draw3DCube(x,y,z,w,h,d:single; clr:dword);Cdecl external 'Core3D.dll';
PROCEDURE Draw3DSphere( radius ,x,y,z:single;clr:dword);Cdecl external 'Core3D.dll';
procedure DrawRayQuad(tex:ITexture; flScale:single;vStart,vEnd,vUp:vector3d; beamColor:integer;MaterialType:TMATERIALTYPE);Cdecl external 'Core3D.dll';
procedure Draw3DBillBoard(texture:ITexture;pos:vector3d; color:integer; Width,Height:single;MaterialType:TMATERIALTYPE);Cdecl external 'Core3D.dll';



 //SCENE
procedure  BuilSceneNodeList;Cdecl external 'Core3D.dll';
function   GetSceneNodeTotal:integer;Cdecl external 'Core3D.dll';
function   GetSceneNodeFromIndex(index:integer):INODE;Cdecl external 'Core3D.dll';

function  GetSceneNodeFromName( name:pchar ):INODE;Cdecl external 'Core3D.dll';
function  GetSceneNodeFromId(id:integer):INODE;Cdecl external 'Core3D.dll';


procedure ChangeDirectory(const directory:pchar);Cdecl external 'Core3D.dll';
function  ExistFile(const ffile:pchar):boolean;Cdecl external 'Core3D.dll';
procedure LoadZip(const ffile:pchar);Cdecl external 'Core3D.dll';
procedure LoadScene( const ffile:pchar );Cdecl external 'Core3D.dll';
procedure SaveScene( const ffile:pchar );Cdecl external 'Core3D.dll';





//BOLT
function  CreateBolt(texture:pchar; startx,  starty, startz,
																	 endx,  endy,  endz:single;
																	 updateTime,  height,  parts,  bolts:dword;
																	 steddyend:boolean;thick:single;col:dword):INode;Cdecl external 'Core3D.dll';

procedure BoltRay( bolt:INode; startx,  starty, startz,
																	 endx,  endy,  endz:single;thick:single);Cdecl external 'Core3D.dll';
procedure BoltRayEx( bolt:INode; startx,  starty, startz,
																	 endx,  endy,  endz:single;
																	 updateTime,  height,  parts,  bolts:dword;
																	 steddyend:boolean;thick:single;col:dword);Cdecl external 'Core3D.dll';
//BEAM
function  CreateBeam(  szBeam , szBeamFront:pchar;startx,  starty, startz,endx,  endy,  endz:single;thick:single):INode;Cdecl external 'Core3D.dll';
procedure BeamRay(Beam:INode; bolt:INode; startx,  starty, startz,
																	 endx,  endy,  endz:single;thick:single);Cdecl external 'Core3D.dll';


//RIBBONTRAIL
function  CreateTrail(maxquads:integer=10; maxdist:Single=3):INode;Cdecl external 'Core3D.dll';
procedure  TrailColor(trail:INode;r,g,b,a:single);Cdecl external 'Core3D.dll';
procedure  TrailPoint1(trail:INode;x,y,z:single);Cdecl external 'Core3D.dll';
procedure  TrailRay(trail:INode;x,y,z,dx,dy,dz:single);Cdecl external 'Core3D.dll';
procedure  TrailPoint2(trail:INode;x,y,z:single);Cdecl external 'Core3D.dll';
procedure  TrailMaxDistance(trail:INode;value:single);Cdecl external 'Core3D.dll';
procedure  TrailAlphaBegin(trail:INode;value:single);Cdecl external 'Core3D.dll';



//DECAL
function CreateDecalNode(tri:triangle3d;intersection:vector3d):INode;Cdecl external 'Core3D.dll';
function CreateDecalNodeEx(trinormal,intersection:vector3d):INode;Cdecl external 'Core3D.dll';

//SKYDOMECOLORS
function  CreateSkyDomeColor (texture_file:ITexture;horiRes,vertRes:integer;texturePercentage,spherePercentage,domeRadius :single):INode;Cdecl external 'Core3D.dll';
procedure SkyDomeColor (dome:INode;HorizonColor,ZenithColor:dword);Cdecl external 'Core3D.dll';
procedure  SkyDomeColorBand (dome:INode;color:dword;position:integer;fade:single;addative:boolean);Cdecl external 'Core3D.dll';
procedure SkyDomeColorPoint(dome:INode;color:dword;positionX,  positionY,  positionZ,radius,  fade:single;addative:boolean);Cdecl external 'Core3D.dll';





//GRAPHICS
procedure  SetZWriteTrasparentScene(bol:boolean);Cdecl external 'Core3D.dll';
procedure  Transparency(Level :integer);Cdecl external 'Core3D.dll';
procedure  Colors  (Red , Green ,Blue :Integer);Cdecl external 'Core3D.dll';
procedure  Line2D  (x1,y1,x2,y2:integer);Cdecl external 'Core3D.dll';
procedure  Line3D  (x1,y1,z1,x2,y2,z2,hickness :single; Alpha,Red, Green,Blue:Integer);Cdecl external 'Core3D.dll';
procedure  Rect2D  (x,y:integer; widht ,height : Integer);Cdecl external 'Core3D.dll';
procedure  Pixel (x,y:integer);Cdecl external 'Core3D.dll';
procedure  Image (texture:ITEXTURE;x,y:integer);Cdecl external 'Core3D.dll';
procedure  Oval  (x,y:integer;Radius :single);Cdecl external 'Core3D.dll';
procedure  ImageSprites2D (texture:ITEXTURE;x,y,tx,ty, BX,BY :Integer);Cdecl external 'Core3D.dll';
procedure  ImageClip(text:ITexture;dest_sx,  dest_sy,  dest_ex,  dest_ey,
																  src_sx,  src_sy,  src_ex,  src_ey:integer;
																 color:dword=$FFFFFFFF;useAlphaChannelOfTexture:boolean=true );Cdecl external 'Core3D.dll';

procedure  ImageSrc(text:ITexture;dest_sx,  dest_sy,
																  src_sx,  src_sy,  src_ex,  src_ey:integer;
																  color:dword=$FFFFFFFF; useAlphaChannelOfTexture:boolean=true );Cdecl external 'Core3D.dll';

procedure BlendTextures(texturedest,texturesrc:ITexture;	xoffset,yoffset, operation:integer);Cdecl external 'Core3D.dll';



//INPUT

 Function KeyDown(keystate : IKEYCODE):boolean;Cdecl external 'Core3D.dll';
 Function KeyHit(keystate : IKEYCODE):boolean;Cdecl external 'Core3D.dll';

 Function MouseHit(keystate : Integer):boolean;Cdecl external 'Core3D.dll';
 Function MouseDown(keystate : Integer):boolean;Cdecl external 'Core3D.dll';
 procedure MoveMouse(var x,y:integer);Cdecl external 'Core3D.dll';

 Function MouseWheel:integer;Cdecl external 'Core3D.dll';
 Function MouseX:integer;Cdecl external 'Core3D.dll';
 Function MouseY:integer;Cdecl external 'Core3D.dll';

 procedure ShowMouse;Cdecl external 'Core3D.dll';
 procedure HideMouse;Cdecl external 'Core3D.dll';

//********************************************************************
//               OIS     INPUT
//********************************************************************
function InputUpdate:boolean;cdecl	;external'Core3D.dll';
function InputKeyDown(key:integer):boolean;cdecl	;external'Core3D.dll';
function InputMouseDown(but:integer):boolean;cdecl	;external'Core3D.dll';

function InputMouseX:integer;cdecl	;external'Core3D.dll';
function InputMouseY:integer;cdecl	;external'Core3D.dll';
function InputMouseZ:integer;cdecl	;external'Core3D.dll';
function InputMouseXAbs:integer;cdecl	;external'Core3D.dll';
function InputMouseYAbs:integer;cdecl	;external'Core3D.dll';
function InputMouseZAbs:integer;cdecl	;external'Core3D.dll';


//TEXT

Function  LoadFont(filename:pchar):IFONT;Cdecl external 'Core3D.dll';
function  FontSystem:IFONT;Cdecl external 'Core3D.dll';
procedure Font( Font:IFONT);Cdecl external 'Core3D.dll';
procedure Text(x, y:integer;txt:pchar;cenx :Integer = 0;ceny :Integer = 0);Cdecl external 'Core3D.dll';

//CAMERA
 Function CreateCamera:ICAMERA;Cdecl external 'Core3D.dll';
 Function CreateCameraFPS(rotspeed,movespeed:single):ICAMERA;Cdecl external 'Core3D.dll';
 Function CreateCameraMaya(rots ,zoos ,movs :single):ICAMERA;Cdecl external 'Core3D.dll';
 Function CreateCameraIsometric(Width ,height,fnear,ffar : Single):ICAMERA;Cdecl external 'Core3D.dll';
 procedure  ActiveCamera ( camera :ICAMERA);Cdecl external 'Core3D.dll';

 procedure  CameraFOV ( camera :ICAMERA; ratio :Single);Cdecl external 'Core3D.dll';
 procedure  CameraRange( camera :ICAMERA; fnear ,ffar :Single);Cdecl external 'Core3D.dll';
 procedure  CameraTarget( camera :ICAMERA;tx,ty,tz:single);Cdecl external 'Core3D.dll';
 function   GetCameraTarget( camera :ICAMERA):vector3d;Cdecl external 'Core3D.dll';
 procedure  CameraViewPort( width,height :integer);Cdecl external 'Core3D.dll';
 procedure  SetCameraViewPort( x,y,width,height :integer);Cdecl external 'Core3D.dll';
 procedure  CameraAspectRatio( camera:ICAMERA; aspect:single);Cdecl external 'Core3D.dll';

 Function TargetX ( camera :ICAMERA): single;Cdecl external 'Core3D.dll';
 Function TargetY ( camera :ICAMERA): Single;Cdecl external 'Core3D.dll';
 Function TargetZ ( camera :ICAMERA): single;Cdecl external 'Core3D.dll';

 Function ViewPortWidth:integer;Cdecl external 'Core3D.dll';
 Function ViewPortHeight:integer;Cdecl external 'Core3D.dll';


procedure   MoveCamera   (camera:ICamera;yaw,  pitch,  roll,drive,  strafe,  elevate:single);Cdecl external 'Core3D.dll';

procedure  CameraYaw(Camera:ICamera;value:single);Cdecl external 'Core3D.dll';
procedure  PitchCamera(Camera:ICamera;value:single);Cdecl external 'Core3D.dll';
procedure  AdvanceCamera(Camera:ICamera;value:single);Cdecl external 'Core3D.dll';
procedure  UpCamera(Camera:ICamera;value:single);Cdecl external 'Core3D.dll';

procedure  StrafeCamera(Camera:ICamera;value:single);Cdecl external 'Core3D.dll';
procedure  CameraUpAtRightAngle (Camera:ICamera);Cdecl external 'Core3D.dll';
procedure  CameraOrientation(camera:ICamera;vUp,vForward,vRight:vector3d);Cdecl external 'Core3D.dll';
procedure  TargetAndRotationCamera(camera:ICamera;flag:boolean);Cdecl external 'Core3D.dll';
procedure  CameraPitchYawRoll(Node : INode;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';
procedure  CameraAddPitchYawRoll(Node : INode;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';



procedure  SetCamera(cam:ICamera;pos,lookAt:vector3d);Cdecl external 'Core3D.dll';
procedure  SetCameraEx(cam:ICamera; x,y, z,lx,ly,lz:single);Cdecl external 'Core3D.dll';


procedure  CameraCockpitFollowing(camera:ICamera; Target:INode;offset:vector3d);Cdecl external 'Core3D.dll';
procedure  CameraAbsCockpitFollowing(camera:ICamera; Target:INode;offset:vector3d);Cdecl external 'Core3D.dll';
procedure  CameraFollowing(Camera:ICamera;Target:INode;speed, Distance, AltitudeCamera, pitch,yaw:single);Cdecl external 'Core3D.dll';
procedure  SetThirdPersonCam(Camera:ICamera;Target:INode; mouseWheelDiff, cameraZoomSpeed, deltaTime:single);Cdecl external 'Core3D.dll';



//'Fader
 procedure  FadeIn( time:Integer);Cdecl external 'Core3D.dll';
 procedure  FadeOut( time:Integer);Cdecl external 'Core3D.dll';
 procedure  FaderColor(r,g,b:Integer);Cdecl external 'Core3D.dll';
 Function   FadeIsReady:boolean;Cdecl external 'Core3D.dll';


 //directparticles
function  CreateEmitter:IEmitter;Cdecl external 'Core3D.dll';
procedure ClearEmitter(mit:IEmitter);Cdecl external 'Core3D.dll';
function  CountEmitterParticles(mit:IEmitter):integer;Cdecl external 'Core3D.dll';
function  GetEmitterParticle(mit:IEmitter;index:integer):TParticle;Cdecl external 'Core3D.dll';
procedure GetEmitterParticleEx(mit:IEmitter;index:integer;par:PParticle);Cdecl external 'Core3D.dll';
procedure SetEmitterParticle(mit:IEmitter;index:integer;p:TParticle);Cdecl external 'Core3D.dll';
procedure AddParticlesToEmitter(mit:IEmitter;count:integer);Cdecl external 'Core3D.dll';
function  AddParticleToEmitter(mit:IEmitter;par:TParticle):integer;Cdecl external 'Core3D.dll';
procedure AddEmitterParticlesBuffer(mit:IEmitter;par:PParticle;count:integer);Cdecl external 'Core3D.dll';
function  GetEmitterParticleDirection(mit:IEmitter;index:integer):vector3d;Cdecl external 'Core3D.dll';
procedure SetEmitterParticleDirection(mit:IEmitter;index:integer;v:vector3d);Cdecl external 'Core3D.dll';
function  GetEmitterParticlePosition(mit:IEmitter;index:integer):vector3d;Cdecl external 'Core3D.dll';
procedure SetEmitterParticlePosition(mit:IEmitter;index:integer;v:vector3d);Cdecl external 'Core3D.dll';
function  GetEmitterParticleAcceleration(mit:IEmitter;index:integer):vector3d;Cdecl external 'Core3D.dll';
procedure SetEmitterParticleAcceleration(mit:IEmitter;index:integer;v:vector3d);Cdecl external 'Core3D.dll';
procedure SetEmitterParticleSize(mit:IEmitter;index:integer;w,h:single);Cdecl external 'Core3D.dll';
function  GetEmitterParticleSize(mit:IEmitter;index:integer):size2f;Cdecl external 'Core3D.dll';
procedure SetEmitterParticleColor(mit:IEmitter;index:integer; r,g,b:single);Cdecl external 'Core3D.dll';
procedure SetEmitterParticleAlpha(mit:IEmitter;index:integer;alplha:single);Cdecl external 'Core3D.dll';
function  GetEmitterParticleRed(mit:IEmitter;index:integer):single;Cdecl external 'Core3D.dll';
function  GetEmitterParticleGreen(mit:IEmitter;index:integer):single;Cdecl external 'Core3D.dll';
function  GetEmitterParticleBlue(mit:IEmitter;index:integer):single;Cdecl external 'Core3D.dll';
function  GetEmitterParticleAlpha(mit:IEmitter;index:integer):single;Cdecl external 'Core3D.dll';
procedure SetEmitterParticleLife(mit:IEmitter;index:integer;life:single);Cdecl external 'Core3D.dll';
function  GetEmitterParticleLife(mit:IEmitter;index:integer):single;Cdecl external 'Core3D.dll';


//mesh

 Function CreatePivot:INode;Cdecl external 'Core3D.dll';
 Function CreateMeshCube:INode;Cdecl external 'Core3D.dll';
 Function CreateMeshSphere(polycount:integer):INode;Cdecl external 'Core3D.dll';
 Function CreateMeshCylinder(polycount :Integer):INode;Cdecl external 'Core3D.dll';
 Function CreateMeshCone(polycount :Integer):INode;Cdecl external 'Core3D.dll';
 Function CreateMeshPlane( size:Single; tileCount :integer):INode;Cdecl external 'Core3D.dll';
 function CreateMeshPlaneHill( w, h:single;tileCount:integer; u, v:single):INode;Cdecl external 'Core3D.dll';
 Function CreateMeshWater(height,speed, length :single):INode;Cdecl external 'Core3D.dll';
 function CreateMeshWaterEx( w,h:single; tileCount:integer; u, v, Height, Speed, Length:single):INode;Cdecl external 'Core3D.dll';


 function   GetMesh(filename:pchar):Imesh;Cdecl external 'Core3D.dll';
 function   StripMesh(mesh:Imesh;index:integer):INode;Cdecl external 'Core3D.dll';

 Function   LoadMesh  (filename:pchar; toTangents :boolean=false):INode;Cdecl external 'Core3D.dll';

 function DrawNodeTriangles( Node:Inode;MeshBuffer:integer;color:integer;wire:boolean):boolean;Cdecl external 'Core3D.dll';

 procedure  NodeCastShadow (mesh:INode);Cdecl external 'Core3D.dll';
 procedure  OutlineMesh( mesh:INode;thickness :single;r,g,b:integer);Cdecl external 'Core3D.dll';
 Function   MeshesCollide ( mesh1,esh2 :INode):boolean;Cdecl external 'Core3D.dll';
 Function   VertexCount ( mesh :INode):integer;Cdecl external 'Core3D.dll';

 Function    CurrentFrame ( mesh :INode):integer;Cdecl external 'Core3D.dll';
 procedure   AnimateLoop(mesh:INode;looped:boolean);Cdecl external 'Core3D.dll';
 procedure   AnimateSpeed(mesh:INode;speed:single);Cdecl external 'Core3D.dll';
 function     CurrentFrameSpeed( mesh :INode):single;Cdecl external 'Core3D.dll';
 procedure   AnimateTransitionTime(mesh:INode;time:single);Cdecl external 'Core3D.dll';
 procedure   AnimateFrameLoop(mesh:INode;framebegin,frameend:integer);Cdecl external 'Core3D.dll';
 procedure   AnimateFrame(mesh:INode;frame:single);Cdecl external 'Core3D.dll';
 procedure    AnimateNode(mesh:INode; speed:single;framebegin,frameend:integer; loop:boolean=false);Cdecl external 'Core3D.dll';
 procedure   SetMd2Animation(mesh:INode; name:pchar);Cdecl external 'Core3D.dll';
 procedure   SetMd2AnimationIndex(mesh:INode; layer:integer);Cdecl external 'Core3D.dll';
 

 //BUFERS
function  GetNodeAllIndicesCount (mesh:INode):integer;Cdecl external 'Core3D.dll';
function  GetNodeAllVertexCount (mesh:INode):integer;Cdecl external 'Core3D.dll';
function  GetAllNodeVertices(mesh:INode;vertex:pointer):boolean;Cdecl external 'Core3D.dll';
function  GetAllNodeIndices(mesh:INode;indices:pointer):boolean;Cdecl external 'Core3D.dll';


function  GetNodeBufferCount(mesh:INode;frame:integer):integer;Cdecl external 'Core3D.dll';
function  GetNodeIndices (mesh:INode;Frame:integer;indicies:pointer;MeshBuffer:integer):boolean;Cdecl external 'Core3D.dll';
function  GetNodeIndicesCount(mesh:INode;Frame,MeshBuffer:integer ):integer;Cdecl external 'Core3D.dll';
function  GetNodeVertexCount(mesh:INode;Frame,MeshBuffer:integer ):integer;Cdecl external 'Core3D.dll';
function  GetNodeVertices(mesh:INode;Frame:integer;vertices:pointer;MeshBuffer:integer):boolean;Cdecl external 'Core3D.dll';


//TRASFORMBUFFERS
procedure  PlanarTextureMappingNodeSurfaces(Node:INode; v:single);Cdecl external 'Core3D.dll';



//SURFACE
function   CreateSurface:ISurface;Cdecl external 'Core3D.dll';
procedure  SurfaceDrop (surface:ISurface);Cdecl external 'Core3D.dll';
procedure  PaintSurface (surface:ISurface;brush:IMaterial);Cdecl external 'Core3D.dll';
function   AddVertex (surface:ISurface;x,y,z:single; u:single=0.0;v:single=0.0):integer;Cdecl external 'Core3D.dll';
function   AddTriangle  (surface:ISurface;v1,v2,v3:integer):integer;Cdecl external 'Core3D.dll';
procedure  VertexCoords(surface:ISurface;index:integer;x,y,z:single);Cdecl external 'Core3D.dll';
procedure  VertexNormal(surface:ISurface;index:integer;x,y,z:single);Cdecl external 'Core3D.dll';
procedure  VertexColor (surface:ISurface;index:integer;r,g,b,a:integer);Cdecl external 'Core3D.dll';
procedure  VertexTexCoords (surface:ISurface;index:integer;u,v:single;coord_set:integer=0);Cdecl external 'Core3D.dll';
procedure  VertexTexCoords2 (surface:ISurface; index:integer;u,v,u2,v2:single);Cdecl external 'Core3D.dll';
//BRUSHMATERIAL
function   CreateBrush  (r,g,b,a:integer):IMaterial;Cdecl external 'Core3D.dll';
procedure  BrushDrop  (brush:IMaterial);Cdecl external 'Core3D.dll';
function   LoadBrush  (layer:integer;const filename:pchar):IMaterial;Cdecl external 'Core3D.dll';
procedure  BrushType (brush:IMaterial;newType:TMATERIALTYPE);Cdecl external 'Core3D.dll';
procedure  BrushAlphaRef (brush:IMaterial; value:single);Cdecl external 'Core3D.dll';
procedure  BrushFlag (brush:IMaterial;flag:integer; value:boolean);Cdecl external 'Core3D.dll';
procedure  BrushTexture (brush:IMaterial; layer:integer;tex:ITexture);Cdecl external 'Core3D.dll';


//MESHBUFFER
function LoadMeshBuffer(fname:pchar;withTangents:boolean):Imesh;Cdecl external 'Core3D.dll';
function LoadStaticMeshBuffer(fname:pchar;withTangents:boolean):Imesh;Cdecl external 'Core3D.dll';

function CreateNodeFromAnimatedMesh(IAnimatedMesh:IMesh):INode;Cdecl external 'Core3D.dll';
function CreateNodeFromStaticMesh(IMesh:IMesh):INode;Cdecl external 'Core3D.dll';


procedure RotateMeshSurfaces(mesh:IMesh;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';
procedure ScaleMeshSurfaces(mesh:IMesh;x,y,z:single);Cdecl external 'Core3D.dll';


//MESH
function   MeshType(mesh:INode):TMeshTYPE;Cdecl external 'Core3D.dll';
function   CreateMesh:Imesh;Cdecl external 'Core3D.dll';
procedure  FreeMesh(Mesh:IMesh);Cdecl external 'Core3D.dll';
procedure  AddSurfaceToMesh(Mesh:Imesh;surface:ISurface);Cdecl external 'Core3D.dll';
function   CreateNodeFromMesh(Mesh:Imesh):INode;Cdecl external 'Core3D.dll';



//BSP MAP
function  LoadQuakeMap(var  OutMesh:Imesh;mapname:pchar;minimalPolysPerNode:integer=128):INode;Cdecl external 'Core3D.dll';
function  LoadQuakeMesh(mapname:pchar):Imesh;Cdecl external 'Core3D.dll';


//DIRECTDRAW
procedure  SetDefaultTransform( pos,rot,scale:vector3d);Cdecl external 'Core3D.dll';
procedure  MaterialRenderDefaults(ligth:boolean;ZWriteEnable:boolean;BackfaceCulling:boolean;FogEnable:boolean);Cdecl external 'Core3D.dll';
procedure  MaterialRenderTexture(tex:ITexture; value:integer);Cdecl external 'Core3D.dll';
procedure  MaterialRenderFlag(flag:integer; value:boolean);Cdecl external 'Core3D.dll';
procedure  MaterialRenderType(MaterialType:TMATERIALTYPE);Cdecl external 'Core3D.dll';
procedure  SetMaterialToRender;Cdecl external 'Core3D.dll';
procedure  DrawIndexedTriangleList(vertices:pointer; vertexCount:integer; indexList:pointer;triangleCount:integer);Cdecl external 'Core3D.dll';
procedure  Draw2DVertexPrimitiveList(vertices:pointer; vertexCount:integer; indexList:pointer;primitiveCount:integer;pType:TPRIMITIVETYPE);Cdecl external 'Core3D.dll';
procedure  DrawVertexPrimitiveList(vertices:pointer; vertexCount:integer; indexList:pointer;primitiveCount:integer;pType:TPRIMITIVETYPE);Cdecl external 'Core3D.dll';

function makeVextex(x,y,z:single;nx,ny,nz:single;u,v:single;color:dword):S3DVertex;




 //PICK COLIDE
function   CameraPickBBNodes(camera:ICamera;id_mask:integer=0):boolean;Cdecl; external 'Core3D.dll';
function   PickNode(mx,my:integer; AABB:boolean;distance:single;mask:integer=0):boolean;Cdecl; external 'Core3D.dll';
function   PickNodeMesh(mx,my:integer; distance:single;mask:integer=0):boolean;Cdecl; external 'Core3D.dll';//pick face by face :::slow i tink
function   RayPickNode( const  ray:Ray3D; AABB:boolean;distance:single;mask:integer=0):boolean;Cdecl; external 'Core3D.dll';
Function   LinePick ( X1 : single;  Y1 : single; Z1 : single; X2 : single; Y2 : single; Z2 : single) : INode;Cdecl external 'Core3D.dll';

//COLIDER

procedure Collisions (mesh1,mesh2:INode;mode:integer;
          SX : Single=3; SY : Single=3; SZ : Single=3;
          GX : SINGLE=0; GY : SINGLE=-1; GZ : SINGLE=0;
          OFFX : SINGLE=0; OFFY : SINGLE=3; OFFZ : SINGLE=0);Cdecl external 'Core3D.dll';


procedure PickedPosition(var pos:vector3d);Cdecl; external 'Core3D.dll';
procedure PickedNormal(var norm:vector3d);Cdecl; external 'Core3D.dll';
procedure PickedTriangle(var triangle:triangle3d);Cdecl; external 'Core3D.dll';
procedure PickedNode(var OutNode:INode);Cdecl; external 'Core3D.dll';

//SELECTOR
procedure DropTriangleSelector(selector:ITriangleSelector);Cdecl; external 'Core3D.dll';
function CreateTriangleSelector(Node:INode):ITriangleSelector;Cdecl; external 'Core3D.dll';
function CreateOctreeTriangleSelector(mesh:IMesh;Node:INode;minimalPolysPerNode:integer=128):ITriangleSelector;Cdecl; external 'Core3D.dll';
function CreateNodeOctreeTriangleSelector(Node:INode;minimalPolysPerNode:integer=128):ITriangleSelector;Cdecl; external 'Core3D.dll';
function CreateTerrainTriangleSelector(terrain:ITerrainLOD;LOD:integer=0):ITriangleSelector;Cdecl; external 'Core3D.dll';
function CreateTriangleSelectorFromNodeBB(Node:INode):ITriangleSelector;Cdecl; external 'Core3D.dll';
//SELECTOR LIST
function  CreateSelectorList:ITriangleList;Cdecl; external 'Core3D.dll';
procedure AddTriangleSelector(TriangleList:ITriangleList;ts:ITriangleSelector);Cdecl; external 'Core3D.dll';
function  CreateTriangleSelectorFromScene:ITriangleList;Cdecl; external 'Core3D.dll';



function GetSceneNodeAndCollisionPointFromCamera(camera:ICAMERA;dist:single=10000;idBitMask:integer=0):INode;Cdecl; external 'Core3D.dll';
function GetSceneNodeAndCollisionPointFromRay(rbegin,rRend:vector3d;idBitMask:integer=0):INode;Cdecl; external 'Core3D.dll';
function PickNodeFromCamera(camera:ICAMERA;dist:single=10000;idBitMask:integer=0):boolean;Cdecl; external 'Core3D.dll';
function PickNodeFromRay(Tbegin,Rend:vector3d;idBitMask:integer=0):boolean;Cdecl; external 'Core3D.dll';



function PickSelectorPointFromRay(selector:ITriangleSelector;ray:RAY3D):boolean;Cdecl; external 'Core3D.dll';
function PickSelectorPointFromCamera(selector:ITriangleSelector;camera:ICamera;dist:single=10000):boolean;Cdecl; external 'Core3D.dll';


function CollisionResultPosition(world:ITriangleSelector;
										  ellipsoidPosition,
                      ellipsoidRadius,
										  ellipsoidDirectionAndSpeed:vector3d;
										  slidingValue:single):vector3d;Cdecl; external 'Core3D.dll';

//RAYCREATE
function  RayFromScreen(x,y:integer):RAY3D;Cdecl; external 'Core3D.dll';
function  RayFromCamera(camera:ICAMERA;dist:single=10000):RAY3D;Cdecl; external 'Core3D.dll';



//JOINT
Function  CountJoint ( mesh :INode):integer;Cdecl external 'Core3D.dll';
function  BoneIndex( mesh :INode):integer;Cdecl external 'Core3D.dll';
Function  FindJoint ( mesh :INode; nameChild :pchar):INode;Cdecl external 'Core3D.dll';
function  GetJoint( mesh :INode;index :integer):INode;Cdecl external 'Core3D.dll';
procedure JointMode ( mesh:INode;mode: integer);Cdecl external 'Core3D.dll';
Function  GetJointName (child:INode) :pchar;Cdecl external 'Core3D.dll';
procedure AnimateJoints(child:INode;CalculateAbsolutePositions:boolean=true);Cdecl external 'Core3D.dll';
procedure SetRenderFromIdentity(child:INode;seton:boolean=true);Cdecl external 'Core3D.dll';
procedure SetJointTransitionTime(child:INode;time:single);Cdecl external 'Core3D.dll';
procedure RotateJoint(child:INode;name:pchar;x,y,z:single);Cdecl external 'Core3D.dll';
procedure RotateJointIndex(child:INode;index:integer;x,y,z:single);Cdecl external 'Core3D.dll';


//MISC
procedure  NodeSelector(Node : INode;triangle:ITriangleSelector;droptriangles:boolean=true);Cdecl external 'Core3D.dll';
procedure  DebugNode( Node : INode;mode:integer);Cdecl external 'Core3D.dll';

//CONTROL
function    NodeId ( Node : INode):integer;Cdecl external 'Core3D.dll';
procedure  IdNode ( Node : INode;id:integer);Cdecl external 'Core3D.dll';
procedure  DeleteNode (Node:INode);Cdecl external 'Core3D.dll';
procedure  ShowNode (Node:INode);Cdecl external 'Core3D.dll';
procedure  HideNode (Node:INode);Cdecl external 'Core3D.dll';
procedure  UpdateNode(Node:INode);Cdecl external 'Core3D.dll';
procedure  NameNode (Node:INode;namemesh:pchar);Cdecl external 'Core3D.dll';
procedure  NodeParent (fadher:INode; child :INode);Cdecl external 'Core3D.dll';
procedure  NodeTexture (Node:INode;Texture:ITEXTURE;Index :integer);Cdecl external 'Core3D.dll';
procedure  NodeColor (Node:INode;Red,Green,Blue :integer);Cdecl external 'Core3D.dll';
procedure  NodeSpecularColor(Node:INode;Red,Green,Blue :integer;a:integer=255);Cdecl external 'Core3D.dll';
procedure  NodeDiffuseColor(Node:INode;Red,Green,Blue :integer;a:integer=255);Cdecl external 'Core3D.dll';
procedure  NodeAmbientColor(Node:INode;Red,Green,Blue :integer;a:integer=255);Cdecl external 'Core3D.dll';
procedure  NodeShininess (Node:INode;shininess:Single);Cdecl external 'Core3D.dll';
procedure  NodeAlpha (Node:INode;level :integer);Cdecl external 'Core3D.dll';
procedure  NodeMaterialType(Node:INode;mattype:TMATERIALTYPE);Cdecl external 'Core3D.dll';
procedure  NodeMaterialTypeParam(Node:INode;MaterialTypeParam:single);Cdecl external 'Core3D.dll';
procedure  NodeFlag  (Node:INode;Flag :integer;value:boolean);Cdecl external 'Core3D.dll';
procedure NodeFxSolid(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxLightAdd(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxDetailMap(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxSphereMap(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxReflection(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxAddColor(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxAlpha(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxNormalSolid(Node:INode);Cdecl external 'Core3D.dll';
procedure NodeFxParallax(Node:INode);Cdecl external 'Core3D.dll';

procedure NodeCulling(Node:Inode;mode:E_CULLING_TYPE);Cdecl external 'Core3D.dll';

procedure  NodeLight(Node:INode;value:boolean=true);Cdecl external 'Core3D.dll';
procedure  NodeNormalize(Node:INode;value:boolean=true);Cdecl external 'Core3D.dll';
procedure  NodeFog(Node:INode;value:boolean=true);Cdecl external 'Core3D.dll';
Function   CopyNode (Node:INode):INode;Cdecl external 'Core3D.dll';
procedure  EnableNodeShadow(Node:INode;zfailmethod:boolean=true);Cdecl external 'Core3D.dll';

//MOVEMENT
procedure  SetNodePosition( Node : INode; v:vector3d);Cdecl external 'Core3D.dll';
procedure  SetNodeRotation( Node : INode; v:vector3d);Cdecl external 'Core3D.dll';
procedure  TranslateNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  ScaleNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  PositionNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  RotateNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  RotateNodeX( Node : INode; v: Single);Cdecl external 'Core3D.dll';
procedure  RotateNodeY( Node : INode; v: Single);Cdecl external 'Core3D.dll';
procedure  RotateNodeZ( Node : INode; v: Single);Cdecl external 'Core3D.dll';
procedure  SetNodeNormal( Node : INode;normalvector:vector3d;diff:single);Cdecl external 'Core3D.dll';
procedure  SetNodeNormalInterpolated( Node : INode;normalvector:vector3d;value:single;diff:single);Cdecl external 'Core3D.dll';
procedure  RotateNodeDeg( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  TurnNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  TurnEulerNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  TurnAirNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  TurnQuatNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  MoveNode( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  MoveNodeEx( Node : INode; x : Single; y : Single; z : Single);Cdecl external 'Core3D.dll';
procedure  PointAtNode( Node1 : INode; Node2 : INode);Cdecl external 'Core3D.dll';
function   NodePosition(Node : INode;parent:boolean=false):vector3d;Cdecl external 'Core3D.dll';
function   GetNodePosition(Node : INode):vector3d;Cdecl external 'Core3D.dll';
function   GetAbsNodePosition(Node : INode):vector3d;Cdecl external 'Core3D.dll';
function   GetNodeParentPosition(Node : INode):vector3d;Cdecl external 'Core3D.dll';
function   GetNodeForward(Node : INode;parent:boolean=true):vector3d;Cdecl external 'Core3D.dll';
function   GetNodeParentForward(Node : INode):vector3d;Cdecl external 'Core3D.dll';

procedure DrawNodeBox(node:Inode;color:integer);Cdecl external 'Core3D.dll';
procedure DrawNodeTrasformBox(node:Inode;color:integer);Cdecl external 'Core3D.dll';


function GetChildIndex(Node : INode;index:integer):INode;Cdecl external 'Core3D.dll';

function TrasnformNodeWorldPoint( Node : INode; point:vector3d):vector3d;Cdecl external 'Core3D.dll';
function TrasnformNodeLocalPoint( Node : INode; point:vector3d):vector3d;Cdecl external 'Core3D.dll';


procedure YawNode(Node : INode;v:single);Cdecl external 'Core3D.dll';
procedure RollNode(Node : INode;v:single);Cdecl external 'Core3D.dll';
procedure PitchNode(Node : INode;v:single);Cdecl external 'Core3D.dll';
procedure AddYawNode(Node : INode;v:single);Cdecl external 'Core3D.dll';
procedure AddRollNode(Node : INode;v:single);Cdecl external 'Core3D.dll';
procedure AddPitchNode(Node : INode;v:single);Cdecl external 'Core3D.dll';

function   GetNodeRotation(Node : INode):vector3d;Cdecl external 'Core3D.dll';
function   NodeRotation(Node : INode;parent:boolean):vector3d;Cdecl external 'Core3D.dll';

function   NodeScale(Node : INode):vector3d;Cdecl external 'Core3D.dll';
procedure  NodeAs4Values(Node : INode;arrayOf4Floats:pointer);Cdecl external 'Core3D.dll';

function   TransformNodeDirectionEx( Node : INode; x : Single; y : Single; z : Single;local:boolean=true):vector3d;Cdecl external 'Core3D.dll';
function   TransformNodeDirection(Node:Inode;v:vector3d;local:boolean=true):vector3d;Cdecl external 'Core3D.dll';
procedure  SimpleNodeMove(Node:Inode;v:vector3d);Cdecl external 'Core3D.dll';
procedure  SimpleNodeMoveEx(Node:Inode;x,y,z:single);Cdecl external 'Core3D.dll';

procedure  AddChildNode( Node ,child : INode);Cdecl external 'Core3D.dll';

procedure  PointNode( Node1 : INode; Node2 : INode;rolls:single);Cdecl external 'Core3D.dll';
procedure  PointTargetNode(Node1 : INode;px,py,pz,roll:single);Cdecl external 'Core3D.dll';


procedure  NodePitchYawRoll(Node : INode;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';
procedure  NodeAddPitchYawRoll(Node : INode;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';
procedure  NodePitchYawRollRadian(Node : INode;pitch, yaw, roll:single);Cdecl external 'Core3D.dll';

procedure  SetNodeTransform(Node : INode;const Matrix:pointer);Cdecl external 'Core3D.dll';
procedure  SetNodeFullTransform(Node : INode;const Matrix:pointer);Cdecl external 'Core3D.dll';
procedure  SetNodeOrientation(Node : INode;const Matrix:pointer);Cdecl external 'Core3D.dll';
procedure  GetNodeAbsTransform (Node : INode; Matrix:pointer);Cdecl external 'Core3D.dll';
procedure  GetNodeRelativeTransform(Node : INode; Matrix:pointer);Cdecl external 'Core3D.dll';
function   GetMatElement(Node : INode;row,column:single ):single;Cdecl external 'Core3D.dll';


procedure RenderNode( Node : INode);Cdecl external 'Core3D.dll';

function TFormPoint(Node : INode;x,y,z:single):vector3d;Cdecl external 'Core3D.dll';
function TFormVector(Node : INode;x,y,z:single):vector3d;Cdecl external 'Core3D.dll';


 Function NodeX ( Node : INode;parent:boolean=true) : Single;Cdecl external 'Core3D.dll';
 Function NodeY ( Node : INode;parent:boolean=true) : Single;Cdecl external 'Core3D.dll';
 Function NodeZ ( Node : INode;parent:boolean=true) : Single;Cdecl external 'Core3D.dll';
 Function NodePitch ( Node : INode) : Single;Cdecl external 'Core3D.dll';
 Function NodeYaw ( Node : INode) : Single;Cdecl external 'Core3D.dll';
 Function NodeRoll ( Node : INode) : Single;Cdecl external 'Core3D.dll';
 Function NodeName ( Node : INode) : pchar;Cdecl external 'Core3D.dll';

 Function NodeDistance ( Node1 : INode; Node2 : INode) : Single;Cdecl external 'Core3D.dll';


//OCTREENode

function   CreateOctree(mesh:Imesh; minimalPolysPerNode:integer):INode;Cdecl external 'Core3D.dll';
function   CreateOctreeFromStaticMesh(mesh:Imesh; minimalPolysPerNode:integer):INode;Cdecl external 'Core3D.dll';



//MATERIALS
 procedure  MaterialType ( Node : INode; num : integer; t : TMATERIALTYPE);Cdecl external 'Core3D.dll';
 procedure  MaterialFlag ( Node : INode; num : integer; flag : integer; mode : integer);Cdecl external 'Core3D.dll';
 procedure  MaterialTexture ( Node : INode; num : Integer; texture : ITEXTURE; index : integer);Cdecl external 'Core3D.dll';
 procedure  MaterialColor ( Node : INode; num : Integer; red : integer; green : integer; blue : Integer);Cdecl external 'Core3D.dll';
 procedure  MaterialEmissiveColor ( Node : INode; num : Integer; red : integer; green : integer; blue : Integer);Cdecl external 'Core3D.dll';
 procedure  MaterialShininess ( Node : INode; num : Integer; shininess : single);Cdecl external 'Core3D.dll';
 procedure  MaterialAlpha( Node : INode; num : Integer; level : integer);Cdecl external 'Core3D.dll';
 procedure  MaterialTextureUV  ( Node : INode; num : Integer; index : Integer; u : Single; v : Single);Cdecl external 'Core3D.dll';
 procedure  MaterialTextureAngle ( Node : INode; num : Integer; index : integer; angle : Single);Cdecl external 'Core3D.dll';
 procedure  MaterialTextureScale( Node : INode; num : Integer; index : integer; sx : Single; sy : Single);Cdecl external 'Core3D.dll';
 function   MaterialCount(  Node : 	INode) : Integer;Cdecl external 'Core3D.dll';


//image
function   CreateImage(sx,sy:integer):IImage;Cdecl external 'Core3D.dll';
function   CreateImageFromTexture(tex:ITEXTURE;sx,sy:integer):IImage;Cdecl external 'Core3D.dll';
procedure  SaveImage(img:IImage;const filename:pchar);Cdecl external 'Core3D.dll';
procedure  BltImage(img_src,img_dst:IImage;posx,posy:integer);Cdecl external 'Core3D.dll';
 function  LoadImageFromFile ( filename :  pchar) : IImage;Cdecl external 'Core3D.dll';

 function  ImageToRaw(image,saveraw:pchar):boolean;Cdecl external 'Core3D.dll';
 function  RawToImage(image,saveraw:pchar):boolean;Cdecl external 'Core3D.dll';
 function  RawToImageEx(image,saveraw:pchar;bytesperpixel:integer):boolean;Cdecl external 'Core3D.dll';

procedure  SaveBufferToFile(pixels:pointer;w, h:integer;const filename:pchar);Cdecl external 'Core3D.dll';

//TEXTURE

procedure SaveTextureToFile(tex:ITEXTURE;const filename:pchar);Cdecl external 'Core3D.dll';



 Function LoadTexture ( filename : pchar) : ITEXTURE;Cdecl external 'Core3D.dll';
 Function CreateRTT  ( sx : Integer; sy : Integer) : ITEXTURE;Cdecl external 'Core3D.dll';
 procedure  RenderTarget  ( texture : ITEXTURE);Cdecl external 'Core3D.dll';
 procedure DrawSceneToTexture( texture : ITEXTURE;r,g,b,a:integer);Cdecl external 'Core3D.dll';
 procedure  ColorKeyTexture ( texture : ITEXTURE; red ,green ,blue : Integer);Cdecl external 'Core3D.dll';
 Function FindTexture ( n : pchar) : ITEXTURE;Cdecl external 'Core3D.dll';
 procedure RemoveTexture( texture : ITEXTURE);Cdecl external 'Core3D.dll';
 Function TextureWidth ( texture : ITEXTURE) : Integer;Cdecl external 'Core3D.dll';
 Function TextureHeight ( texture : ITEXTURE) : Integer;Cdecl external 'Core3D.dll';
 Function LockTexture  ( texture : ITEXTURE) : pointer;Cdecl external 'Core3D.dll';
 procedure UnLockTexture  ( texture : ITEXTURE);Cdecl external 'Core3D.dll';



 //LIGHT

 function CreateVolumeLight(  tailcolor,  footcolor,  subdivU,  subdivV:dword):ILIGHT;Cdecl external 'Core3D.dll';


 Function   CreateLight  ( mode : TLIGHTTYPE;rad:single=100):ILIGHT;Cdecl external 'Core3D.dll';
 function   CreateLightEx( mode : TLIGHTTYPE;rad:single;r,g,b:single;a:single=1):ILIGHT;Cdecl external 'Core3D.dll';
 procedure  LightRadius( light : ILIGHT; radius : Single);Cdecl external 'Core3D.dll';
 procedure  LightCastShadow ( light : ILIGHT);Cdecl external 'Core3D.dll';
 procedure  LightColor ( light : ILIGHT; red ,green , blue : Integer);Cdecl external 'Core3D.dll';
 procedure  LightColorf( light : ILIGHT;r,g,b:single;a:single=1);Cdecl external 'Core3D.dll';
 procedure  LightFalloff( light : ILIGHT; falloff : Single);Cdecl external 'Core3D.dll';
 procedure  LightConeAngles( light : ILIGHT; Inner , Outer : single);Cdecl external 'Core3D.dll';
 procedure  LightAttenuation( light : ILIGHT; c , l ,q : single);Cdecl external 'Core3D.dll';
 procedure  LightDirection  ( light : ILIGHT; x ,y ,z : Single);Cdecl external 'Core3D.dll';


 function CreateLensFlare(fname:pchar): INode;Cdecl external 'Core3D.dll';
procedure SetLensFlareStrength(flare:INode;f:single);Cdecl external 'Core3D.dll';



//SHADERS

function  LoadShader(VFileName,PFileName :pchar) :ISHADER;Cdecl external 'Core3D.dll';
procedure ApplyShadersNode(Shader : ISHADER; Node : INode);Cdecl external 'Core3D.dll';
procedure ApplyShadersMaterial( Shader : ISHADER; Node : INode; Num : integer);Cdecl external 'Core3D.dll';
procedure VertexShaderConstant( Shader : ISHADER; FName : pchar; CData : psingle;  Count : Integer);Cdecl external 'Core3D.dll';
procedure PixelShaderConstant( Shader : ISHADER; FName : pchar; CData : psingle;  Count : Integer);Cdecl external 'Core3D.dll';

//WATERSHADER
function CreateWaterShader(
	 const filename:pchar;
	 pos:vector3d;
	 color:dword;
	  width,
	  height,
	  renderTargetSizeWidth,
	  renderTargetSizeHeight:single):INode;Cdecl external 'Core3D.dll';
procedure  SetWaterColor(water:INode;color:dword);Cdecl external 'Core3D.dll';
procedure  SetWindForce(water:INode;value:single);Cdecl external 'Core3D.dll';
procedure  SetBlendFactor(water:INode;value:single);Cdecl external 'Core3D.dll';
procedure  SetWindDirection(water:INode;nx,ny:single);Cdecl external 'Core3D.dll';
procedure  SetWaveHeight(water:INode;value:single);Cdecl external 'Core3D.dll';


//SHADER_ADVANCE

procedure  SetShaderVersion(VSpe:IVERTEX_SHADER_TYPE; PSpe:IPIXEL_SHADER_TYPE );cdecl;external 'Core3D.dll';

function AddHighLevelShaderMaterialFromFiles(const  vsFileName:pchar;const  vertexShaderEntryPointName:pchar;
											              const  psFileName:pchar;const  pixelShaderProgram:pchar;
                                    videottype:TMATERIALTYPE;
                                    callbackservice:TShaderCallBack;userdate:integer=0):integer;cdecl;external 'Core3D.dll';


function  AddShaderMaterialFromFiles(const vsFileName:pchar; const  psFileName:pchar;
                    videottype:TMATERIALTYPE;
                    callbackservice:TShaderCallBack;userdata:integer=0):integer;cdecl;external 'Core3D.dll';


function AddHighLevelShaderMaterial(const  vertexShaderProgram:pchar;const  vertexShaderEntryPointName:pchar;
											              const  pixelShaderProgram:pchar;const  pixelShaderEntryPointName:pchar;
                                    videottype:TMATERIALTYPE;
                                   callbackservice:TShaderCallBack;userdate:integer=0):integer;cdecl;external 'Core3D.dll';


function  AddShaderMaterial(const vertexShaderProgram:pchar; const  pixelShaderProgram:pchar;
                    videottype:TMATERIALTYPE;
                    callbackservice:TShaderCallBack;userdate:integer=0):integer;cdecl;external 'Core3D.dll';




procedure SetPixelShaderConstant(services:IService;const  data:pointer; startRegister,     constantAmount :integer );cdecl;external 'Core3D.dll';
procedure SetPixelHLShaderConstant(services:IService;const  name:pchar;  const   floats:pointer;  count:integer   )cdecl;external 'Core3D.dll';


procedure SetVertexShaderConstant(services:IService;const  data:pointer; startRegister,     constantAmount :integer );cdecl;external 'Core3D.dll';


procedure SetVertexHLShaderConstant(services:IService;const  name:pchar;  const   floats:pointer;  count:integer   )cdecl;external 'Core3D.dll';
procedure SetPixelHLShaderTexture(services:Iservice;const  name:pchar; id:integer )cdecl;external 'morph3d.dll';

procedure SetShaderMatrixWorldInversse(services:IService )cdecl;external 'Core3D.dll';



//MATRIX
procedure  ProjectionTransform(Matrix:pointer);cdecl;external 'Core3D.dll';
procedure  ViewTransform(Matrix:pointer);cdecl;external 'Core3D.dll';
procedure  WorldTransform(Matrix:pointer);cdecl;external 'Core3D.dll';




//TIME

procedure  TimeStart;Cdecl external 'Core3D.dll';
procedure  TimeStop;Cdecl external 'Core3D.dll';
procedure  TimeSpeed(speed :Single);Cdecl external 'Core3D.dll';
Function   GetTime :integer;Cdecl external 'Core3D.dll';
Function   GetRealTime:integer;Cdecl external 'Core3D.dll';




//TERRAIN
function CreateTerrainBlocks(cptrFile:pchar;tilesperquad:integer;scale:vector3d; detailtu,detailtv:single):ILAndscape;Cdecl external 'Core3D.dll';
function TerrainBlocksHight(node:ILAndscape;x,y:single;reverseQaud:boolean=false):single;Cdecl external 'Core3D.dll';
function TerrainBlocksNormal(node:ILAndscape;x,y:single):vector3d;Cdecl external 'Core3D.dll';

//LANDSCAPE
function CreateLandscape(cptrFile:pchar;tilesize:single; yscale:single; smoothing:integer;Precision, x, z:single):ILAndscape;Cdecl external 'Core3D.dll';
function CreateHugeLandscape(cptrFile:pchar;countx,county:integer;tilesize:single; yscale:single; smoothing:integer;Precision, x, z:single):ILAndscape;Cdecl external 'Core3D.dll';

function CreateHugeLandscapeTiles(cptrFile:pchar;countx,county:integer;tilesize,yscale:single; smoothing:integer;Precision, x, z:single):ILAndscape;Cdecl external 'Core3D.dll';

procedure UpdateLandscape(Node:ILAndscape);Cdecl external 'Core3D.dll';
procedure SetLandscapeLod(node:ILAndscape; dist:single;enable:boolean=true);Cdecl external 'Core3D.dll';
procedure ExpandeLandscapeTexture(Node:ILAndscape; TerrainMinX,  TerrainMinZ ,  TerrainMaxX , TerrainMaxZ:integer );Cdecl external 'Core3D.dll';
procedure ExpandeLandscapeDetailTexture(Node:ILAndscape; TerrainMinX,  TerrainMinZ ,  TerrainMaxX , TerrainMaxZ:integer );Cdecl external 'Core3D.dll';



//TERRAIN GEO MIP MAP
function   LoadTerrain (heightmap:pchar;smoothing : integer = 4; maxLOD : integer = 5;patchSize :ITERRAINLODPATCHSIZE=ETPS_17) : IterrainLod;Cdecl external 'Core3D.dll';
function CloneGeoTerrain(terrain : IterrainLod): IterrainLod;Cdecl external 'Core3D.dll';
procedure  ScaleGeoTexture  ( terrain : IterrainLod; layer1,layer2:single);Cdecl external 'Core3D.dll';
Function   TerrainGeoHeight  ( terrain : IterrainLod; x,z:single):single;Cdecl external 'Core3D.dll';
procedure SaveTerrainGeoMipHeight(terrain : IterrainLod;w,h:integer; fname:pchar);Cdecl external 'Core3D.dll';

//TERRAIN QUAD
function  CreateTerrain(filename:pchar;scale:single;numQuads,  numFaces, sizeTerrain:integer):IQuadLand;Cdecl external 'Core3D.dll';
procedure MaterialTextureTerrain(terrain:IQuadLand;texture:ITexture;Layer:integer);Cdecl external 'Core3D.dll';
procedure MaterialFlagTerrain(terrain:IQuadLand;Flag:integer; newvalue:boolean);Cdecl external 'Core3D.dll';
procedure FreeTerrain(terrain:IQuadLand);Cdecl external 'Core3D.dll';
function  TerrainHeight(terrain:IQuadLand;x,z:single):single;Cdecl external 'Core3D.dll';
function  PickTerrain(terrain:IQuadLand;x,y:integer;DistBase:integer=10000):boolean;Cdecl external 'Core3D.dll';
procedure TerrainPickedPosition(terrain:IQuadLand;var pos:vector3d);Cdecl external 'Core3D.dll';
procedure TerrainPickedNormal(terrain:IQuadLand;var nor:vector3d);Cdecl external 'Core3D.dll';
procedure TerrainPickedtriangle(terrain:IQuadLand;var pos:triangle3d);Cdecl external 'Core3D.dll';
procedure HeightTerrain(terrain:IQuadLand;x,z:integer;newhight:single);Cdecl external 'Core3D.dll';


function CreateTerrainTile(
								 img:pchar;

								   dataX, dataY:integer;
								   smoothing:integer;
								   maxLOD:integer;
								  patchSize:ITERRAINLODPATCHSIZE) : IterrainLod;Cdecl external 'Core3D.dll';
procedure SetTerrainTileColor(terrain:IterrainLod; fname:pchar; dataX, dataY:integer );Cdecl external 'Core3D.dll';
procedure ScaleTerrainTileTexture(terrain:IterrainLod;  dataX, dataY:single);Cdecl external 'Core3D.dll';
procedure AttachTerrainTile ( terrain,  neighbour:IterrainLod;edge:integer );Cdecl external 'Core3D.dll';


//BILLBORADS

Function LoadSprite ( fileName:pchar):ISprite;Cdecl external 'Core3D.dll';
procedure ScaleSprite( sprite:ISPRITE;x,y:single);Cdecl external 'Core3D.dll';
procedure SpriteColor ( sprite:ISPRITE; red ,green  ,blue :integer);Cdecl external 'Core3D.dll';


function   CreateBillBoardGroup(  sizex,  sizey:single ):INode;Cdecl external 'Core3D.dll';
procedure  AddBillBoardToGroup( billgroup:INode; sizex,  sizey, x,  y,  z,  roll:single; color:dword);Cdecl external 'Core3D.dll';
procedure  AddBillBoardByAxisToGroup(billgroup:INode;sizex,  sizey,x,  y,  z,roll:single;color:dword;axis_x,  axis_y,  axis_z:single );Cdecl external 'Core3D.dll';
procedure  BillBoardGroupShadows( billgroup:INode; x, y,  z, intensity, ambient:single );Cdecl external 'Core3D.dll';
function   BillBoardGroupCount(billgroup:INode):integer;Cdecl external 'Core3D.dll';
procedure  BillBoardForceUpdate(billgroup:INode);Cdecl external 'Core3D.dll';

//SIMPLEBILLBOARD
function   CreateTextBillboard( font:IFont;text:pchar;sizex,sizey:single;colorTop,colorBottom:dword):ISprite;Cdecl external 'Core3D.dll';
function   CreateBillboard(sizex,sizey:single):ISprite;Cdecl external 'Core3D.dll';
procedure  ColorBillboard(bill:ISprite; colorTop, colorBottom:dword);Cdecl external 'Core3D.dll';
procedure  ColorTextBillboard(bill:ISprite; color:dword);Cdecl external 'Core3D.dll';
procedure  TextBillboard(bill:ISprite;txt:pchar);Cdecl external 'Core3D.dll';
procedure  ResizeBillboard(bill:ISprite;w,h:single);Cdecl external 'Core3D.dll';

//ZONEMANAGER
function   CreateZoneManager(  initialNearDistance,  initialFarDistance:single ):IZone;Cdecl external 'Core3D.dll';
procedure  ZoneManagerProperties(zone:IZone;newNearDistance,newFarDistance:single;accumulateChildBoxes:boolean );Cdecl external 'Core3D.dll';
procedure  ZoneManagerBoundingBox(Zone:IZone;x,y,z,w,h,d:single);Cdecl external 'Core3D.dll';
procedure  AddChildToZoneManager(Zone:IZone;child:INode);Cdecl external 'Core3D.dll';
procedure AddTerrainToZoneManager(Zone:Izone;terrainTileSource:IterrainLod;
											 structureMap,
											 colorMap,
											 detailMap:pchar;
										  	x,  y,
										  	sliceSize:integer);Cdecl external 'Core3D.dll';


//LOGMANAGER
function CreateLODManager:ILODNOD;Cdecl external 'Core3D.dll';
procedure  AddMeshToLOD(Lod:ILODNOD;newMesh:IMesh; maxViewDistance:single; BillBoard:boolean);Cdecl external 'Core3D.dll';



//GRASS
function  CreateGrassSystem(patchSize:integer;strength, regularity:single; maxDensity:integer;grassTexture:itexture):INode;Cdecl external 'Core3D.dll';

procedure SetGrassImageCount( grass:INode;x,y:integer);Cdecl external 'Core3D.dll';
function  AddGrass( grass:INode;index:integer;angle,x,y,z,power,w,h:single):integer;Cdecl external 'Core3D.dll';
procedure  BuildGrassNodes( grass:INode;x,y:integer);Cdecl external 'Core3D.dll';

procedure SetGrassDensity( grass:INode; density : Integer;distance : Single);Cdecl external 'Core3D.dll';
procedure SetGrassWind( grass :INode; strength ,regularity : Single);Cdecl external 'Core3D.dll';
function  GetGrassDrawCount( grass :INode):integer;Cdecl external 'Core3D.dll';

//CLOUDS
Function CreateClouds ( texture :ITEXTURE; lod ,depth ,density:integer):INode;Cdecl external 'Core3D.dll';

//LENS FLARE
Function  CreateLensFlareNode( texture :ITEXTURE):INode;Cdecl external 'Core3D.dll';
procedure setLensFlareScale( flare :INode;source ,optics : single);Cdecl external 'Core3D.dll';

//PARTICLES
 Function CreateParticle(): IPARTICLE;Cdecl external 'Core3D.dll';

// emitter functions
 procedure  EmitterDirection  ( emitter : IEMITTER; dx : Single; dy : Single; dz : Single);Cdecl external 'Core3D.dll';
 procedure  EmitterPPS ( emitter : IEMITTER; minpps : Integer; maxpps : integer);Cdecl external 'Core3D.dll';
 procedure  EmitterLife( emitter : IEMITTER;  lifeTimeMin, lifeTimeMax:integer);Cdecl external 'Core3D.dll';
 procedure  EmitterAngle( emitter : IEMITTER;  angle:integer);Cdecl external 'Core3D.dll';
 procedure  EmitterStartColor  ( emitter : IEMITTER;mia, mir , mig , mib ,maa, mar , mag , mab : Integer);Cdecl external 'Core3D.dll';
 procedure  EmitterStartSize  ( emitter : IEMITTER; minx ,miny ,maxx , maxy : single);Cdecl external 'Core3D.dll';
 function   ParticlesEmitter(part:IPARTICLE):IEMITTER;Cdecl external 'Core3D.dll';


 function CreatePointEmitter( Particle : IPARTICLE) : IEMITTER;Cdecl external 'Core3D.dll';


//Box Emitter
 Function   CreateBoxEmitter( Particle : IPARTICLE) : IEMITTER;Cdecl external 'Core3D.dll';
 procedure  BoxEmitterSize( emitter : IEMITTER; sx : single; sy : single; sz : Single);Cdecl external 'Core3D.dll';
 procedure  BoxEmitterSizeEx( emitter : IEMITTER; minx,miny,miz,maxx,maxy,maxz: Single);Cdecl external 'Core3D.dll';

//Cylinder Emitter
 Function   CreateCylinderEmitter( Particle : IPARTICLE) : IEMITTER;Cdecl external 'Core3D.dll';
 procedure  CylinderEmitterCenter( emitter : IEMITTER; x : Single; y : single; z : single);Cdecl external 'Core3D.dll';
 procedure  CylinderEmitterRadius( emitter : IEMITTER; radius : single);Cdecl external 'Core3D.dll';
 procedure  CylinderEmitterLength( emitter : IEMITTER; length : Single);Cdecl external 'Core3D.dll';

//Mesh Emitter
 Function   CreateMeshEmitter( Particles : IPARTICLE; minv : Integer; maxv : Integer) : IEMITTER;Cdecl external 'Core3D.dll';
 procedure  MeshEmitterMesh( emitter : IEMITTER; Mesh : IMESH);Cdecl external 'Core3D.dll';
 procedure  MeshEmitterEveryVertex  ( emitter : IEMITTER; EveryMeshVertex : boolean);Cdecl external 'Core3D.dll';

//Ring Emitter
 Function   CreateRingEmitter( Particle : IPARTICLE; Min : Integer; Max : Integer) : IEMITTER;Cdecl external 'Core3D.dll';
 procedure  RingEmitterCenter( emitter : IEMITTER; X : Single; Y : Single; Z : Single);Cdecl external 'Core3D.dll';
 procedure  RingEmitterRadius( emitter : IEMITTER; Radius : Single);Cdecl external 'Core3D.dll';
 procedure  RingEmitterThickness( emitter : IEMITTER; Thickness : Single);Cdecl external 'Core3D.dll';

//PARTICLRES AFECT

procedure  SplineParticle( Particle : IPARTICLE;vectorspoints:pointer;countpoints:integer;speed:single = 1.0;tightness:single = 0.5;attraction:single = 1.0;deleteAtFinalPoint :boolean= false  );Cdecl external 'Core3D.dll';
procedure  ParticleScale( Particle : IPARTICLE; sx : single; sy : Single);Cdecl external 'Core3D.dll';
procedure  ParticleGravity( Particle : IPARTICLE; gx : Single; gy : Single; gz : Single);Cdecl external 'Core3D.dll';
procedure  ParticleDeletor( Particle : IPARTICLE; timeForceLost:integer);Cdecl external 'Core3D.dll';
procedure  ParticleFadeOut(Particle : IPARTICLE;targetColor:integer;timeNeededToFadeOut:integer);Cdecl external 'Core3D.dll';
procedure  ParticleAttraction(Particle : IPARTICLE;pointx,pointy,pointz,speed:single;attract:boolean; affectX,  affectY,  affectZ:booleAN );Cdecl external 'Core3D.dll';
PROCEDURE  ParticleRotation(Particle : IPARTICLE;spx,spy,spz,px,py,pz:single);Cdecl external 'Core3D.dll';
procedure  ParticleColide(Particle : IPARTICLE;selector:ITriangleSelector; bounce:single = 1.0);Cdecl external 'Core3D.dll';
procedure  ParticleRandomDir(Particle : IPARTICLE;scope:single;changeFrequency:integer);Cdecl external 'Core3D.dll';
procedure  ParticleColors(Particle : IPARTICLE;arrayOfcolorsOfDword:pointer;countarrays:integer;times:pointer; smoth:boolean);Cdecl external 'Core3D.dll';






 ////ANIMATORS



procedure  AddAnimator(Node:INode;anim:IAnimator;drop:boolean=true);Cdecl external 'Core3D.dll';
procedure  RemoveAnimator(Node:INode;anim:IAnimator);Cdecl external 'Core3D.dll';
procedure  DropAnimator( anim:IAnimator);Cdecl external 'Core3D.dll';
procedure  RemoveAnimators(Node:INode);Cdecl external 'Core3D.dll';




function CreateTextureAnimator( arrayOftextures:ITexture;count:integer; timePerFrame:integer;loop:boolean):IAnimator;Cdecl external 'Core3D.dll';
function CreateFollowCameraAnimator(center:vector3d):IAnimator;Cdecl external 'Core3D.dll';
function CreateRotationAnimator(rotationPerSecond:vector3d):IAnimator;Cdecl external 'Core3D.dll';
function CreateFlyCircleAnimator(center,direction:vector3d;radius, speed:single):IAnimator;Cdecl external 'Core3D.dll';
function CreateFlyStraightAnimator(startPoint,endPoint:vector3d; timeForWay:integer; loop:boolean):IAnimator;Cdecl external 'Core3D.dll';
function CreateDeleteAnimator(time:integer):IAnimator;Cdecl external 'Core3D.dll';
function CreateFollowSplineAnimator(NumPoints:integer;Vects:pointer;time:integer; speed,  tightness:single ):IAnimator;Cdecl external 'Core3D.dll';
function CreateCollisionResponseAnimator(world:ITriangleSelector;Movable:INode;
          SX : Single=3; SY : Single=3; SZ : Single=3;
          GX : SINGLE=0; GY : SINGLE=-9; GZ : SINGLE=0;
          OFFX : SINGLE=0; OFFY : SINGLE=0.6; OFFZ : SINGLE=0;
          slidingvalue:single=0.05):IAnimator;Cdecl external 'Core3D.dll';


procedure   FireNodeLikeMissile(Node:INode;raystart,rayend:vector3d;speed:single; KillNode:boolean);Cdecl external 'Core3D.dll';
procedure   FireNodeLikeBolt(Node:INode;speed:single; KillNode:boolean);Cdecl external 'Core3D.dll';




//Sky
Function CreateSkyDome( texture : ITEXTURE; radius : Single) : INode;Cdecl external 'Core3D.dll';
Function CreateSkyBox ( tp : ITEXTURE; bt : ITEXTURE; lf : ITEXTURE; rg : ITEXTURE; ft : ITEXTURE; bk : ITEXTURE) : INode;Cdecl external 'Core3D.dll';


//ARRAY
function  CreateArray:void;Cdecl external 'Core3D.dll';
procedure FreeArray(arr:void);Cdecl external 'Core3D.dll';
procedure PushbackArray(arr:void;el:pointer);Cdecl external 'Core3D.dll';
procedure PushfrontArray(arr:void;el:pointer);Cdecl external 'Core3D.dll';
function  ArrayElement( arr:void;index:integer):pointer;Cdecl external 'Core3D.dll';
function  ArraySize( arr:void):integer;Cdecl external 'Core3D.dll';




//steryngbe

procedure InitSteer;Cdecl external 'Core3D.dll';
procedure FreeSteer;Cdecl external 'Core3D.dll';

function CreateSteerPath( pointCount:integer;Vects:pointer;radius:single;cyclic:boolean;debug:boolean):ItseerPath;Cdecl external 'Core3D.dll';
procedure FreeSteerPath(path:ItseerPath);Cdecl external 'Core3D.dll';
procedure ApplyFollowPath(sv:ISteer;path:ItseerPath;const  direction:integer;const  predictionTime:single;dt:single; stayonpath:boolean);Cdecl external 'Core3D.dll';


procedure AvoidSteerNeighbors(steer:ISteer;const  minTimeToCollision:single; dt:single);Cdecl external 'Core3D.dll';
procedure AvoidSteerNeighborsEx(steer:ISteer;const  minTimeToCollision:single; rad, force, dt:single);Cdecl external 'Core3D.dll';
procedure AvoidSteerObstacles(Node:ISteer;const  minTimeToCollision:single; dt:single);Cdecl external 'Core3D.dll';
procedure AvoidSteerObstacle(Node:ISteer;Objtacle:IObstacle;const  minTimeToCollision:single; dt:single);Cdecl external 'Core3D.dll';
procedure AvoidSteerAi(Node:ISteer;v:vector3d;ai:integer;dt:single);Cdecl external 'Core3D.dll';

function   CreateSteerNode:ISteer;Cdecl external 'Core3D.dll';
procedure  SetSteerMass(Node:ISteer;mass:single)             ;Cdecl external 'Core3D.dll';
procedure  SetSteerSpeed(Node:ISteer;speed:single);Cdecl external 'Core3D.dll';
procedure  SetSteerRadius(Node:ISteer;r:single);Cdecl external 'Core3D.dll';
procedure  SetSteerMaxForce(Node:ISteer;v:single);Cdecl external 'Core3D.dll';
procedure  SetSteerMaxSpeed(Node:ISteer;v:single);Cdecl external 'Core3D.dll';

procedure RegenerateSpeed(Node:ISteer;dt:single);Cdecl external 'Core3D.dll';

procedure  ApplySteerForce(Node:ISteer;force:vector3d;dt:single);Cdecl external 'Core3D.dll';
procedure  ApplySteerBrakingForce(Node:ISteer;force:single;dt:single);Cdecl external 'Core3D.dll';
procedure  ApplySteerSeek(Node:ISteer;force:vector3d;dt:single);Cdecl external 'Core3D.dll';
procedure  ApplySteerFlee(Node:ISteer;force:vector3d;dt:single);Cdecl external 'Core3D.dll';
procedure  ApplySteerWander(Node:ISteer;dt:single);Cdecl external 'Core3D.dll';


procedure ApplySteerOnNode(steer:ISteer;node:Inode);Cdecl external 'Core3D.dll';

function GetSteerWander(Node:ISteer;dt:single):vector3d;Cdecl external 'Core3D.dll';
function GetSteerSeek(Node:ISteer; v:vector3d):vector3d;Cdecl external 'Core3D.dll';
function GetSteerFlee(Node:ISteer; v:vector3d):vector3d;Cdecl external 'Core3D.dll';
function GetAvoidSteerNeighbors(steer:Inode;const  minTimeToCollision:single):vector3d;Cdecl external 'Core3D.dll';

procedure SetSteerPosition(Node:ISteer;p:vector3d);Cdecl external 'Core3D.dll';
procedure SetSteerRotation(Node:ISteer;p:vector3d);Cdecl external 'Core3D.dll';
procedure SetSteerPositionEx(Node:ISteer;x,y,z:single);Cdecl external 'Core3D.dll';
procedure SetSteerRotationEx(Node:ISteer;x,y,z:single);Cdecl external 'Core3D.dll';
function  GetSteerPosition(Node:ISteer):vector3d;Cdecl external 'Core3D.dll';
function  GetSteerRotation(Node:ISteer):vector3d;Cdecl external 'Core3D.dll';


function AddObstacle( posx, posy, posz, radius:single):IObstacle;Cdecl external 'Core3D.dll';
procedure SetObstacle(obj:IObstacle;posx, posy, posz, radius:single);Cdecl external 'Core3D.dll';

procedure RemoveSteerObstacle(obj:IObstacle);Cdecl external 'Core3D.dll';
procedure AddSteerObstacle(obj:IObstacle);Cdecl external 'Core3D.dll';


//MATHS

 Function WrapValue ( newvalue : Single; oldvalue : Single; increment : Single) : Single;Cdecl external 'Core3D.dll';
 Function CurveValue  ( newvalue : Single; oldvalue : Single; increment : Single) : Single;Cdecl external 'Core3D.dll';
 Function Distance2D ( x1 : Single; y1 : Single; x2 : Single; y2 : Single) : Single;Cdecl external 'Core3D.dll';
 Function Distance3D  ( x1 : Single; y1 : Single; z1 : Single; x2 : Single; y2 : Single; z2 : Single) : Single;Cdecl external 'Core3D.dll';
 Function Min  ( value1 : Single; value2 : Single) : Single;Cdecl external 'Core3D.dll';
 Function Max ( value1 : Single; value2 : Single) : Single;Cdecl external 'Core3D.dll';
 Function Rand ( value1 : Integer; value2 : Integer) : Integer;Cdecl external 'Core3D.dll';
function CurveValuei(Destination , Current , Speed:single):single;Cdecl external 'Core3D.dll';
function CurveAngle(Destination , Current , Speed:single):single;Cdecl external 'Core3D.dll';
function WrapAngle(da:single):single;Cdecl external 'Core3D.dll';
function NewXValue(CurrentValue, Angle , Step:single):single;Cdecl external 'Core3D.dll';
function NewZValue(CurrentValue, Angle , Step:single):single;Cdecl external 'Core3D.dll';
function NewYValue(CurrentValue, Angle , Step:single):single;Cdecl external 'Core3D.dll';


function vectorMul(v1,v2:vector3d):vector3d;
function vectorMulx(vect:vector3d;v:single):vector3d;




function getColor(r,g,b:integer;a:integer=255):dword;Cdecl external 'Core3D.dll';

procedure CreateGround;

function DegToRad(const Degrees: single): single;
function RadToDeg(const Radians: single): single;


Function StoF(str : String):Single;
Function StoI(s:String):Integer;
Function FtoS(f:single):String;
Function IntToStr(n : Integer):String;


procedure chasecam(Cam:ICAMERA;Node:INode;speed:single);

function COLOR_ARGB(a,r,g,b: single): integer;

function RandomI( lo, hi : integer ) : integer;

function RandomS( lo, hi : Single ) : Single;

function vector(x,y,z:single):vector3d;
var
 deltaTime:single;
implementation
var
yAng:single;


function makeVextex(x,y,z:single;nx,ny,nz:single;u,v:single;color:dword):S3DVertex;
begin
result.Pos:=vector(x,y,z);
result.Normal:=vector(nx,ny,nz);
result.TCoords.x:=u;
result.TCoords.y:=v;
result.Color:=color;
end;

function RandomS( lo, hi : Single ) : Single;
begin
  result := ( random * ( hi - lo ) + lo );
end;
function RandomI( lo, hi : integer ) : integer;
begin
  result := ( random  ( hi - lo ) + lo );
end;

function COLOR_ARGB(a,r,g,b: single): integer;
begin
Result :=
    (round(a * 255) shl 24) or
    (round(r * 255) shl 16) or
    (round(g * 255) shl 8) or
    (round(b * 255));
end;

function vector(x,y,z:single):vector3d;
begin
result.x:=x;
result.y:=y;
result.z:=z;
end;


procedure chasecam(Cam:ICAMERA;Node:INode;speed:single);

var
   yCamPos,xCamPos,zCamPos,xPos,yPos,zPos:single;
   camDist,
   camHeight:single;
   position:vector3d;

begin
  yAng:=CurveAngle(NodeYaw(node)+180,yang,20);
//  yAng:=WrapAngle(NodeYaw(meshcarro)+180);

   position:=NodePosition(node);

   xPos:=position.x;
   yPos:=position.y;
   zPos:=position.z;


   camDist:=50;
   camHeight:=yPos+20;


   xCamPos:=newxvalue(xPos,yAng,camDist);
   zCamPos:=newzvalue(zPos,yAng,camDist);
   yCamPos:=camHeight;


 CameraTarget(cam,xPos,yPos,zPos);
 PositionNode(cam,xCamPos,yCamPos,zCamPos);


 // Text(10,80 ,pchar('angles:'+ftos(NodeYaw(meshcarro)+180)));
 // Text(10,100,pchar('wangle:'+ftos(yAng)));


end;

function DegToRad(const Degrees: single): single;
begin
  Result := Degrees * (PI / 180);
end;

function RadToDeg(const Radians: single): single;
begin
  Result := Radians * (180 / PI);
end;

procedure CreateGround;
var
mesh:IMesh;
texture01,texture02,texture03,texture04,texture05 : ITEXTURE;
begin

	texture01 := LoadTexture('media/mur_Ambiant.jpg');
	texture02 := LoadTexture('media/Brick.jpg');
	texture03 := LoadTexture('media/wall1.jpg');
//	texture04 := LoadTexture('media/tiles.jpg');
	texture04 := LoadTexture('media/wall.jpg');
	texture05 := LoadTexture('media/Wood.jpg');


  	mesh := CreateMeshCube();
    NodeFlag(mesh,MF_LIGHTING,true);
		ScaleNode(mesh,512,20,1);
		PositionNode(mesh,0,10,256);
		NodeTexture(mesh,texture05,0);
  //  EnableNodeShadow(mesh);

  	mesh := CreateMeshCube();
        NodeFlag(mesh,MF_LIGHTING,true);
		ScaleNode(mesh,1,20,512);
		PositionNode(mesh,256,10,0);
		NodeTexture(mesh,texture05,0);
   //     EnableNodeShadow(mesh);

   	mesh := CreateMeshCube();
        NodeFlag(mesh,MF_LIGHTING,true);
		ScaleNode(mesh,512,20,1);
		PositionNode(mesh,0,10,-256);
		NodeTexture(mesh,texture05,0);
   //     EnableNodeShadow(mesh);

 	 mesh := CreateMeshCube();
       NodeFlag(mesh,MF_LIGHTING,true);
		ScaleNode(mesh,1,20,512);
		PositionNode(mesh,-256,10,0);
		NodeTexture(mesh,texture05,0);
    //    EnableNodeShadow(mesh);

  	mesh := CreateMeshPlane(64,8);
 	// mesh := CreateMeshCube();
        NodeFlag(mesh,MF_LIGHTING,true);
		NodeTexture(mesh,texture04,0);
      //  EnableNodeShadow(mesh);

End;


function vectorMul(v1,v2:vector3d):vector3d;
begin
result.x:=v1.x*v2.x;
result.y:=v1.y*v2.y;
result.z:=v1.z*v2.z;

end;
function vectorMulx(vect:vector3d;v:single):vector3d;
begin
result.x:=vect.x*v;
result.y:=vect.y*v;
result.z:=vect.z*v;

end;



Function DoThouthens(n:Integer):Integer;
Var
  i:Integer;
Begin
  Result := 1;
  For i := 0 To n-1 Do
    Result := Result * 10;
End;


Function StoI(s:String):Integer;
Var
  e:Integer;
Begin
  Val(s, Result, e);
End;

Function StoF(str : String):Single;
Var
  f,p:String;
  fi,ps:Integer;
Begin
  If pos('.', str)<>0 Then
  Begin
    f := Copy(str, 1, pos('.', str)-1);
    delete(str, 1, pos('.', str));
    p := str;
    fi := StoI(f);
    ps := StoI(p);
    Result := fi + ps/DoThouthens(length(p));
  End Else
    Result := StoI(str);

End;
Function FtoS(f:single):String;
Begin
  Str(f:4:3, Result);
End;

Function IntToStr(n : Integer):String;
Begin
  Str(n, Result);
End;


var
  Saved8087CW: Word;

const
  Default8087CW = $1332;



initialization
begin
  Saved8087CW := Default8087CW;
  Set8087CW($133f);



end;
finalization
begin
  Set8087CW(Saved8087CW);
end;  

end.
