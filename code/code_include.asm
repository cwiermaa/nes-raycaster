.BANK 15 SLOT 0
.section "Standard Code" FREE
.incdir "code/standard"
.include "standard_include.asm"
.ends

.BANK 14 SLOT 1
.ORGA $A000
.section "Raycast Controller" FORCE
.incdir "code/mode0"
.include "mode0.asm"
.include "raycasting.asm"
.incdir ""
.ends

.BANK 12 SLOT 0
.ORGA $8000
.section "Drawing" FORCE
.incdir "code/mode0"
.include "raycast_fill_tables.asm"
.include "raycast_pset.asm"
.include "draw_wall.asm"
.include "pixel_locations.asm"
.incdir ""
.ends

.BANK 11 SLOT 0
.ORGA $8000
.section "XORFill" FORCE
.incdir "code/mode0"
.include "xor_fill.asm"
.incdir ""
.ends

.BANK 10 SLOT 0
.ORGA $8000
.section "XORFill2" FORCE
.incdir "code/mode0"
.include "xor_fill2.asm"
.include "object_draw_distance_width_tables.asm"
.incdir ""
.ends

.BANK 8 SLOT 0
.ORGA $8000
.section "Raycast2" FORCE
.incdir "code/mode0"
.include "raycast2.asm"
.incdir ""
.ends

.BANK 7 SLOT 0
.ORGA $8000
.section "Raycast1" FORCE
.incdir "code/mode0"
.include "raycast1.asm"
.incdir ""
.ends

.BANK 6 SLOT 0
.ORGA $8000
.section "ObjectDraw" FORCE
.incdir "code/mode0"
.include "object_draw.asm"
.incdir ""
.ends

.BANK 5 SLOT 0
.ORGA $8000
.section "ObjectDrawObjects" FORCE
.incdir "code/mode0"
.include "object_draw_draw_objects.asm"
.include "object_textures.asm"
.incdir "code/mode0"
.include "reciprocal_16_bit.asm"
.include "get_object_location.asm"
.incdir ""
.ends
