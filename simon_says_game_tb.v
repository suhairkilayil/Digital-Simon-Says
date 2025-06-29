`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 21:09:28
// Design Name: 
// Module Name: simon_says_game_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module simon_says_game_tb;

    reg clk;
    reg rst;
    reg [1:0] P1_input;
    reg [1:0] P2_input;

    wire [1:0] random_dir;
    wire [2:0] P1_score;
    wire [2:0] P2_score;
    wire [1:0] led_dir;
    wire game_over;
    wire [1:0] winner;

    // Instantiate the Unit Under Test (UUT)
    simon_says_game uut (
        .clk(clk),
        .rst(rst),
        .P1_input(P1_input),
        .P2_input(P2_input),
        .random_dir(random_dir),
        .P1_score(P1_score),
        .P2_score(P2_score),
        .led_dir(led_dir),
        .game_over(game_over),
        .winner(winner)
    );

    // Generate 100 MHz Clock → 10 ns period
    always #5 clk = ~clk;

    // Simulation control
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        P1_input = 2'b00;
        P2_input = 2'b00;

        // Hold reset for a few clock cycles
        #20;
        rst = 0;

        // Let the game run
        repeat (1000) begin  // loop for ~10,000 cycles (enough to see score changes)
            @(posedge clk);

            // After every few cycles, update inputs
            if ($random % 8 == 0) begin
                P1_input = $random % 4;  // random value 0-3
                P2_input = $random % 4;
            end else begin
                P1_input = 2'b00;
                P2_input = 2'b00;
            end

            // Stop if game is over
            if (game_over) begin
                $display("GAME OVER at time %t", $time);
                $display("P1 Score = %d", P1_score);
                $display("P2 Score = %d", P2_score);
                $display("Winner = %b", winner);
                #100;
                $stop;
            end
        end

        $display("Simulation Timeout");
        $stop;
    end

endmodule



