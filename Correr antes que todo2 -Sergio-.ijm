open("C:/Users/sdj2r/OneDrive/Escritorio/FIJI WEKA 12-2019/Calibraciones/step-tablet.tif");
run("Calibrate...", "open=[C:/Users/sdj2r/OneDrive/Escritorio/FIJI WEKA 12-2019/Calibraciones/calibration GHA.txt] function=Rodbard unit=O.D. text1=[252.12 224.49 224.08 225.3 225.48 191.81 154.15 126.02 100.92 79.56 62.1 48.29 37.08 29.08 22.96 17.87 13.99 10.9 8.48 6.92 ] text2=[0.0 2.0 4.0 8.0 16.0 32.0 64.0 128.0 256.0 512.0 1024.0 2048.0 4096.0 8192.0 16384.0 32768.0 65536.0 131072.0 262144.0 524288.0 ] global show");
run("Set Scale...", "distance=4.9696 known=1 pixel=1 unit=micron global");
close();
selectWindow("step-tablet.tif");
close();
