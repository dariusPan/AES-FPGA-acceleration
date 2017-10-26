@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 1d943aaa963843629697b439f7da7e6a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot test_top_behav xil_defaultlib.test_top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
