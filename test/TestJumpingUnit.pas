unit TestJumpingUnit;

interface
uses
  DUnitX.TestFramework, classes, SysUtils , uJumpingGame;

type

  [TestFixture]
  TestJumping = class(TObject)
  strict private
    aTJumping : TJumping;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('Test Array Lenth 1','''0'';false',';')]
    [TestCase('Test Array Lenth 2','0,1;True',';')]
    [TestCase('Test Array Lenth 3','0,1,0;True',';')]
    [TestCase('Test Array Lenth 10','0,1,0,0,0,0,0,0,0,0;True',';')]
    [TestCase('Test Array Lenth 100','0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;True',';')]
    [TestCase('Test Array Lenth 101','0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;False',';')]
    procedure TestArrayLength(sArray:String; _result:boolean);

    [TestCase('Test First Element Is 0','0,0;True',';')]
    [TestCase('Test First Element Is 0','1,0;False',';')]
    procedure TestFirstElementIs0(sArray:String; _result:boolean);
  end;

implementation

procedure TestJumping.Setup;
begin
  aTJumping := TJumping.Create;
end;

procedure TestJumping.TearDown;
begin
  aTJumping := nil;
end;

procedure TestJumping.TestArrayLength(sArray:String; _result:boolean);
var r: boolean;
begin
  r := aTJumping.Jump(0, sArray);
  Assert.AreEqual(_result, r);
end;

procedure TestJumping.TestFirstElementIs0(sArray:String; _result:boolean);
var r: boolean;
begin
  r := aTJumping.Jump(0, sArray);
  Assert.AreEqual(_result, r);
end;


initialization
  TDUnitX.RegisterTestFixture(TestJumping);
end.
