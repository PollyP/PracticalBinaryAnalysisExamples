# PracticalBinaryAnalysisExamples

This repo contains modified sample code and solutions from _Practical Binary Analysis: Build Your Own Linux Tools for Binary Instrumentation, Analysis and Disassembly_ by Dennis Andriesse. The book's website, which contains the original sample code, is here: https://practicalbinaryanalysis.com/. You can also find links to purchase the (imho excellent) book there.

This repo contains sample pintool code from the book that I got running on Windows. To compile and run this code, you'll need a working Intel pin dev environment; see https://gist.github.com/PollyP/e50959ab97b15c83d4506dcf38753ef5.

Once you'd done this, copy this folder into <your pin root>\source\tools and cd into it. For the unpacker example, you will need to get upx Windows binaries from https://github.com/upx and then edit the makefile to point to the upx binaries. You will also want to edit the makefile to point to the binaries you want to get packed. Then open a 32 bit or 64 bit VS command window with cygwin on its path and make the pintools.
  
Hint for those who want symbols: the pintools DLLs support a -symbol_path option that you can point at pdb files to get symbols.
