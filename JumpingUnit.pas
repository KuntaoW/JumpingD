unit JumpingUnit;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes ;

type


  TJumping = Class
    public
      function Jump(iJumpStep: integer; aArrayofElement:String):Boolean;
  End;

implementation




function TJumping.Jump(iJumpStep: integer; aArrayofElement:String):Boolean;
var r: boolean;
    slArray : TStringList;
begin
  slArray := TStringList.Create;

  slArray.Delimiter := ',';
  slArray.StrictDelimiter := True;
  slArray.DelimitedText := aArrayofElement;
  r :=(slArray.count>=2) and (slArray.count<=100);

  result := r;
end;


///************ end of class TJumping ***************///

end.
