

// type: Vdd
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadVddH (iovdd, iovss, vdd, vss);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
endmodule
`endcelldefine

// type: Vdd
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadVddV (iovdd, iovss, vdd, vss);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
endmodule
`endcelldefine

// type: Vss
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadVssH (iovdd, iovss, vdd, vss);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
endmodule
`endcelldefine

// type: Vss
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadVssV (iovdd, iovss, vdd, vss);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
endmodule
`endcelldefine

// type: Vdd
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadVdd2 (iovdd, iovss, vdd, vss, vdd2);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
	inout vdd2;
endmodule
`endcelldefine


// type: Input
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadInH (iovdd, iovss, vdd, vss, pad, p2c);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
	inout pad;
	output p2c;

	// Function
	assign p2c = pad;

	// Timing
	specify
		(pad => p2c) = 0;
	endspecify
endmodule
`endcelldefine

// type: Input
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadInV (iovdd, iovss, vdd, vss, pad, p2c);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
	inout pad;
	output p2c;

	// Function
	assign p2c = pad;

	// Timing
	specify
		(pad => p2c) = 0;
	endspecify
endmodule
`endcelldefine


// type: Output30mA
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadOut30mAH (iovdd, iovss, vdd, vss, pad, c2p);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
	inout pad;
	input c2p;

	// Function
	assign pad = c2p;

	// Timing
	specify
		(c2p => pad) = 0;
	endspecify
endmodule
`endcelldefine

// type: Output30mA
`timescale 1ns/10ps
`celldefine
module sg13g2_IOPadOut30mAV (iovdd, iovss, vdd, vss, pad, c2p);
	inout iovdd;
	inout iovss;
	inout vdd;
	inout vss;
	inout pad;
	input c2p;

	// Function
	assign pad = c2p;

	// Timing
	specify
		(c2p => pad) = 0;
	endspecify
endmodule
`endcelldefine
