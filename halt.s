	lui $r0, 0x33          # 0xa033
        ori $r0, $r0, 0x44     # 0x7044
        lui $r1, 0x33          # 0xa133
        ori $r1, $r1, 0x44     # 0x7544
self:   beq $r0, $r1, self     # 0x41ff