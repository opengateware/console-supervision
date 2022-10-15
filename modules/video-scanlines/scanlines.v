//------------------------------------------------------------------------------
// SPDX-License-Identifier: GPL-3.0-or-later
// SPDX-FileType: SOURCE
// SPDX-FileCopyrightText: (c) 2022, OpenGateware authors and contributors
//------------------------------------------------------------------------------
//
// Copyright (c) 2022 OpenGateware authors and contributors
// Copyright (c) 2017 Alexey Melnikov <pour.garbage@gmail.com>
// Copyright (c) 2015 Till Harbaum <till@harbaum.org>
// 
// This program is free software: you can redistribute it and/or modify  
// it under the terms of the GNU General Public License as published by  
// the Free Software Foundation, version 3.
//
// This program is distributed in the hope that it will be useful, but 
// WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License 
// along with this program. If not, see <http://www.gnu.org/licenses/>.
//
//------------------------------------------------------------------------------
// Generic Video Scanlines
//------------------------------------------------------------------------------

module scanlines #(
        parameter v2 = 0              //! Enable Scanlines V2
    ) (
        input             iPCLK,      //! Pixel Clock

        input       [1:0] iSCANLINES, //! Scanlines (00-None / 01-25% / 10-50% / 11-75%)
        input      [23:0] iRGB,       //! Core: RGB Video
        input             iHS,        //! Core: Vsync
        input             iVS,        //! Core: Hsync
        input             iDE,        //! Core: Data Enable
        input             iCE,        //! Core: Clock Enable

        output reg [23:0] oRGB,       //! Video Ouput: RGB Video
        output reg        oHS,        //! Video Ouput: Vsync
        output reg        oVS,        //! Video Ouput: Hsync
        output reg        oDE,        //! Video Ouput: Data Enable
        output reg        oCE         //! Video Ouput: Clock Enable
    );

    reg [1:0] rSCANLINE; //! Scanline Register
    always @(posedge iPCLK) begin
        reg rOLD_HS, rOLD_VS;

        rOLD_HS <= iHS; rOLD_VS <= iVS;

        if(rOLD_HS && ~iHS) begin
            if(v2) begin
                rSCANLINE <= rSCANLINE + 1'd1;
                if (rSCANLINE == iSCANLINES)
                    rSCANLINE <= 0;
            end
            else
                rSCANLINE <= rSCANLINE ^ iSCANLINES;
        end
        if(rOLD_VS && ~iVS) rSCANLINE <= 0;
    end

    wire [7:0] r,g,b; //! RGB Signals
    assign {r,g,b} = iRGB;

    reg [23:0] rgb_d; //! RGB Data
    always @(*) begin
        case(rSCANLINE)
            1: //! 25% = 1/2 + 1/4
                rgb_d = {
                    {1'b0, r[7:1]} + {2'b0, r[7:2]},
                    {1'b0, g[7:1]} + {2'b0, g[7:2]},
                    {1'b0, b[7:1]} + {2'b0, b[7:2]}
                };
            2:  //! 50% = 1/2
                rgb_d = {
                    {1'b0, r[7:1]},
                    {1'b0, g[7:1]},
                    {1'b0, b[7:1]}
                };
            3: //! 75% = 1/4
                rgb_d = {
                    {2'b0, r[7:2]},
                    {2'b0, g[7:2]},
                    {2'b0, b[7:2]}
                };
            default:
                rgb_d = {r, g, b};
        endcase
    end

    always @(posedge iPCLK) begin
        reg [23:0] rgb1, rgb2;
        reg        de1,  de2;
        reg        vs1,  vs2;
        reg        hs1,  hs2;
        reg        ce1,  ce2;

        oRGB <= rgb2; rgb2 <= rgb1; rgb1 <= rgb_d;
        oVS  <= vs2;  vs2  <= vs1;  vs1  <= iVS;
        oHS  <= hs2;  hs2  <= hs1;  hs1  <= iHS;
        oDE  <= de2;  de2  <= de1;  de1  <= iDE;
        oCE  <= ce2;  ce2  <= ce1;  ce1  <= iCE;
    end

endmodule
