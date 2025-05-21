ffmpeg -re -i output.mp4 -ignore_loop 0 -i mouse.gif \
-filter_complex "
[1:v]scale=iw*1.5:ih*1.5[gif_scaled];
[0:v][gif_scaled]overlay=x=W-w-10:y=10:shortest=1,
drawtext=text='Codec Audio-ac3':x=10:y=H-th-330:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,0)',
drawtext=text='Codec Video-libxvid':x=10:y=H-th-275:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,1)',
drawtext=text='LeThanhLong-20224325':x=10:y=H-th-220:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,2)',
drawtext=text='DangNguyenHaiAnh-20224295':x=10:y=H-th-165:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,3)',
drawtext=text='BuiHoangGiang-20224307':x=10:y=H-th-110:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,4)',
drawtext=text='BuiVanBinh-20224301':x=10:y=H-th-55:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,5)',
drawtext=text='VuTruongGiang-20224308':x=10:y=H-th-0:fontsize=35:fontcolor=white:borderw=2:bordercolor=black:enable='gte(t,6)'
" \
-c:v libxvid -b:v 500k -c:a ac3 -f mpegts udp://10.138.50.189:5000