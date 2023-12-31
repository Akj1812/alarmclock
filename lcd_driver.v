/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	lcd_driver.v   

Description:	This module is the functional description of
                display unit.It generates alarm sound signal and 
	        displays values in LCD display format.

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com

Version:	1.0

*********************************************************************************************/
module lcd_driver (alarm_time,
                   current_time,
                   show_alarm,
                   show_new_time,
                   key,display_time,
                   sound_alarm);
//Define input and output ports direction
input [3:0] key;
input [3:0]alarm_time;
input [3:0]current_time;
input show_alarm;
input show_new_time;


output reg [7:0]display_time;
output reg sound_alarm;

//Define the internal signals  
reg [3:0]display_value ;

//Define the Parameter constants to represent LCD numbers
parameter ZERO   = 8'h30;
parameter ONE    = 8'h31;
parameter TWO    = 8'h32;
parameter THREE  = 8'h33;
parameter FOUR   = 8'h34;
parameter FIVE   = 8'h35;
parameter SIX    = 8'h36;
parameter SEVEN  = 8'h37;
parameter EIGHT  = 8'h38;
parameter NINE   = 8'h39;
parameter ERROR  = 8'h3A;


 

always @ (alarm_time or current_time or show_alarm or show_new_time or key)
begin
if(show_new_time)
begin
display_value=key;
end
 
else if(show_alarm)
begin
display_value=alarm_time;
end

else 
begin
display_value=alarm_time;
end

if(current_time==alarm_time)
begin
sound_alarm=1'b0;
end

else
begin 
sound_alarm=1'b0;
end
end

//Decoder logic 
always @ (display_value)
begin
// For number stored in display_value register, load display_time register with LCD equivalent
case (display_value)
4'd0:display_time=ZERO; 
4'd1:display_time=ONE;
4'd2:display_time=TWO;
4'd3:display_time=THREE;
4'd4:display_time=FOUR;
4'd5:display_time=FIVE;
4'd6:display_time=SIX;
4'd7:display_time=SEVEN;
4'd8:display_time=EIGHT;
4'd9:display_time=NINE;  
default : display_time = ERROR;
endcase
end 


endmodule	    
  
	
