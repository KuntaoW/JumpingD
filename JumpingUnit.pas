unit JumpingUnit;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes ;

type


  TJumping = Class
    private
      FListofString : TStringList;
      FJumpings : integer;
      procedure split(sDelim: Char; sSplitStr: String; ListofString :TStrings);
    protected
      function JumpingForward(aIndex:integer; aForward:Boolean):boolean;
      procedure Init(aJumpSteps: Integer; aArrayofElement:String);
    public
      function VerifyInput(iJumpStep: integer; aArrayofElement:String):boolean;
      function Jump(iJumpStep: integer; aArrayofElement:String):Boolean;
  End;

implementation

procedure TJumping.Init(aJumpSteps: Integer; aArrayofElement:string);
begin
  FJumpings := aJumpSteps;
  FListofString := TStringList.Create;
  split(',',aArrayofElement,FListofString);
end;

procedure TJumping.split(sDelim: Char; sSplitStr: String; ListofString :TStrings);
begin
  ListofString.Clear;
  ListofString.Delimiter := sDelim;
  ListofString.StrictDelimiter := True;
  ListofString.DelimitedText := sSplitStr;
end;

function TJumping.VerifyInput(iJumpStep: integer; aArrayofElement:String):boolean;
var errMsg : string;
begin
  Init(iJumpStep,aArrayofElement);
  result := true;
  errMsg := '';
  if not ((FListofString.count>=2) and (FListofString.count<=100)) then
    errMsg := 'array length should between 2 and 100';

  if FListofString[0] <> '0' then
    errMsg := 'The first integer in each array is always 0';

  if not ((FJumpings>=0) and (FJumpings<=100)) then
    errMsg := 'Jumpings should between 0 and 100';
  result := (errMsg = '')
end;

function TJumping.Jump(iJumpStep: integer; aArrayofElement:String):Boolean;
var errMsg : string;
begin
  VerifyInput(iJumpStep,aArrayofElement);

  result := JumpingForward(0,True);
end;

function TJumping.JumpingForward(aIndex:integer; aForward:Boolean):boolean;
var
  iIndex : integer;
begin
  result := false;

  iIndex := 0;

  if (aIndex+FJumpings)>= FListofString.count then
   begin
     result := True;
     exit;
   end;

  //jump forward
  if (result=false) then
  begin
    iIndex := aIndex+FJumpings;
    if FListofString[iIndex]='0' then
    begin
      if JumpingForward(iIndex,aForward) then
      begin
        result := true;
        exit;
      end;
    end;
  end;

  //move forward
  if (result=false) and (aForward) then
  begin
    //foward: Index  + 1
    iIndex := aIndex + 1;
    if FListofString[iIndex]='0' then
    begin
      if JumpingForward(iIndex,aForward) then
      begin
        result := true;
        exit;
      end
      else  aForward := false;
    end
    else
      aForward := false;
  end;
  //move backward
  if (result=false) and (not aForward) then
  begin
    //backward: index - 1
    iIndex := aIndex - 1;
    if (iIndex <= 0) then exit;
    if FListofString[iIndex]='0' then
    begin
      if JumpingForward(iIndex,aForward) then
      begin
        result := true;
        exit;
      end;
    end;
  end;


end;


///************ end of class TJumping ***************///

end.
