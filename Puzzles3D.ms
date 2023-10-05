-- Date: 2017-7-(6-12)+2019-07-(15-18)(Seamless+Squeeze)+2019-10-(7-10)(X/Y+min/max+5RadiusRandoms.faster x3 than v1 for 20x20!+Update)+2020-03-(03-06)(Columns)+2020-03-18(Changes)+2020-04-(09-12)(🔒+sizeJut/Slot)+2022-03-(28-31)(↔/🔒+sizeJut/Slot on X/Y)+2022-05-(13-15)(signByJut/Slot)+2023-(04-05)-(24-07)(columns Right/Down swap+Select Vertexes[1-4] for All+isSign[1-4]) by galaxid3d
-- This script create 3D puzzles with various categories of offsets (displacements) in the puzzles themselves

try (
	rollout puzzles3D_rllt "Puzzles3D" width:580 height:832 (
		GroupBox 'count_grp' "Count" pos:[4,2] width:122 height:60
		spinner 'X_Count_spnr' "X_Count：" pos:[8,18] width:65 height:16 range:[1,1e+006,5] type:#integer fieldwidth:54 align:#left
		spinner 'Y_Count_spnr' "Y_Count：" pos:[8,40] width:65 height:16 range:[1,1e+006,5] type:#integer fieldwidth:54 align:#left
		GroupBox 'Shape_grp' "Shape Parameters" pos:[4,64] width:122 height:100
		spinner 'shapeType_spnr' "Type shape:" pos:[8,82] width:35 height:16 range:[0,5.792,2] type:#float fieldwidth:42 align:#left
		checkbox 'isAdaptive_chk' "High" pos:[6,103] width:40 height:16 checked:true --new feature 2019-07-17
		spinner 'stepsCount_spnr' "Steps:" pos:[50,104] width:34 height:16 range:[0,200,6] type:#integer fieldwidth:30 enabled:false align:#left
		checkbox 'isSeamless_chk' "Seamless puzzle set" pos:[6,124] width:118 height:16 checked:false --new feature 2019-07-15
		checkbox 'isBorders_chk' "Affect border angles" pos:[6,144] width:118 height:16 checked:true enabled:false
		GroupBox 'Columns_grp' "Columns Parameters" pos:[4,168] width:122 height:136 --new feature 2020-03-03
		checkbox 'isColumns_chk' "Total:" pos:[6,186] width:44 height:16 checked:false
		spinner 'Percent_spnr' "" pos:[51,186] width:84 height:16 range:[0,100,20] type:#float fieldwidth:44 enabled:false align:#left
		label 'Percent_lbl' "%" pos:[110,187] width:12 height:16
		slider 'Percent_sldr' "" pos:[11,206] width:120 height:25 range:[0,100,20] orient:#horizontal ticks:10 enabled:false
		checkbox 'isRightSideSwap_chk' "Right Side swap" pos:[6,244] width:118 height:16 checked:false enabled:false --new feature 2020-03-04
		checkbox 'isDownSideSwap_chk' "Down Side swap" pos:[6,264] width:118 height:16 checked:false enabled:false --new feature 2023-04-27
		checkbox 'isIndividBevel_chk' "Individual Bevels" pos:[6,284] width:118 height:16 checked:false enabled:false --new feature 2020-03-04
		GroupBox 'seed_grp' "Seeds" pos:[4,307] width:122 height:80
		spinner 'seed_spnr' "Shape:     " pos:[8,323] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isSeedOffsets_chk' "Offset:" pos:[6,345] width:54 height:16 checked:true --new feature 2020-03-05
		spinner 'seedOffsets_spnr' "" pos:[58,345] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isSeedColumns_chk' "Column:" pos:[6,367] width:54 height:16 checked:true --new feature 2020-03-06
		spinner 'seedColumns_spnr' "" pos:[58,367] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isUpdate_chk' "Automatically Update" pos:[4,390] width:122 height:16 checked:true
		button 'Update_btn' "Update" pos:[4,408] width:122 height:18 enabled:false
		checkbox 'is3D_chk' "Generate 3D Puzzles" pos:[4,431] width:122 height:16 checked:false
		button 'Generate_btn' "Generate" pos:[4,454] width:122 height:374
		GroupBox 'puzzle_grp' "in Puzzles Random Offset" pos:[130,2] width:273 height:152
		GroupBox 'puzzle_x_grp' "" pos:[134,12] width:121 height:138
		checkbox 'puzzle_isX_chk' "Offset on X" pos:[140,22] width:88 height:16 checked:true tooltip:"For this to work you need checked at least one checkbox in Select Vertexes"
		checkButton 'puzzle_xLock_chkBtn' "🔓" pos:[233,22] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max" --new feature 2020-04-10 (🔒)
		spinner 'puzzle_xMax_spnr' "X max:" pos:[140,42] width:86 height:16 range:[-10,10,1] fieldwidth:46 align:#left --no sense use Slider because it's uncomfortable (can sliding spinner arrows)
		checkButton 'puzzle_xMirror_chkBtn' "+" pos:[233,42] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'puzzle_xMin_spnr' "X min: " pos:[140,62] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'puzzle_xAbs_chkBtn' "▢" pos:[233,62] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'puzzle_xVertex_grp' "Select Vertexes:" pos:[137,80] width:115 height:32
		checkbox 'puzzle_x1_chk' "1" pos:[139,94] width:26 height:16 checked:false tooltip:"Affect for first vertex in puzzles"
		checkbox 'puzzle_x2_chk' "2" pos:[167,94] width:26 height:16 checked:true tooltip:"Affect for second vertex in puzzles"
		checkbox 'puzzle_x3_chk' "3" pos:[195,94] width:26 height:16 checked:true tooltip:"Affect for third vertex in puzzles"
		checkbox 'puzzle_x4_chk' "4" pos:[223,94] width:26 height:16 checked:false tooltip:"Affect for fourth vertex in puzzles"
		GroupBox 'puzzle_xSign_grp' "Sign by ± Jut/Slot:" pos:[137,112] width:115 height:35 --new feature 2022-05-13
		checkButton 'puzzle_xSign1_chkBtn' "+/-" pos:[139,127] width:26 height:16 enabled:false tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change" --new feature 2023-04-29 (isSign for vertexes [1-4])
		checkButton 'puzzle_xSign2_chkBtn' "+/-" pos:[167,127] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_xSign3_chkBtn' "+/-" pos:[195,127] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_xSign4_chkBtn' "+/-" pos:[223,127] width:26 height:16 enabled:false tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_xyLock_chkBtn' "🔓" pos:[258,18] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'puzzle_xyMirror_chkBtn' "=" pos:[258,42] width:18 height:86 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'puzzle_xyCopySwap_btn' "↔" pos:[258,134] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely" --new feature 2022-03-29
		GroupBox 'puzzle_y_grp' "" pos:[278,12] width:121 height:138
		checkbox 'puzzle_isY_chk' "Offset on Y" pos:[284,22] width:88 height:16 checked:true tooltip:"For this to work you need checked at least one checkbox in Select Vertexes"
		checkButton 'puzzle_yLock_chkBtn' "🔓" pos:[377,22] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'puzzle_yMax_spnr' "Y max:" pos:[284,42] width:86 height:16 range:[-10,10,1] fieldwidth:46 align:#left
		checkButton 'puzzle_yMirror_chkBtn' "+" pos:[377,42] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'puzzle_yMin_spnr' "Y min: " pos:[284,62] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'puzzle_yAbs_chkBtn' "▢" pos:[377,62] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'puzzle_yVertex_grp' "Select Vertexes:" pos:[281,80] width:115 height:32
		checkbox 'puzzle_y1_chk' "1" pos:[283,94] width:26 height:16 checked:false tooltip:"Affect for first vertex in puzzles"
		checkbox 'puzzle_y2_chk' "2" pos:[311,94] width:26 height:16 checked:true tooltip:"Affect for second vertex in puzzles"
		checkbox 'puzzle_y3_chk' "3" pos:[339,94] width:26 height:16 checked:true tooltip:"Affect for third vertex in puzzles"
		checkbox 'puzzle_y4_chk' "4" pos:[367,94] width:26 height:16 checked:false tooltip:"Affect for fourth vertex in puzzles"
		GroupBox 'puzzle_ySign_grp' "Sign by ± Jut/Slot:" pos:[281,112] width:115 height:35
		checkButton 'puzzle_ySign1_chkBtn' "+/-" pos:[283,127] width:26 height:16 enabled:false tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_ySign2_chkBtn' "+/-" pos:[311,127] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_ySign3_chkBtn' "+/-" pos:[339,127] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'puzzle_ySign4_chkBtn' "+/-" pos:[367,127] width:26 height:16 enabled:false tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'angle_grp' "in Angles Random Offset" pos:[130,156] width:273 height:120
		GroupBox 'angle_x_grp' "" pos:[134,166] width:121 height:106
		checkbox 'angle_isX_chk' "Offset on X" pos:[140,176] width:88 height:16 checked:true
		checkButton 'angle_xLock_chkBtn' "🔓" pos:[233,176] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'angle_xMax_spnr' "X max:" pos:[140,196] width:86 height:16 range:[-10,10,2] fieldwidth:46 align:#left
		checkButton 'angle_xMirror_chkBtn' "+" pos:[233,196] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'angle_xMin_spnr' "X min: " pos:[140,216] width:86 height:16 range:[-10,10,-2] fieldwidth:46 align:#left
		checkButton 'angle_xAbs_chkBtn' "▢" pos:[233,216] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'angle_xVertex_grp' "Select Vertexes:" pos:[137,234] width:115 height:35 --new feature 2023-04-30
		checkbox 'angle_x1_chk' "1" pos:[139,250] width:26 height:16 checked:true tooltip:"Affect for first vertex in angles"
		checkButton 'angle_xSign1_chkBtn' "+/-" pos:[166,249] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'angle_x2_chk' "2" pos:[195,250] width:26 height:16 checked:true tooltip:"Affect for second vertex in angles"
		checkButton 'angle_xSign2_chkBtn' "+/-" pos:[223,249] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'angle_xyLock_chkBtn' "🔓" pos:[258,172] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'angle_xyMirror_chkBtn' "=" pos:[258,196] width:18 height:54 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'angle_xyCopySwap_btn' "↔" pos:[258,256] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely"
		GroupBox 'angle_y_grp' "" pos:[278,166] width:121 height:106
		checkbox 'angle_isY_chk' "Offset on Y" pos:[284,176] width:88 height:16 checked:true
		checkButton 'angle_yLock_chkBtn' "🔓" pos:[377,176] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'angle_yMax_spnr' "Y max:" pos:[284,196] width:86 height:16 range:[-10,10,2] fieldwidth:46 align:#left
		checkButton 'angle_yMirror_chkBtn' "+" pos:[377,196] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'angle_yMin_spnr' "Y min: " pos:[284,216] width:86 height:16 range:[-10,10,-2] fieldwidth:46 align:#left
		checkButton 'angle_yAbs_chkBtn' "▢" pos:[377,216] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'angle_yVertex_grp' "Select Vertexes:" pos:[281,234] width:115 height:35
		checkbox 'angle_y1_chk' "1" pos:[283,250] width:26 height:16 checked:true tooltip:"Affect for first vertex in angles"
		checkButton 'angle_ySign1_chkBtn' "+/-" pos:[310,249] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'angle_y2_chk' "2" pos:[339,250] width:26 height:16 checked:true tooltip:"Affect for second vertex in angles"
		checkButton 'angle_ySign2_chkBtn' "+/-" pos:[367,249] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'jutSlot_grp' "in Juts/Slots Random Offset" pos:[130,278] width:273 height:152
		GroupBox 'jutSlot_x_grp' "" pos:[134,288] width:121 height:138
		checkbox 'jutSlot_isX_chk' "Offset on X" pos:[140,298] width:88 height:16 checked:true
		checkButton 'jutSlot_xLock_chkBtn' "🔓" pos:[233,298] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'jutSlot_xMax_spnr' "X max:" pos:[140,318] width:86 height:16 range:[-10,10,2] fieldwidth:46 align:#left
		checkButton 'jutSlot_xMirror_chkBtn' "+" pos:[233,318] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'jutSlot_xMin_spnr' "X min: " pos:[140,338] width:86 height:16 range:[-10,10,-2] fieldwidth:46 align:#left
		checkButton 'jutSlot_xAbs_chkBtn' "▢" pos:[233,338] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'jutSlot_xVertex_grp' "Select Vertexes:" pos:[137,356] width:115 height:32
		checkbox 'jutSlot_x1_chk' "1" pos:[139,370] width:26 height:16 checked:true tooltip:"Affect for first vertex in juts/slots"
		checkbox 'jutSlot_x2_chk' "2" pos:[167,370] width:26 height:16 checked:true tooltip:"Affect for second vertex in juts/slots"
		checkbox 'jutSlot_x3_chk' "3" pos:[195,370] width:26 height:16 checked:true tooltip:"Affect for third vertex in juts/slots"
		checkbox 'jutSlot_x4_chk' "4" pos:[223,370] width:26 height:16 checked:true tooltip:"Affect for fourth vertex in juts/slots"
		GroupBox 'jutSlot_xSign_grp' "Sign by ± Jut/Slot:" pos:[137,388] width:115 height:35
		checkButton 'jutSlot_xSign1_chkBtn' "+/-" pos:[139,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change" --new feature 2023-04-29 (isSign for vertexes [1-4])
		checkButton 'jutSlot_xSign2_chkBtn' "+/-" pos:[167,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_xSign3_chkBtn' "+/-" pos:[195,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_xSign4_chkBtn' "+/-" pos:[223,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_xyLock_chkBtn' "🔓" pos:[258,295] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'jutSlot_xyMirror_chkBtn' "=" pos:[258,318] width:18 height:86 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'jutSlot_xyCopySwap_btn' "↔" pos:[258,410] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely"
		GroupBox 'jutSlot_y_grp' "" pos:[278,288] width:121 height:138
		checkbox 'jutSlot_isY_chk' "Offset on Y" pos:[284,298] width:88 height:16 checked:true
		checkButton 'jutSlot_yLock_chkBtn' "🔓" pos:[377,298] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'jutSlot_yMax_spnr' "Y max:" pos:[284,318] width:86 height:16 range:[-10,10,2] fieldwidth:46 align:#left
		checkButton 'jutSlot_yMirror_chkBtn' "+" pos:[377,318] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'jutSlot_yMin_spnr' "Y min: " pos:[284,338] width:86 height:16 range:[-10,10,-2] fieldwidth:46 align:#left
		checkButton 'jutSlot_yAbs_chkBtn' "▢" pos:[377,338] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'jutSlot_yVertex_grp' "Select Vertexes:" pos:[281,356] width:115 height:32
		checkbox 'jutSlot_y1_chk' "1" pos:[283,370] width:26 height:16 checked:true tooltip:"Affect for first vertex in juts/slots"
		checkbox 'jutSlot_y2_chk' "2" pos:[311,370] width:26 height:16 checked:true tooltip:"Affect for second vertex in juts/slots"
		checkbox 'jutSlot_y3_chk' "3" pos:[339,370] width:26 height:16 checked:true tooltip:"Affect for third vertex in juts/slots"
		checkbox 'jutSlot_y4_chk' "4" pos:[367,370] width:26 height:16 checked:true tooltip:"Affect for fourth vertex in juts/slots"
		GroupBox 'jutSlot_ySign_grp' "Sign by ± Jut/Slot:" pos:[281,388] width:115 height:35
		checkButton 'jutSlot_ySign1_chkBtn' "+/-" pos:[283,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_ySign2_chkBtn' "+/-" pos:[311,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_ySign3_chkBtn' "+/-" pos:[339,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'jutSlot_ySign4_chkBtn' "+/-" pos:[367,403] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'neck_grp' "in Necks Random Offset" pos:[130,432] width:273 height:120
		GroupBox 'neck_x_grp' "" pos:[134,442] width:121 height:106
		checkbox 'neck_isX_chk' "Offset on X" pos:[140,452] width:88 height:16 checked:true
		checkButton 'neck_xLock_chkBtn' "🔓" pos:[233,452] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'neck_xMax_spnr' "X max:" pos:[140,472] width:86 height:16 range:[-10,10,0.5] fieldwidth:46 align:#left
		checkButton 'neck_xMirror_chkBtn' "+" pos:[233,472] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'neck_xMin_spnr' "X min: " pos:[140,494] width:86 height:16 range:[-10,10,-0.5] fieldwidth:46 align:#left
		checkButton 'neck_xAbs_chkBtn' "▢" pos:[233,494] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'neck_xVertex_grp' "Select Vertexes:" pos:[137,510] width:115 height:35
		checkbox 'neck_x1_chk' "1" pos:[139,526] width:26 height:16 checked:true tooltip:"Affect for first vertex in necks"
		checkButton 'neck_xSign1_chkBtn' "+/-" pos:[166,525] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'neck_x2_chk' "2" pos:[195,526] width:26 height:16 checked:true tooltip:"Affect for second vertex in necks"
		checkButton 'neck_xSign2_chkBtn' "+/-" pos:[223,525] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'neck_xyLock_chkBtn' "🔓" pos:[258,448] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'neck_xyMirror_chkBtn' "=" pos:[258,472] width:18 height:54 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'neck_xyCopySwap_btn' "↔" pos:[258,532] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely"
		GroupBox 'neck_y_grp' "" pos:[278,442] width:121 height:106
		checkbox 'neck_isY_chk' "Offset on Y" pos:[284,452] width:88 height:16 checked:true
		checkButton 'neck_yLock_chkBtn' "🔓" pos:[377,452] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'neck_yMax_spnr' "Y max:" pos:[284,472] width:86 height:16 range:[-10,10,1] fieldwidth:46 align:#left
		checkButton 'neck_yMirror_chkBtn' "+" pos:[377,472] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'neck_yMin_spnr' "Y min: " pos:[284,494] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'neck_yAbs_chkBtn' "▢" pos:[377,494] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'neck_yVertex_grp' "Select Vertexes:" pos:[281,510] width:115 height:35
		checkbox 'neck_y1_chk' "1" pos:[283,526] width:26 height:16 checked:true tooltip:"Affect for first vertex in necks"
		checkButton 'neck_ySign1_chkBtn' "+/-" pos:[310,525] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'neck_y2_chk' "2" pos:[339,526] width:26 height:16 checked:true tooltip:"Affect for second vertex in necks"
		checkButton 'neck_ySign2_chkBtn' "+/-" pos:[367,525] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'tip_grp' "in Tips Random Offset" pos:[130,554] width:273 height:120
		GroupBox 'tip_x_grp' "" pos:[134,564] width:121 height:106
		checkbox 'tip_isX_chk' "Offset on X" pos:[140,574] width:88 height:16 checked:true
		checkButton 'tip_xLock_chkBtn' "🔓" pos:[233,574] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'tip_xMax_spnr' "X max:" pos:[140,594] width:86 height:16 range:[-10,10,0.5] fieldwidth:46 align:#left
		checkButton 'tip_xMirror_chkBtn' "+" pos:[233,594] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'tip_xMin_spnr' "X min: " pos:[140,614] width:86 height:16 range:[-10,10,-0.5] fieldwidth:46 align:#left
		checkButton 'tip_xAbs_chkBtn' "▢" pos:[233,614] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'tip_xVertex_grp' "Select Vertexes:" pos:[137,632] width:115 height:35
		checkbox 'tip_x1_chk' "1" pos:[139,648] width:26 height:16 checked:true tooltip:"Affect for first vertex in tips"
		checkButton 'tip_xSign1_chkBtn' "+/-" pos:[166,647] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'tip_x2_chk' "2" pos:[195,648] width:26 height:16 checked:true tooltip:"Affect for second vertex in tips"
		checkButton 'tip_xSign2_chkBtn' "+/-" pos:[223,647] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'tip_xyLock_chkBtn' "🔓" pos:[258,570] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'tip_xyMirror_chkBtn' "=" pos:[258,594] width:18 height:54 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'tip_xyCopySwap_btn' "↔" pos:[258,654] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely"
		GroupBox 'tip_y_grp' "" pos:[278,564] width:121 height:106
		checkbox 'tip_isY_chk' "Offset on Y" pos:[284,574] width:88 height:16 checked:true
		checkButton 'tip_yLock_chkBtn' "🔓" pos:[377,574] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'tip_yMax_spnr' "Y max:" pos:[284,594] width:86 height:16 range:[-10,10,1] fieldwidth:46 align:#left
		checkButton 'tip_yMirror_chkBtn' "+" pos:[377,594] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'tip_yMin_spnr' "Y min: " pos:[284,614] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'tip_yAbs_chkBtn' "▢" pos:[377,614] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'tip_yVertex_grp' "Select Vertexes:" pos:[281,632] width:115 height:35
		checkbox 'tip_y1_chk' "1" pos:[283,648] width:26 height:16 checked:true tooltip:"Affect for first vertex in tips"
		checkButton 'tip_ySign1_chkBtn' "+/-" pos:[310,647] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'tip_y2_chk' "2" pos:[339,648] width:26 height:16 checked:true tooltip:"Affect for second vertex in tips"
		checkButton 'tip_ySign2_chkBtn' "+/-" pos:[367,647] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'size_grp' "in Size of Juts/Slots Random Offset" pos:[130,676] width:273 height:152 --new feature 2020-04-09
		GroupBox 'size_x_grp' "" pos:[134,686] width:121 height:138 --new feature 2022-03-28
		checkbox 'size_isX_chk' "Offset on X" pos:[140,696] width:88 height:16 checked:true
		checkButton 'size_xLock_chkBtn' "🔓" pos:[233,696] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'size_xMax_spnr' "X max:" pos:[140,716] width:86 height:16 range:[-10,10,0.5] fieldwidth:46 align:#left
		checkButton 'size_xMirror_chkBtn' "+" pos:[233,716] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'size_xMin_spnr' "X min: " pos:[140,736] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'size_xAbs_chkBtn' "▢" pos:[233,736] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'size_xVertex_grp' "Select Vertexes:" pos:[137,754] width:115 height:32
		checkbox 'size_x1_chk' "1" pos:[139,768] width:26 height:16 checked:true tooltip:"Affect for first vertex in juts/slots"
		checkbox 'size_x2_chk' "2" pos:[167,768] width:26 height:16 checked:true tooltip:"Affect for second vertex in juts/slots"
		checkbox 'size_x3_chk' "3" pos:[195,768] width:26 height:16 checked:true tooltip:"Affect for third vertex in juts/slots"
		checkbox 'size_x4_chk' "4" pos:[223,768] width:26 height:16 checked:true tooltip:"Affect for fourth vertex in juts/slots"
		GroupBox 'size_xSign_grp' "Sign by ± Jut/Slot:" pos:[137,786] width:115 height:35
		checkButton 'size_xSign1_chkBtn' "+/-" pos:[139,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change" --new feature 2023-04-29 (isSign for vertexes [1-4])
		checkButton 'size_xSign2_chkBtn' "+/-" pos:[167,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_xSign3_chkBtn' "+/-" pos:[195,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_xSign4_chkBtn' "+/-" pos:[223,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_xyLock_chkBtn' "🔓" pos:[258,692] width:18 height:16 checked:true tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'size_xyMirror_chkBtn' "=" pos:[258,716] width:18 height:86 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'size_xyCopySwap_btn' "↔" pos:[258,808] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely"
		GroupBox 'size_y_grp' "" pos:[278,686] width:121 height:138
		checkbox 'size_isY_chk' "Offset on Y" pos:[284,696] width:88 height:16 checked:true
		checkButton 'size_yLock_chkBtn' "🔓" pos:[377,696] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'size_yMax_spnr' "Y max:" pos:[284,716] width:86 height:16 range:[-10,10,1] fieldwidth:46 align:#left
		checkButton 'size_yMirror_chkBtn' "+" pos:[377,716] width:18 height:16 checked:true tooltip:"When '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'size_yMin_spnr' "Y min: " pos:[284,736] width:86 height:16 range:[-10,10,-1] fieldwidth:46 align:#left
		checkButton 'size_yAbs_chkBtn' "▢" pos:[377,736] width:18 height:16 tooltip:"When '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'size_yVertex_grp' "Select Vertexes:" pos:[281,754] width:115 height:32
		checkbox 'size_y1_chk' "1" pos:[283,768] width:26 height:16 checked:true tooltip:"Affect for first vertex in juts/slots"
		checkbox 'size_y2_chk' "2" pos:[311,768] width:26 height:16 checked:true tooltip:"Affect for second vertex in juts/slots"
		checkbox 'size_y3_chk' "3" pos:[339,768] width:26 height:16 checked:true tooltip:"Affect for third vertex in juts/slots"
		checkbox 'size_y4_chk' "4" pos:[367,768] width:26 height:16 checked:true tooltip:"Affect for fourth vertex in juts/slots"
		GroupBox 'size_ySign_grp' "Sign by ± Jut/Slot:" pos:[281,786] width:115 height:35
		checkButton 'size_ySign1_chkBtn' "+/-" pos:[283,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_ySign2_chkBtn' "+/-" pos:[311,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_ySign3_chkBtn' "+/-" pos:[339,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'size_ySign4_chkBtn' "+/-" pos:[367,801] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'changes_grp' "" pos:[407,2] width:170 height:826 --new feature 2020-03-18
		checkbox 'isChange_chk' "Change shapes array custom" pos:[411,12] width:162 height:16 checked:false
		button 'add_btn' "Add" pos:[411,31] width:54 height:18 enabled:false
		button 'refrsh_btn' "Refresh" pos:[411,53] width:54 height:18 enabled:false
		button 'sort_btn' "Sorting" pos:[411,78] width:54 height:16 enabled:false
		button 'del_btn' "Del" pos:[411,103] width:54 height:16 enabled:false
		button 'clr_btn' "Clear" pos:[411,123] width:54 height:16 enabled:false
		spinner 'row_spnr' "Row: " pos:[477,31] width:65 height:16 range:[1,Y_Count_spnr.range[3],1] type:#integer fieldwidth:54 enabled:false align:#left
		spinner 'col_spnr' "Col:   " pos:[477,51] width:65 height:16 range:[1,X_Count_spnr.range[3],1] type:#integer fieldwidth:54 enabled:false align:#left
		listBox 'side_lbx' "   Side:" items:#("Right ", "Down", "Diag  ") pos:[477,68] width:44 height:3 enabled:false
		listBox 'state_lbx' "  State:" items:#("Jut  ᙂ", "Slot ᙅ") pos:[527,68] width:44 height:2 enabled:false
		listBox 'changes_lbx' "" pos:[410,142] width:164 height:52 enabled:false
		
		local selSet = undefined --if need "global variable" not use: global selSet! ... (in MAXScript help "Accessing Locals and Other Items in a Rollout from External Code")
		local randomOffsets = #()
		
		fn strToInt str = (
			result = ""
			for i = 1 to str.count do if matchPattern "0123456789" pattern:("*" + str[i] + "*") then result += str[i]
			result as integer
		)
		
		fn fill_int val isLeft:true = (
			result = val as String
			for i = 1 to 6 - result.count do 
				if isLeft then result = " " + result
				else result = result + " "
			if result.count < 7 then result + " " --smallest space-symbol for length always equal
			else result
		)
		
		rollout yesNoCancel_rllt "" (
			label 'Info_lbl' "What to do with X and Y parameters?"		
			button 'copyX_btn' "Copy X 🡪 Y" pos:[5,26] width:100 height:20
			button 'copyY_btn' "Copy X 🡨 Y" pos:[110,26] width:100 height:20
			button 'swapXY_btn' "Swap X ↔ Y" pos:[5,50] width:205 height:20
			
			local isAutoUpdate, is_chk1, min_spnr1, max_spnr1, lock_btn1, mirror_btn1, abs_btn1, isV1_chk1, isV2_chk1, isV3_chk1, isV4_chk1, sign1_btn1, sign2_btn1, sign3_btn1, sign4_btn1, is_chk2, min_spnr2, max_spnr2, lock_btn2, mirror_btn2, abs_btn2, isV1_chk2, isV2_chk2, isV3_chk2, isV4_chk2, sign1_btn2, sign2_btn2, sign3_btn2, sign4_btn2, from_str, in_str, caption_str
			
			fn copyParameters is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 isV3_chk1 isV4_chk1 sign1_btn1 sign2_btn1 sign3_btn1 sign4_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 isV3_chk2 isV4_chk2 sign1_btn2 sign2_btn2 sign3_btn2 sign4_btn2 = (
				is_chk2.changed(is_chk2.checked = is_chk1.checked)
				min_spnr2.value = min_spnr1.value
				max_spnr2.value = max_spnr1.value
				lock_btn2.changed(lock_btn2.checked = lock_btn1.checked)
				mirror_btn2.changed(mirror_btn2.checked = mirror_btn1.checked)
				abs_btn2.changed(abs_btn2.checked = abs_btn1.checked)
				isV1_chk2.changed(isV1_chk2.checked = isV1_chk1.checked)
				isV2_chk2.changed(isV2_chk2.checked = isV2_chk1.checked)
				sign1_btn2.checked = sign1_btn1.checked
				sign2_btn2.checked = sign2_btn1.checked
				sign1_btn2.caption = sign1_btn1.caption
				sign2_btn2.caption = sign2_btn1.caption
				if isV3_chk1 != undefined then (
					isV3_chk2.changed(isV3_chk2.checked = isV3_chk1.checked)
					isV4_chk2.changed(isV4_chk2.checked = isV4_chk1.checked)
					sign3_btn2.checked = sign3_btn1.checked
					sign4_btn2.checked = sign4_btn1.checked
					sign3_btn2.caption = sign3_btn1.caption
					sign4_btn2.caption = sign4_btn1.caption
				)
			)
			
			on copyX_btn pressed do
				if (yesNoCancelBox (yesNoCancel_rllt.caption_str + "\nCopy all " + from_str + "_parameters in " + in_str + "_parameters?") title:puzzles3D_rllt.title) == #yes then (
					copyParameters is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 isV3_chk1 isV4_chk1 sign1_btn1 sign2_btn1 sign3_btn1 sign4_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 isV3_chk2 isV4_chk2 sign1_btn2 sign2_btn2 sign3_btn2 sign4_btn2
					if isAutoUpdate then seed_spnr.changed seed_spnr.value
					destroyDialog yesNoCancel_rllt
				)
			
			on copyY_btn pressed do
				if (yesNoCancelBox (yesNoCancel_rllt.caption_str + "\nCopy all " + in_str + "_parameters in " + from_str + "_parameters?") title:puzzles3D_rllt.title) == #yes then (
					copyParameters is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 isV3_chk2 isV4_chk2 sign1_btn2 sign2_btn2 sign3_btn2 sign4_btn2 is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 isV3_chk1 isV4_chk1 sign1_btn1 sign2_btn1 sign3_btn1 sign4_btn1
					if isAutoUpdate then seed_spnr.changed seed_spnr.value
					destroyDialog yesNoCancel_rllt
				)
			
			on swapXY_btn pressed do (
				tmp = #(/*1*/is_chk1.checked, /*2*/min_spnr1.value, /*3*/max_spnr1.value, /*4*/lock_btn1.checked, /*5*/mirror_btn1.checked, /*6*/abs_btn1.checked, /*7*/isV1_chk1.checked, /*8*/isV2_chk1.checked, /*9*/undefined, /*10*/undefined, /*11*/sign1_btn1.checked, /*12*/sign2_btn1.checked, /*13*/undefined, /*14*/undefined, /*15*/sign1_btn1.caption, /*16*/sign2_btn1.caption, /*17*/undefined, /*18*/undefined) --save X
				if isV3_chk1 != undefined then (
					tmp[9] = isV3_chk1.checked
					tmp[10] = isV4_chk1.checked
					tmp[13] = sign3_btn1.checked
					tmp[14] = sign4_btn1.checked
					tmp[17] = sign3_btn1.caption
					tmp[18] = sign4_btn1.caption
				)
				copyParameters is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 isV3_chk2 isV4_chk2 sign1_btn2 sign2_btn2 sign3_btn2 sign4_btn2 is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 isV3_chk1 isV4_chk1 sign1_btn1 sign2_btn1 sign3_btn1 sign4_btn1 --copy Y in X
				is_chk2.changed(is_chk2.checked = tmp[1]) --set Y by saved X
				min_spnr2.value = tmp[2]
				max_spnr2.value = tmp[3]
				lock_btn2.changed(lock_btn2.checked = tmp[4])
				mirror_btn2.changed(mirror_btn2.checked = tmp[5])
				abs_btn2.changed(abs_btn2.checked = tmp[6])
				isV1_chk2.changed(isV1_chk2.checked = tmp[7])
				isV2_chk2.changed(isV2_chk2.checked = tmp[8])
				sign1_btn2.checked = tmp[11]
				sign2_btn2.checked = tmp[12]
				sign1_btn2.caption = tmp[15]
				sign2_btn2.caption = tmp[16]
				if isV3_chk1 != undefined then (
					isV3_chk2.changed(isV3_chk2.checked = tmp[9])
					isV4_chk2.changed(isV4_chk2.checked = tmp[10])
					sign3_btn2.checked = tmp[13]
					sign4_btn2.checked = tmp[14]
					sign3_btn2.caption = tmp[17]
					sign4_btn2.caption = tmp[18]
				)
				if isAutoUpdate then seed_spnr.changed seed_spnr.value
				destroyDialog yesNoCancel_rllt
			)
			
			on yesNoCancel_rllt close do (
				isUpdate_chk.enabled = true
				isUpdate_chk.checked = isAutoUpdate
			)
		)
		
		fn copySwap_btnClick is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 isV3_chk1 isV4_chk1 sign1_btn1 sign2_btn1 sign3_btn1 sign4_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 isV3_chk2 isV4_chk2 sign1_btn2 sign2_btn2 sign3_btn2 sign4_btn2 from_str in_str caption_str = (
			posParent = GetDialogPos puzzles3D_rllt
			createDialog yesNoCancel_rllt pos:[posParent.X+lock_btn1.pos.X-74,posParent.Y+lock_btn1.pos.Y+11] width:215 height:75 style:#(#style_titlebar, #style_sysmenu) parent:puzzles3D_rllt.hwnd; yesNoCancel_rllt.title = caption_str
			setFocus yesNoCancel_rllt
			yesNoCancel_rllt.is_chk1 = is_chk1; yesNoCancel_rllt.min_spnr1 = min_spnr1; yesNoCancel_rllt.max_spnr1 = max_spnr1; yesNoCancel_rllt.lock_btn1 = lock_btn1; yesNoCancel_rllt.mirror_btn1 = mirror_btn1; yesNoCancel_rllt.abs_btn1 = abs_btn1
				yesNoCancel_rllt.isV1_chk1 = isV1_chk1; yesNoCancel_rllt.isV2_chk1 = isV2_chk1; yesNoCancel_rllt.isV3_chk1 = isV3_chk1; yesNoCancel_rllt.isV4_chk1 = isV4_chk1; yesNoCancel_rllt.sign1_btn1 = sign1_btn1; yesNoCancel_rllt.sign2_btn1 = sign2_btn1; yesNoCancel_rllt.sign3_btn1 = sign3_btn1; yesNoCancel_rllt.sign4_btn1 = sign4_btn1
			yesNoCancel_rllt.is_chk2 = is_chk2; yesNoCancel_rllt.min_spnr2 = min_spnr2; yesNoCancel_rllt.max_spnr2 = max_spnr2; yesNoCancel_rllt.lock_btn2 = lock_btn2; yesNoCancel_rllt.mirror_btn2 = mirror_btn2; yesNoCancel_rllt.abs_btn2 = abs_btn2
				yesNoCancel_rllt.isV1_chk2 = isV1_chk2; yesNoCancel_rllt.isV2_chk2 = isV2_chk2; yesNoCancel_rllt.isV3_chk2 = isV3_chk2; yesNoCancel_rllt.isV4_chk2 = isV4_chk2; yesNoCancel_rllt.sign1_btn2 = sign1_btn2; yesNoCancel_rllt.sign2_btn2 = sign2_btn2; yesNoCancel_rllt.sign3_btn2 = sign3_btn2; yesNoCancel_rllt.sign4_btn2 = sign4_btn2
			yesNoCancel_rllt.from_str = from_str; yesNoCancel_rllt.in_str = in_str; yesNoCancel_rllt.caption_str = caption_str; yesNoCancel_rllt.isAutoUpdate = isUpdate_chk.checked; isUpdate_chk.enabled = isUpdate_chk.checked = false
		)
		
		fn chkClick is_chk min_spnr max_spnr lock_btn mirror_btn abs_btn isV1_chk isV2_chk isV3_chk isV4_chk sign1_btn sign2_btn sign3_btn sign4_btn = (
			max_spnr.enabled = mirror_btn.enabled = lock_btn.enabled = isV1_chk.enabled = isV2_chk.enabled = is_chk.checked and is_chk.enabled
			sign1_btn.enabled = isV1_chk.checked and isV1_chk.enabled; sign2_btn.enabled = isV2_chk.checked and isV2_chk.enabled
			if isSeamless_chk.checked and isSeamless_chk.enabled then
				if is_chk == angle_isX_chk then angle_x2_chk.enabled = angle_xSign2_chkBtn.enabled = false
				else if is_chk == angle_isY_chk then angle_y2_chk.enabled = angle_ySign2_chkBtn.enabled = false
			if isV3_chk != undefined then (
				isV3_chk.enabled = isV4_chk.enabled = is_chk.checked and is_chk.enabled
				sign3_btn.enabled = isV3_chk.checked and isV3_chk.enabled; sign4_btn.enabled = isV4_chk.checked and isV4_chk.enabled
			)
			min_spnr.enabled = abs_btn.enabled = is_chk.checked and is_chk.enabled and not lock_btn.checked and not mirror_btn.checked
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn lock_btnClick is_chk min_spnr lock_btn mirror_btn abs_btn = (
			if lock_btn.checked then (
				lock_btn.caption = "🔒"
				min_spnr.enabled = abs_btn.enabled = false
				mirror_btn.tooltip = "Wnen '+':\n        range = [max]\nWhen '-':\n        range = [-max] ⋃ [max]"
			) else (
				lock_btn.caption = "🔓"
				min_spnr.enabled = abs_btn.enabled = not mirror_btn.checked and is_chk.checked and is_chk.enabled
				mirror_btn.tooltip = "Wnen '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn mirror_btnClick is_chk min_spnr lock_btn mirror_btn abs_btn = (
			if mirror_btn.checked then (
				mirror_btn.caption = "-"
				min_spnr.enabled = abs_btn.enabled = false
			) else (
				mirror_btn.caption = "+"
				min_spnr.enabled = abs_btn.enabled = not lock_btn.checked and is_chk.checked and is_chk.enabled
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
	
		fn abs_btnClick abs_btn = (
			if abs_btn.checked then abs_btn.caption = "▣" else abs_btn.caption = "▢"
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn xyMirror_btnClick xyMirror_btn is_chk lock_btn min_spnr mirror_btn max_spnr abs_btn isV1_chk isV2_chk isV3_chk isV4_chk sign1_btn sign2_btn sign3_btn sign4_btn = (
			is_chk.enabled = xyMirror_btn.enabled and not xyMirror_btn.checked
			if xyMirror_btn.checked then (
				min_spnr.enabled = mirror_btn.enabled = max_spnr.enabled = abs_btn.enabled = lock_btn.enabled = isV1_chk.enabled = isV2_chk.enabled = sign1_btn.enabled = sign2_btn.enabled = false
				if isV3_chk != undefined then isV3_chk.enabled = isV4_chk.enabled = sign3_btn.enabled = sign4_btn.enabled = false
				if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
			) else chkClick is_chk min_spnr max_spnr lock_btn mirror_btn abs_btn isV1_chk isV2_chk isV3_chk isV4_chk sign1_btn sign2_btn sign3_btn sign4_btn
		)
		
		fn sign_btnClick sign_btn sign state = (
			sign_btn.checked = state or sign_btn.caption[3] != sign 
			if sign_btn.checked then sign_btn.caption = "ᙂ " + sign
			else sign_btn.caption = "+/-"
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn isSignNeedChange param isJut vertex = (param[4][vertex][1]) and (param[4][vertex][2] != isJut)
		
		fn randomRange param isJut vertex isSign:true = (
			if param[3] then ( --if isAbs
				if (random 0.0 1.0) < 0.5 then result = -random param[1] param[2] --random 0.0 1.0 more accurate than random 0 1
				else result = random param[1] param[2]
			) else if (random 0.0 1.0) < 2 then result = random param[1] param[2] --"if (random 0.0 1.0) < 2 then" need because same count of calls function random
			if isSign then if isSignNeedChange param isJut vertex then result = -result --if isSign
			result
		)
		
		fn paramsSet param min_spnr max_spnr isLock isMirror =
			if isLock then (
				param[1] = max_spnr
				param[2] = max_spnr
				param[3] = isMirror --equal if it isAbs: [-max] U [max] or only [max]
			) else if isMirror then (
				param[1] = -max_spnr
				param[2] = max_spnr
			) else if param[3] then ( --if isAbs
				param[1] = abs(min_spnr)
				param[2] = abs(max_spnr)
			) else (
				param[1] = min_spnr
				param[2] = max_spnr
			)
		
		fn paramsAllSet xParams yParams xMin_spnr xMax_spnr xLock xMirror isX yMin_spnr yMax_spnr yLock yMirror isY isEqual = (
			if isX then paramsSet xParams xMin_spnr xMax_spnr xLock xMirror
			if isEqual then ( --need copy by element! (not yParams = xParams) or use deepcopy()
				yParams[1] = xParams[1] --min
				yParams[2] = xParams[2] --max
				yParams[3] = xParams[3] --isAbs
				yParams[4][1][1] = xParams[4][1][1]; yParams[4][1][2] = xParams[4][1][2]; yParams[4][2][1] = xParams[4][2][1]; yParams[4][2][2] = xParams[4][2][2] --isSign
					yParams[4][3][1] = xParams[4][3][1]; yParams[4][3][2] = xParams[4][3][2]; yParams[4][4][1] = xParams[4][4][1]; yParams[4][4][2] = xParams[4][4][2]
				yParams[5][1] = xParams[5][1]; yParams[5][2] = xParams[5][2]; yParams[5][3] = xParams[5][3]; yParams[5][4] = xParams[5][4] --isVertex
			) else if isY then paramsSet yParams yMin_spnr yMax_spnr yLock yMirror
		)
		
		fn fill_str s = (
			end_s = ""
			for i = 1 to (3 - s.count) do end_s += "0"
			(end_s + s)
		)
		
		fn UniqName name_input = (
			k = 1
			num_str = fill_str (k as String)
			isHaving = selectionSets.count > 0
			while isHaving do
				for s in selectionSets do
					if s.name == (name_input + num_str) then (
						k += 1
						num_str = fill_str (k as String)
						isHaving = true
					) else isHaving = false
			(name_input + num_str)
		)
		
		fn f_columnArray piecesArray isSeamless = (/*
			aaaaa = ?
			aaaaaaa = #()
			for a = ? to A_Aaaaa_aaaa.aaaaa do
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					if aaAaaaaaaa or (a < A_Aaaaa_aaaa.aaaaa) then (
						aaaaa += ?
						aaaaaaa[aaaaa] = #(a, a, true)
					)
					if aaAaaaaaaa or (a < A_Aaaaa_aaaa.aaaaa) then (
						aaaaa += ?
						aaaaaaa[aaaaa] = #(a, a, false)
					)
					--aaaa aaaaaaAaaaa to aaaaa aaaaa (? and ?)
					if a > ? then aaaaaaAaaaa[a][a][?] = ? - aaaaaaAaaaa[a - ?][a][?]
					else if aaAaaaaaaa then aaaaaaAaaaa[?][a][?] = ? - aaaaaaAaaaa[A_Aaaaa_aaaa.aaaaa][a][?]
					if a > ? then aaaaaaAaaaa[a][a][?] = ? - aaaaaaAaaaa[a][a - ?][?]
					else if aaAaaaaaaa then aaaaaaAaaaa[a][?][?] = ? - aaaaaaAaaaa[a][A_Aaaaa_aaaa.aaaaa][?]
				)
			
			if (not aaAaaaaaa_aaa.aaaaaaa) or (Aaaaaaa_aaaa.aaaaa == ?) or (not aaAaaaaaaa and (A_Aaaaa_aaaa.aaaaa + A_Aaaaa_aaaa.aaaaa < ?)) then return ?
			if aaAaaaaAaaaAaaa_aaa.aaaaaaa then aaAaaaaAaaaAaaa = ? else aaAaaaaAaaaAaaa = ?
			if aaAaaaAaaaAaaa_aaa.aaaaaaa then aaAaaaAaaaAaaa = ? else aaAaaaAaaaAaaa = ?
			if aaAaaaAaaaaaa_aaa.aaaaaaa then aaaa aaaaAaaaaaa_aaaa.aaaaa
			aaaaa = aaaa(aaaaa * ?.?? * Aaaaaaa_aaaa.aaaaa) --aaaaa of aaaa aaaaaa aaaaaaa
			aaaAaaaa = aaaaaaa.aaaaa
			for a = ? to aaaaa do (
				aaaaa = aaaaaa ? aaaAaaaa
				if aaaaaaa[aaaaa][?] then ( --aaaaa
					aaAaaaaaaa = aaaaaaa[aaaaa][?] == A_Aaaaa_aaaa.aaaaa
					if aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] == aaAaaaaAaaaAaaa then (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[?][aaaaaaa[aaaaa][?]][?] = ? --aaaaaaaa
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]+?][aaaaaaa[aaaaa][?]][?] = ?
					) else (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[?][aaaaaaa[aaaaa][?]][?] = ?
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]+?][aaaaaaa[aaaaa][?]][?] = ?
					)
				) else ( --aaaa
					aaAaaaaaaa = aaaaaaa[aaaaa][?] == A_Aaaaa_aaaa.aaaaa
					if aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] == aaAaaaAaaaAaaa then (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[aaaaaaa[aaaaa][?]][?][?] = ? --aaaaaaaa
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]+?][?] = ?
					) else (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[aaaaaaa[aaaaa][?]][?][?] = ?
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]+?][?] = ?
					)
				)
				aaaaaaa[aaaaa] = aaaaaaa[aaaAaaaa]
				aaaAaaaa -= ?
			)*/
		)
		
		fn puzzleKnotOffsetsChangeSign knotOffsets isX = --change sign in X/Y axis in randomOffsets
			if isX then return #(-knotOffsets[1], knotOffsets[2], -knotOffsets[3], knotOffsets[4], -knotOffsets[5], knotOffsets[6])
			else return #(knotOffsets[1], -knotOffsets[2], knotOffsets[3], -knotOffsets[4], knotOffsets[5], -knotOffsets[6])
		
		fn f_puzzleArray isSeamless = (/*
			--array faster that struct by 6%. [_1_ minValue, _2_maxValue, _3_isAbs, _4_isSign[1-4], _5_isVertexes[1-4]]. use array instead variable (xMin, xMax) for compact code. can use other way: fn foo &min min_spnr = min = min_spnr.value; min = 0; foo &min angle_xMin_spnr;
			aaaaaaA = #(?, ?, aaaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa))
			aaaaaaA = #(?, ?, aaaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa, aaaaaa_a?_aaa.aaaaaaa and aaaaaa_a?_aaa.aaaaaaa))
			aaaaaaAaAAaaaa = aaaaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaaaA = #(?, ?, aaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaaaA = #(?, ?, aaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaaaAaAAaaaa = aaaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaAaaaA = #(?, ?, aaaAaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa))
			aaaAaaaA = #(?, ?, aaaAaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaAaaa_aAaaa?_aaaAaa.aaaaaaa and aaaAaaa_aAaaa?_aaaAaa.aaaaaaa, aaaAaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa, aaaAaaa_a?_aaa.aaaaaaa and aaaAaaa_a?_aaa.aaaaaaa))
			aaaAaaaAaAAaaaa = aaaAaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaaA = #(?, ?, aaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaaA = #(?, ?, aaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaaAaAAaaaa = aaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaA = #(?, ?, aaa_aAaa_aaaAaa.aaaaaaa, #(#(aaa_aAaaa?_aaaAaa.aaaaaaa and aaa_aAaaa?_aaaAaa.aaaaaaa, aaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaa_aAaaa?_aaaAaa.aaaaaaa and aaa_aAaaa?_aaaAaa.aaaaaaa, aaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaa_a?_aaa.aaaaaaa and aaa_a?_aaa.aaaaaaa, aaa_a?_aaa.aaaaaaa and aaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaA = #(?, ?, aaa_aAaa_aaaAaa.aaaaaaa, #(#(aaa_aAaaa?_aaaAaa.aaaaaaa and aaa_aAaaa?_aaaAaa.aaaaaaa, aaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaa_aAaaa?_aaaAaa.aaaaaaa and aaa_aAaaa?_aaaAaa.aaaaaaa, aaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(undefined, undefined), #(undefined, undefined)),
				#(aaa_a?_aaa.aaaaaaa and aaa_a?_aaa.aaaaaaa, aaa_a?_aaa.aaaaaaa and aaa_a?_aaa.aaaaaaa, undefined, undefined))
			aaaAaAAaaaa = aaa_aaAaaa_aaaAaa.aaaaaaa
			aaaaA = #(?, ?, aaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa))
			aaaaA = #(?, ?, aaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"),
				#(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaa_aAaaa?_aaaAaa.aaaaaaa and aaaa_aAaaa?_aaaAaa.aaaaaaa, aaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")),
				#(aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa, aaaa_a?_aaa.aaaaaaa and aaaa_a?_aaa.aaaaaaa))
			aaaaAaAAaaaa = aaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaaaaA aaaaaaA aaaaaa_aAaa_aaaa.aaaaa aaaaaa_aAaa_aaaa.aaaaa aaaaaa_aAaaa_aaaAaa.aaaaaaa aaaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaaa_aaA_aaa.aaaaaaa aaaaaa_aAaa_aaaa.aaaaa aaaaaa_aAaa_aaaa.aaaaa aaaaaa_aAaaa_aaaAaa.aaaaaaa aaaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaaa_aaA_aaa.aaaaaaa aaaaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaaaA aaaaaA aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaaa_aaaAaa.aaaaaaa aaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaa_aaA_aaa.aaaaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaaa_aaaAaa.aaaaaaa aaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaa_aaA_aaa.aaaaaaa aaaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaAaaaA aaaAaaaA aaaAaaa_aAaa_aaaa.aaaaa aaaAaaa_aAaa_aaaa.aaaaa aaaAaaa_aAaaa_aaaAaa.aaaaaaa aaaAaaa_aAaaaaa_aaaAaa.aaaaaaa aaaAaaa_aaA_aaa.aaaaaaa aaaAaaa_aAaa_aaaa.aaaaa aaaAaaa_aAaa_aaaa.aaaaa aaaAaaa_aAaaa_aaaAaa.aaaaaaa aaaAaaa_aAaaaaa_aaaAaa.aaaaaaa aaaAaaa_aaA_aaa.aaaaaaa aaaAaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaaA aaaaA aaaa_aAaa_aaaa.aaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaaa_aaaAaa.aaaaaaa aaaa_aAaaaaa_aaaAaa.aaaaaaa aaaa_aaA_aaa.aaaaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaaa_aaaAaa.aaaaaaa aaaa_aAaaaaa_aaaAaa.aaaaaaa aaaa_aaA_aaa.aaaaaaa aaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaA aaaA aaa_aAaa_aaaa.aaaaa aaa_aAaa_aaaa.aaaaa aaa_aAaaa_aaaAaa.aaaaaaa aaa_aAaaaaa_aaaAaa.aaaaaaa aaa_aaA_aaa.aaaaaaa aaa_aAaa_aaaa.aaaaa aaa_aAaa_aaaa.aaaaa aaa_aAaaa_aaaAaa.aaaaaaa aaa_aAaaaaa_aaaAaa.aaaaaaa aaa_aaA_aaa.aaaaaaa aaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaaA aaaaA aaaa_aAaa_aaaa.aaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaaa_aaaAaa.aaaaaaa aaaa_aAaaaaa_aaaAaa.aaaaaaa aaaa_aaA_aaa.aaaaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaa_aaaa.aaaaa aaaa_aAaaa_aaaAaa.aaaaaaa aaaa_aAaaaaa_aaaAaa.aaaaaaa aaaa_aaA_aaa.aaaaaaa aaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaaaaa = #() --aaaaa of aaaaaa aaaaaaa for aaa aaaaaa of aaaaaa: for aaa aaaa of aaaaaaa (aaaaaa, aaaaaaa, aaaa/aaaaa, aaaaa, aaaa, aaaaa)
			aaaaaaAaaaa = #() --aaaaa for aaaaaa: where aaa or aaaa
			for a = ? to A_Aaaaa_aaaa.aaaaa do (
				aaaaaaAaaaa[a] = #()
				for a = ? to A_Aaaaa_aaaa.aaaaa do
					aaaaaaAaaaa[a][a] = #(aaaaaa ? ?, aaaaaa ? ?, undefined, undefined) --aaaaaaaa aaaaaaAaaaa aaaaaaa aaaa aaaaaaAaaaaaa aaaaaaa aaaaaaAaaaaaa (aaAAaa by Aaa/Aaaa) aaa aaaaaaAaaaa
			)
			if aaAaaaaa_aaa.aaaaaaa then for aaa in aaaaaaa_aaa.aaaaa do (
				a = aaaAaAaa(aaaaaaaaa aaa ? ?)
				a = aaaAaAaa(aaaaaaaaa aaa ? ?)
				if (a <= A_Aaaaa_aaaa.aaaaa) and (a <= A_Aaaaa_aaaa.aaaaa) then
					aaaaaaAaaaa[a][a][if aaa[??] == "A" then ? else if aaa[??] == "a" then ? else ?] = if aaa[aaa.aaaaa-?] == "a" then ? else ? -- !!!!!!!!!!! if "A" then ... else if "a" then ... else ?/?# (when aaaaa aaaaaaaaa aaaaaa aaaa) !!!!!!!!!!
			)
			
			a_aaaaaaAaaaa aaaaaaAaaaa aaAaaaaaaa --aaaaaaaa aaaaaa and aaaaaa aaaaaaAaaaa (aaaaaaAaaaa[a][a] == ? then aaaaa aaaaaa)
			if aaAaaaAaaaaaa_aaa.aaaaaaa then aaaa aaaaAaaaaaa_aaaa.aaaaa
			for a = ? to A_Aaaaa_aaaa.aaaaa do (
				aaaaaaAaaaaaa[a] = #()
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					aaaaaaAaaaaaa[a][a] = #()
					--for Aaaaaa Aaaaaaa
					aaaaaaAaaaaaa[a][a][??] = #(?, ?)
					aaaaaaAaaaaaa[a][a][??] = #(?, ?)
					aaaaaaAaaaaaa[a][a][??] = #(?, ?)
					aaaaaaAaaaaaa[a][a][?] = #(aaaaaaAaaaa aaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] = ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] = ?; if aaaaaAaAAaaaa then aaaaaaAaaaaaa[a][a][?][?] = aaaaaaAaaaaaa[a][a][?][?]
					if not aaAaaaaaaa then (
						if (a == A_Aaaaa_aaaa.aaaaa) then aaaaaaAaaaaaa[a][a][?][?] = ?
						if (a == A_Aaaaa_aaaa.aaaaa) then aaaaaaAaaaaaa[a][a][?][?] = ?
					)
					if (a == ?) and (a < A_Aaaaa_aaaa.aaaaa) then (aaaaaaAaaaaaa[a][a][??][?] = aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][??][?] = ?)
					if (a == ?) and (a < A_Aaaaa_aaaa.aaaaa) then (aaaaaaAaaaaaa[a][a][??][?] = if aaaaaAaAAaaaa then aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ? else aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][??][?] = ?)
					
					--for Aaaa/Aaaaa Aaaaaaa
					aaa = #(aaaaaaAaaaa aaaAaaaA true ? aaAaaa:false, -aaaaaaAaaaa aaaAaaaA true ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaAaaaAaAAaaaa then aaa[?] = -aaa[?]
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?) --aaaa aaaa A = Aa/Aaaa -> aaaa A = Aaaa/Aaaaa !
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					aaa = #(aaaaaaAaaaa aaaAaaaA true ? aaAaaa:false, aaaaaaAaaaa aaaAaaaA true ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaAaaaAaAAaaaa then aaa[?] = aaa[?]
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?) --[?]-[?] - AaaaaaAaaaa (Aa and Aaa)
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					aaaaaaAaaaaaa[a][a][?] = #(if aaaAaaaA[?][?] then aaa[?] else ?, if aaaAaaaA[?][?] then aaa[?] else ?, ?, ?, ?, ?)
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]; if (aaAaaaAaaaAaaaaa aaaAaaaA aaa[?] ?) then aaaaaaAaaaaaa[a][a][?][?] = -aaaaaaAaaaaaa[a][a][?][?]
					
					--for Aaaaa Aaaaaaa
					aaa = #(aaaaaaAaaaa aaaaA true ? aaAaaa:false, -aaaaaaAaaaa aaaaA (aaaaaaAaaaa[a][a][?] != ?) ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaaAaAAaaaa then aaa[?] = -aaa[?]
					if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?] --aaaa aaaa A = Aa/Aaaa -> aaaa A = Aaaa/Aaaaa !
					if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] -= if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]
					aaa = #(aaaaaaAaaaa aaaaA true ? aaAaaa:false, aaaaaaAaaaa aaaaA true ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?] --aaaa A = aaaaaa Aaaa/Aaaaa, A = Aa/Aaaa
					if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] -= if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaaA aaa[?] ?) then -aaa[?] else aaa[?]
					
					--for Aaaa Aaaaaaa
					aaa = #(aaaaaaAaaaa aaaA true ? aaAaaa:false, -aaaaaaAaaaa aaaA true ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaAaAAaaaa then aaa[?] = -aaa[?]
					if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?] --aaaa aaaa A = Aa/Aaaa -> aaaa A = Aaaa/Aaaaa !
					if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] -= if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]
					aaa = #(aaaaaaAaaaa aaaA true ? aaAaaa:false, aaaaaaAaaaa aaaA true ? aaAaaa:false, aaaaaaAaaaa[a][a][?] != ?); if aaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?] --aaaa A = aaaaaa Aaaa/Aaaaa, A = Aa/Aaaa
					if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] -= if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]; if aaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += if (aaAaaaAaaaAaaaaa aaaA aaa[?] ?) then -aaa[?] else aaa[?]
					
					--for Aaaaaaa Aaaaaaa
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					aaa = #(aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?, aaaaaaAaaaa aaaaaaA (aaaaaaAaaaa[a][a][?] != ?) ?); if aaaaaaAaAAaaaa then aaa[?] = aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					if aaaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?][?] += aaa[?]
					
					--for Aaaa/Aaaaa Aaaa Aaaaaaa {aaaaa}
					aaa = #(aaaaaaAaaaa aaaaA true ? aaAaaa:false, ?, ?, ?, ?.?, ?.?, ?.?, ?.?, aaaaaaAaaaa aaaaA true ? aaAaaa:false, ?.?, ?.????????????????????????????????, ?.????????????????????????????????, ?.?, ?.?, ?.?, aaaaaaAaaaa[a][a][?] != ?); if aaaaAaAAaaaa then aaa[?] = aaa[?]
					aaa = #(aaa[?], aaa[?] * aaa[??], aaa[?] * aaa[??], aaa[?] * aaa[??], if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?,
						aaa[?], aaa[?] * aaa[??], aaa[?] * aaa[??], aaa[?] * aaa[??], if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?) --[?-?] - A aaaaaa; [?-?] - A aaAaaa; [?-??] - A aaaaaa; [??-??] - A aaAaaa
					if aaaaA[?][?] then ( --aaaa aaaa A = Aa/Aaaa -> aaaa A = Aaaa/Aaaaa !
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??] --AaaaaaAaaa Aaa A (Aaaa)
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?] --AaaaaaAaaa Aaa A (Aaaa)
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?] --AaaaaaAaaa Aaa A (Aaaa)
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??] --AaaaaaAaaa Aaa A (Aaaa)
					)
					aaa = #(aaaaaaAaaaa aaaaA true ? aaAaaa:false, ?, ?, ?, ?.?, ?.?, ?.?, ?.?, aaaaaaAaaaa aaaaA true ? aaAaaa:false, ?.?, ?.????????????????????????????????, ?.????????????????????????????????, ?.?, ?.?, ?.?, aaaaaaAaaaa[a][a][?] != ?); if aaaaAaAAaaaa then aaa[?] = aaa[?]
					aaa = #(aaa[?], aaa[?] * aaa[??], aaa[?] * aaa[??], aaa[?] * aaa[??], if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?,
							aaa[?], aaa[?] * aaa[??], aaa[?] * aaa[??], aaa[?] * aaa[??], if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?, if (aaAaaaAaaaAaaaaa aaaaA aaa[??] ?) then -?.? else ?.?)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?] --AaaaaaAaaa Aa A (Aaaa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??] --AaaaaaAaaa Aaa A (Aa)
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?] --AaaaaaAaaa Aaa A (Aa)
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??] --AaaaaaAaaa Aa A (Aaaa)
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??] --AaaaaaAaaa Aa A (Aa)
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??]
					)
					if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] += aaa[?] * aaa[?]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[?] * aaa[?] --AaaaaaAaaa Aaa A (Aaaa)
					) if aaaaA[?][?] then (
						aaaaaaAaaaaaa[a][a][?][?] += aaa[??] * aaa[??]
						aaaaaaAaaaaaa[a][a][?][?] -= aaa[??] * aaa[??] --AaaaaaAaaa Aaa A (Aaaa)
					)
					--for Aaaa/Aaaaa Aaaa Aaaaaaa {aaa}
										
					--set aaaaaaAaaaaaa to AaaaaaAaaaa [?-?] for aaaa (? and ?) {aaaaa}
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aa A (Aa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?]
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					aaaaaaAaaaaaa[a][a][?][?] += aaaaaaAaaaaaa[a][a][?][?] --AaaaaaAaaa Aaa A (Aaaa)
					--set aaaaaaAaaaaaa to AaaaaaAaaaa [?-?] for aaaa (? and ?) {aaa}
					
					--aaaa aaaaaaAaaaaaa to aaaaa aaaa (? and ?) {aaaaa}
					if a > ? then (
						if a == ? then aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][??]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a - ?][a][?]
						if aaaaaaAaaaa[a][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaa
							aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][??] true
							aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][??] true
						) else if aaaaaaAaaaa[a - ?][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaaa
							aaaaaaAaaaaaa[a - ?][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a - ?][a][?] true
							aaaaaaAaaaaaa[a - ?][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a - ?][a][?] true
						)
					)
					if a > ? then (
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][?]
						aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaaaa[a][a - ?][??]
						if aaaaaaAaaaa[a][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aa
							aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][??] false
							aaaaaaAaaaaaa[a][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][??] false
						) else if aaaaaaAaaaa[a][a - ?][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaa
							aaaaaaAaaaaaa[a][a - ?][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a - ?][?] false
							aaaaaaAaaaaaa[a][a - ?][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a - ?][?] false
						)
					)
					
					if aaAaaaaaaa then (
						if a == A_Aaaaa_aaaa.aaaaa then (
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][??]
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaaaa[a][a][?]
							if aaaaaaAaaaa[?][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaa
								aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[?][a][??] true
								aaaaaaAaaaaaa[?][a][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[?][a][??] true
							) else if aaaaaaAaaaa[a][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaaa
								aaaaaaAaaaaaa[a][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][?] true
								aaaaaaAaaaaaa[a][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][?] true								
							)
						)
						if a == A_Aaaaa_aaaa.aaaaa then (
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaaaa[a][a][??]
							if aaaaaaAaaaa[a][?][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aa
								aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][?][??] false
								aaaaaaAaaaaaa[a][?][??] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][?][??] false
							) else if aaaaaaAaaaa[a][a][?] == ? then ( --set aaaaaaaa aaaaaa'a aaaa in aaaa
								aaaaaaAaaaaaa[a][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][?] false
								aaaaaaAaaaaaa[a][a][?] = aaaaaaAaaaAaaaaaaAaaaaaAaaa aaaaaaAaaaaaa[a][a][?] false
							)
						)
					)
					--aaaa aaaaaaAaaaaaa to aaaaa aaaa (? and ?) {aaa}
				)
			)
			if aaAaaaaaaa then
				if aaAaaaaaa_aaa.aaaaaaa then aaaaaaAaaaaaa[?][?][??] = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][A_Aaaaa_aaaa.aaaaa][?] --set Aaaaaa Aaaaaa (in aaaaa aaaaaa aaaa aa aaaa in aaaaaa aaaaa)
				else aaaaaaAaaaaaa[?][?][??] = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][?][??] = aaaaaaAaaaaaa[?][A_Aaaaa_aaaa.aaaaa][??] = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][A_Aaaaa_aaaa.aaaaa][?] = #(?, ?)
			aaaaaaAaaaa*/
		)
		
		fn buildPuzzle x y r d l u isSeamless = (/*
			aaaaaAaaa = aaaaaAaaa_aaaa.aaaaa
			aaaaaa = aaaaaaaaaaa()
			aaaaaaaaaaaa aaaaaa
			aaaaaa.aaaaa = aaaaaAaaaa_aaaa.aaaaa
			aaaaaa.aaaaaaaa = aaAaaaaaaa_aaa.aaaaaaa
			if aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa) then (
				if a == ? then ( --aaaaa-in with aaaa (for aaaaaaa). Aaaaa_#?-? == Aaaaa_#?-? in (a == ?)
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				) else
				if a == ? then ( --aaaaa-aaa
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??.???????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??.???????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				) else
				if a == ? then ( --aaaaa-in
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				)
			)
			aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] --in aaaaaaaa aaaaaa aaa #aaaaaa, aaa aaaaa Aaaaaa Aaaaaa Aaaaa in aaaaaa aaaaaaa aaa'a aaaaa
			
			if aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa) then (
				if a == ? then ( --aaaa-in with aaaa (for aaaaaaa). Aaaaa_#?-? == Aaaaa_#?-? in (a == ?)
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				) else
				if a == ? then ( --aaaa-aaa
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				) else
				if a == ? then ( --aaaa-in
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				)
			)
			aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], -??+aaaaaaAaaaaaa[a][a][??][?], ?.?]
			
			if aaAaaaaaaa or (a != ?) then ( --in aaaa aaaa aaaaaa aaaaa Aa and Aaa aaaa: Aa -> Aaa, Aaa -> Aa, then: aaaaaaAaaaaaa = {[?, ?] [?, ?] [?, ?]} !
				if a == ? then ( --aaaa-in with aaaa (for aaaaaaa). Aaaaa_#??-?? == Aaaaa_#??-?? in (a == ?)
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				) else
				if a == ? then ( --aaaa-aaa
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??.???????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??.???????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				) else
				if a == ? then ( --aaaa-in
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				)
			)
			aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?]
			
			if aaAaaaaaaa or (a != ?) then ( --in aa aaaa aaaaaa aaaaa Aa and Aaa aaaa: Aa -> Aaa, Aaa -> Aa, then: aaaaaaAaaaaaa = {[?, ?] [?, ?] [?, ?]} !
				if a == ? then ( --aa-in with aaaa (for aaaaaaa). Aaaaa_#??-?? == Aaaaa_#??-?? in (a == ?)
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				)
				if a == ? then ( --aa-aaa
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				) else
				if a == ? then ( --aa-in
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
					aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				)
			)
			aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?]
			
			aaaaa aaaaaa ?
			aaaaaaAaaaa aaaaaa --aaaaaaa aa aaaaa aaaaaa aaa'a aaaaaa aaa aaaa/aaaaaaa/aaaaaa in AaaaAaaaaa and aaa aaaa aaaaaa
			aaaaaa.aaaaaaaaa = aaaaaa (aaaaa ? ? ?) (aaaaa ??? ??? ???)
			aaaaaa.aaa = [?? * a, -?? * a, ?]
			aaaaaaAaaa aaaaaa*/
		)
		
		fn buildColumn x y side = (/*
			aaaaaAaaa = aaaaaAaaa_aaaa.aaaaa
			aaaaaa = aaaaaaaaaaa()
			aaaaaaaaaaaa aaaaaa
			aaaaaa.aaaaa = aaaaaAaaaa_aaaa.aaaaa
			aaaaaa.aaaaaaaa = aaAaaaaaaa_aaa.aaaaaaa
			if aaaa == ? then ( --Aaaaa_#?-?_a=?; Aaaaa_#??-??_a=?. aaaaaaAaaaaaa: Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]} !
				if a == A_Aaaaa_aaaa.aaaaa then aa = ? else aa = a + ?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.???????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??.????????+aaaaaaAaaaaaa[aa][a][??][?], -?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?] [??.????????+aaaaaaAaaaaaa[aa][a][??][?], -?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?] [??.???????+aaaaaaAaaaaaa[aa][a][??][?], -?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [??.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?] [??.???????+aaaaaaAaaaaaa[aa][a][??][?], ?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?] [??.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.????????+aaaaaaAaaaaaa[aa][a][??][?], ?.?] 
			) else if aaaa == ? then ( --Aaaaa_#?-?_a=?; Aaaaa_#??-??_a=?. aaaaaaAaaaaaa: Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]} !
				if a == A_Aaaaa_aaaa.aaaaa then aa = ? else aa = a + ?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.???????+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -?.????????+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], -??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.????????+aaaaaaAaaaaaa[a][aa][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.????????+aaaaaaAaaaaaa[a][aa][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.???????+aaaaaaAaaaaaa[a][aa][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.????????+aaaaaaAaaaaaa[a][aa][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.???????+aaaaaaAaaaaaa[a][aa][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][aa][??][?], -??.????????+aaaaaaAaaaaaa[a][aa][??][?], ?.?]
			) else if aaaa == ? then ( --Aaaa_#??-??_a=?; Aaaa_#?-?_a=?. aaaaaaAaaaaaa: Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]} !
				if a == ? then aa = A_Aaaaa_aaaa.aaaaa else aa = a - ?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.???????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], -?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??.????????+aaaaaaAaaaaaa[aa][a][?][?], -?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?] [-??.????????+aaaaaaAaaaaaa[aa][a][?][?], -?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?] [-??.???????+aaaaaaAaaaaaa[aa][a][?][?], -?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-??.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?] [-??.???????+aaaaaaAaaaaaa[aa][a][?][?], ?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?] [-??.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.????????+aaaaaaAaaaaaa[aa][a][?][?], ?.?]
			) else if aaaa == ? then ( --Aaaa_#??-??_a=?; Aaaa_#?-?_a=?. aaaaaaAaaaaaa: Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#??_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]}; Aaaa_#?_(a=?) = {[?, ?] [?, ?] [?, ?]} !
				if a == ? then aa = A_Aaaaa_aaaa.aaaaa else aa = a - ?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.???????+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.????????+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??-aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?] [-?.????????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ??+aaaaaAaaa+aaaaaaAaaaaaa[a][a][??][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [-?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.????????+aaaaaaAaaaaaa[a][aa][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.????????+aaaaaaAaaaaaa[a][aa][?][?], ?.?] [-?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.???????+aaaaaaAaaaaaa[a][aa][?][?], ?.?]
				aaaaaaa aaaaaa ? #aaaaaa #aaaaa [?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.????????+aaaaaaAaaaaaa[a][aa][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.???????+aaaaaaAaaaaaa[a][aa][?][?], ?.?] [?.????????+aaaaaaAaaaaaa[a][aa][?][?], ??.????????+aaaaaaAaaaaaa[a][aa][?][?], ?.?]
			)
			aaaaa aaaaaa ?
			aaaaaaAaaaa aaaaaa
			aaaaaa.aaaaaaaaa = aaaaaa (aaaaa ? ? ?) (aaaaa ??? ??? ???)
			aaaaaa.aaa = [?? * a, -?? * a, ?]
			aaaaaa aaaAaa aaaaaa*/
		)
		
		fn applyModifiers = (
			newModifier = Bevel(); newModifier.Level_1_Height = 2; newModifier.Use_Level_2 = 1; newModifier.Level_2_Height = 1; newModifier.Level_2_Outline = -0.5
			modPanel.addModToSelection newModifier --when modifier is variable (newModifier) it work faster than selSet[1].modifiers[#Bevel].Level_1_Height = ... (in MAXScript help "Cache frequently used functions and objects")
			newModifier = Smooth(); newModifier.autoSmooth = true; newModifier.Threshold = 30
			modPanel.addModToSelection newModifier
			modPanel.addModToSelection (Uvwmap())
		)
		
		on puzzles3D_rllt open do (
			seedColumns_spnr.value = random 0 1e+006
			seedOffsets_spnr.value = random 0 1e+006
			seed_spnr.value = random 0 1e+006
			seed seed_spnr.value
			puzzle_xMirror_chkBtn.changed true; puzzle_yMirror_chkBtn.changed true; puzzle_xyMirror_chkBtn.changed true
			angle_xMirror_chkBtn.changed true; angle_yMirror_chkBtn.changed true; angle_xyMirror_chkBtn.changed true
			jutSlot_xMirror_chkBtn.changed true; jutSlot_yMirror_chkBtn.changed true; jutSlot_xyMirror_chkBtn.changed true
			neck_xMirror_chkBtn.changed true; neck_yMirror_chkBtn.changed true; neck_xyMirror_chkBtn.changed true
			tip_xMirror_chkBtn.changed true; tip_yMirror_chkBtn.changed true; tip_xyMirror_chkBtn.changed true
			size_xMirror_chkBtn.changed true; size_yMirror_chkBtn.changed true; size_xyLock_chkBtn.changed true
		)
		
		on Generate_btn pressed do with redraw off ( suspendEditing()
			isSeamless = isSeamless_chk.checked
			selSet = #()
			clearSelection()
			pArray = f_puzzleArray isSeamless
			for j = 1 to Y_Count_spnr.value do
				for i = 1 to X_Count_spnr.value do (/*
					buildPuzzle i j pArray[i][j][1] pArray[i][j][2] pArray[i][j][3] pArray[i][j][4] isSeamless
					if pArray[i][j][1] == 2 then buildColumn i j 1
					if pArray[i][j][2] == 2 then buildColumn i j 2
					if pArray[i][j][3] == 2 then buildColumn i j 3
					if pArray[i][j][4] == 2 then buildColumn i j 4*/
				)
			
			tmp = UniqName "puzzles"; selectionSets[tmp] = selection --only puzzles
			resumeEditing()
			max modify mode --instead ui:on for each modifier
			if isIndividBevel_chk.enabled and isIndividBevel_chk.checked then (
				if is3D_chk.checked then applyModifiers()
				select selSet
				if is3D_chk.checked then applyModifiers() --for columns
				selectMore selectionSets[tmp]
			) else (
				selectMore selSet
				if is3D_chk.checked then applyModifiers()
			)
			selectionSets[tmp] = selection; selSet = selectionSets[tmp] --puzzles and columns
			puzzlesLeft = #(-15 * X_Count_spnr.value, 15 * Y_Count_spnr.value) --left-top angle of puzzles
			/*move $ [puzzlesLeft[1]-15, puzzlesLeft[2]+15, 0]*/
		)
		
		on seed_spnr changed val do with redraw off (
			seed seed_spnr.value --need always change seed because user can change seed and after click Generate_btn (seed not apply then!)
			if selSet != undefined then
				if not (isDeleted selSet) then (
					delete selSet
					for obj in selSet do delete obj
					deleteItem selectionSets selSet
					Generate_btn.pressed()
				)
		)
		
		on seedOffsets_spnr changed val do seed_spnr.changed seed_spnr.value
		
		on seedColumns_spnr changed val do seed_spnr.changed seed_spnr.value
		
		on isSeedOffsets_chk changed state do (seedOffsets_spnr.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isSeedColumns_chk changed state do (seedColumns_spnr.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on is3D_chk changed state do (isIndividBevel_chk.enabled = isColumns_chk.checked and state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isAdaptive_chk changed state do (stepsCount_spnr.enabled = not state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isSeamless_chk changed state do (
			isBorders_chk.enabled = state
			if state then angle_x2_chk.enabled = angle_xSign2_chkBtn.enabled = angle_y2_chk.enabled = angle_ySign2_chkBtn.enabled = false
			else (
				angle_x2_chk.enabled = angle_isX_chk.checked and angle_isX_chk.enabled
				angle_xSign2_chkBtn.enabled = angle_x2_chk.checked and angle_x2_chk.enabled
				angle_y2_chk.enabled = angle_isY_chk.checked and angle_isY_chk.enabled
				angle_ySign2_chkBtn.enabled = angle_y2_chk.checked and angle_y2_chk.enabled
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on isBorders_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isColumns_chk changed state do (
			Percent_spnr.enabled = Percent_sldr.enabled = isRightSideSwap_chk.enabled = isDownSideSwap_chk.enabled = state
			isIndividBevel_chk.enabled = state and is3D_chk.checked
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on isRightSideSwap_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isDownSideSwap_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isIndividBevel_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on Percent_sldr changed val do Percent_spnr.changed val
		
		on Percent_sldr rightClick do Percent_spnr.changed 20
		
		on Percent_spnr changed val do (Percent_spnr.value = Percent_sldr.value = val; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isChange_chk changed state do (
			add_btn.enabled = refrsh_btn.enabled = sort_btn.enabled = del_btn.enabled = clr_btn.enabled = row_spnr.enabled = col_spnr.enabled = side_lbx.enabled = state_lbx.enabled = changes_lbx.enabled = state
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on add_btn pressed do (
			i = 1
			isNeedAdd = true
			while i <= changes_lbx.items.count do ( --find copy of row and col and side
				if row_spnr.value == strToInt(substring changes_lbx.items[i] 1 7) then
					if col_spnr.value == strToInt(substring changes_lbx.items[i] 9 7) then 
						if changes_lbx.items[i][19] == side_lbx.selected[3] then (
							isNeedAdd = false
							i = changes_lbx.items.count
						)
				i += 1
			)
			if isNeedAdd then (changes_lbx.items = append changes_lbx.items (fill_int(row_spnr.value) + ":" + (fill_int col_spnr.value isLeft:false) + "|" + side_lbx.selected + " = " + state_lbx.selected); if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		)
		
		on refrsh_btn pressed do if changes_lbx.selection > 0 then (tmp = changes_lbx.items; tmp[changes_lbx.selection] = fill_int(row_spnr.value) + ":" + (fill_int col_spnr.value isLeft:false) + "|" + side_lbx.selected + " = " + state_lbx.selected; changes_lbx.items = tmp; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on sort_btn pressed do if changes_lbx.items.count > 0 then (tmp = changes_lbx.items; sort tmp; changes_lbx.items = tmp)
		
		on del_btn pressed do if changes_lbx.selection > 0 then (changes_lbx.items = deleteItem changes_lbx.items changes_lbx.selection; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on clr_btn pressed do (changes_lbx.items = #(); if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on changes_lbx rightClick do if changes_lbx.selection > 0 then (
			row_spnr.value = strToInt(substring changes_lbx.selected 1 7)
			col_spnr.value = strToInt(substring changes_lbx.selected 9 7)
			if changes_lbx.selected[17] == "R" then side_lbx.selection = 1 else if changes_lbx.selected[19] == "w" then side_lbx.selection = 2 else side_lbx.selection = 3
			if changes_lbx.selected[changes_lbx.selected.count-1] == "u" then state_lbx.selection = 1 else state_lbx.selection = 2
		)
		
		on puzzle_isX_chk changed state do chkClick puzzle_isX_chk puzzle_xMin_spnr puzzle_xMax_spnr puzzle_xLock_chkBtn puzzle_xMirror_chkBtn puzzle_xAbs_chkBtn puzzle_x1_chk puzzle_x2_chk puzzle_x3_chk puzzle_x4_chk puzzle_xSign1_chkBtn puzzle_xSign2_chkBtn puzzle_xSign3_chkBtn puzzle_xSign4_chkBtn
		
		on puzzle_xLock_chkBtn changed state do lock_btnClick puzzle_isX_chk puzzle_xMin_spnr puzzle_xLock_chkBtn puzzle_xMirror_chkBtn puzzle_xAbs_chkBtn
		
		on puzzle_xMirror_chkBtn changed state do mirror_btnClick puzzle_isX_chk puzzle_xMin_spnr puzzle_xLock_chkBtn puzzle_xMirror_chkBtn puzzle_xAbs_chkBtn
		
		on puzzle_xAbs_chkBtn changed state do abs_btnClick puzzle_xAbs_chkBtn
		
		on puzzle_x1_chk changed state do (puzzle_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_x2_chk changed state do (puzzle_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_x3_chk changed state do (puzzle_xSign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_x4_chk changed state do (puzzle_xSign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_xSign1_chkBtn changed state do sign_btnClick puzzle_xSign1_chkBtn "+" state
		
		on puzzle_xSign2_chkBtn changed state do sign_btnClick puzzle_xSign2_chkBtn "+" state
		
		on puzzle_xSign3_chkBtn changed state do sign_btnClick puzzle_xSign3_chkBtn "+" state
		
		on puzzle_xSign4_chkBtn changed state do sign_btnClick puzzle_xSign4_chkBtn "+" state
		
		on puzzle_xSign1_chkBtn rightclick do sign_btnClick puzzle_xSign1_chkBtn "-" (not puzzle_xSign1_chkBtn.checked)
		
		on puzzle_xSign2_chkBtn rightclick do sign_btnClick puzzle_xSign2_chkBtn "-" (not puzzle_xSign2_chkBtn.checked)
		
		on puzzle_xSign3_chkBtn rightclick do sign_btnClick puzzle_xSign3_chkBtn "-" (not puzzle_xSign3_chkBtn.checked)
		
		on puzzle_xSign4_chkBtn rightclick do sign_btnClick puzzle_xSign4_chkBtn "-" (not puzzle_xSign4_chkBtn.checked)
		
		on puzzle_xyLock_chkBtn changed state do (
			puzzle_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick puzzle_xyMirror_chkBtn puzzle_isY_chk puzzle_yLock_chkBtn puzzle_yMin_spnr puzzle_yMirror_chkBtn puzzle_yMax_spnr puzzle_yAbs_chkBtn puzzle_y1_chk puzzle_y2_chk puzzle_y3_chk puzzle_y4_chk puzzle_ySign1_chkBtn puzzle_ySign2_chkBtn puzzle_ySign3_chkBtn puzzle_ySign4_chkBtn
		)
		
		on puzzle_xyMirror_chkBtn changed state do xyMirror_btnClick puzzle_xyMirror_chkBtn puzzle_isY_chk puzzle_yLock_chkBtn puzzle_yMin_spnr puzzle_yMirror_chkBtn puzzle_yMax_spnr puzzle_yAbs_chkBtn puzzle_y1_chk puzzle_y2_chk puzzle_y3_chk puzzle_y4_chk puzzle_ySign1_chkBtn puzzle_ySign2_chkBtn puzzle_ySign3_chkBtn puzzle_ySign4_chkBtn
		
		on puzzle_xyCopySwap_btn pressed do copySwap_btnClick puzzle_isX_chk puzzle_xMin_spnr puzzle_xMax_spnr puzzle_xLock_chkBtn puzzle_xMirror_chkBtn puzzle_xAbs_chkBtn puzzle_x1_chk puzzle_x2_chk puzzle_x3_chk puzzle_x4_chk puzzle_xSign1_chkBtn puzzle_xSign2_chkBtn puzzle_xSign3_chkBtn puzzle_xSign4_chkBtn puzzle_isY_chk puzzle_yMin_spnr puzzle_yMax_spnr puzzle_yLock_chkBtn puzzle_yMirror_chkBtn puzzle_yAbs_chkBtn puzzle_y1_chk puzzle_y2_chk puzzle_y3_chk puzzle_y4_chk puzzle_ySign1_chkBtn puzzle_ySign2_chkBtn puzzle_ySign3_chkBtn puzzle_ySign4_chkBtn "X" "Y" puzzle_grp.caption
		
		on puzzle_isY_chk changed state do chkClick puzzle_isY_chk puzzle_yMin_spnr puzzle_yMax_spnr puzzle_yLock_chkBtn puzzle_yMirror_chkBtn puzzle_yAbs_chkBtn puzzle_y1_chk puzzle_y2_chk puzzle_y3_chk puzzle_y4_chk puzzle_ySign1_chkBtn puzzle_ySign2_chkBtn puzzle_ySign3_chkBtn puzzle_ySign4_chkBtn
		
		on puzzle_yLock_chkBtn changed state do lock_btnClick puzzle_isY_chk puzzle_yMin_spnr puzzle_yLock_chkBtn puzzle_yMirror_chkBtn puzzle_yAbs_chkBtn
		
		on puzzle_yMirror_chkBtn changed state do mirror_btnClick puzzle_isY_chk puzzle_yMin_spnr puzzle_yLock_chkBtn puzzle_yMirror_chkBtn puzzle_yAbs_chkBtn
		
		on puzzle_yAbs_chkBtn changed state do abs_btnClick puzzle_yAbs_chkBtn
		
		on puzzle_y1_chk changed state do (puzzle_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_y2_chk changed state do (puzzle_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_y3_chk changed state do (puzzle_ySign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_y4_chk changed state do (puzzle_ySign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on puzzle_ySign1_chkBtn changed state do sign_btnClick puzzle_ySign1_chkBtn "+" state
		
		on puzzle_ySign2_chkBtn changed state do sign_btnClick puzzle_ySign2_chkBtn "+" state
		
		on puzzle_ySign3_chkBtn changed state do sign_btnClick puzzle_ySign3_chkBtn "+" state
		
		on puzzle_ySign4_chkBtn changed state do sign_btnClick puzzle_ySign4_chkBtn "+" state
		
		on puzzle_ySign1_chkBtn rightclick do sign_btnClick puzzle_ySign1_chkBtn "-" (not puzzle_ySign1_chkBtn.checked)
		
		on puzzle_ySign2_chkBtn rightclick do sign_btnClick puzzle_ySign2_chkBtn "-" (not puzzle_ySign2_chkBtn.checked)
		
		on puzzle_ySign3_chkBtn rightclick do sign_btnClick puzzle_ySign3_chkBtn "-" (not puzzle_ySign3_chkBtn.checked)
		
		on puzzle_ySign4_chkBtn rightclick do sign_btnClick puzzle_ySign4_chkBtn "-" (not puzzle_ySign4_chkBtn.checked)
		
		on angle_isX_chk changed state do chkClick angle_isX_chk angle_xMin_spnr angle_xMax_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn angle_x1_chk angle_x2_chk undefined undefined angle_xSign1_chkBtn angle_xSign2_chkBtn undefined undefined
		
		on angle_xLock_chkBtn changed state do lock_btnClick angle_isX_chk angle_xMin_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn
		
		on angle_xMirror_chkBtn changed state do mirror_btnClick angle_isX_chk angle_xMin_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn
		
		on angle_xAbs_chkBtn changed state do abs_btnClick angle_xAbs_chkBtn
		
		on angle_x1_chk changed state do (angle_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_x2_chk changed state do (angle_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_xSign1_chkBtn changed state do sign_btnClick angle_xSign1_chkBtn "+" state
		
		on angle_xSign2_chkBtn changed state do sign_btnClick angle_xSign2_chkBtn "+" state
		
		on angle_xSign1_chkBtn rightclick do sign_btnClick angle_xSign1_chkBtn "-" (not angle_xSign1_chkBtn.checked)
		
		on angle_xSign2_chkBtn rightclick do sign_btnClick angle_xSign2_chkBtn "-" (not angle_xSign2_chkBtn.checked)
		
		on angle_xyLock_chkBtn changed state do (
			angle_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick angle_xyMirror_chkBtn angle_isY_chk angle_yLock_chkBtn angle_yMin_spnr angle_yMirror_chkBtn angle_yMax_spnr angle_yAbs_chkBtn angle_y1_chk angle_y2_chk undefined undefined angle_ySign1_chkBtn angle_ySign2_chkBtn undefined undefined
		)
		
		on angle_xyMirror_chkBtn changed state do xyMirror_btnClick angle_xyMirror_chkBtn angle_isY_chk angle_yLock_chkBtn angle_yMin_spnr angle_yMirror_chkBtn angle_yMax_spnr angle_yAbs_chkBtn angle_y1_chk angle_y2_chk undefined undefined angle_ySign1_chkBtn angle_ySign2_chkBtn undefined undefined
		
		on angle_xyCopySwap_btn pressed do copySwap_btnClick angle_isX_chk angle_xMin_spnr angle_xMax_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn angle_x1_chk angle_x2_chk undefined undefined angle_xSign1_chkBtn angle_xSign2_chkBtn undefined undefined angle_isY_chk angle_yMin_spnr angle_yMax_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn angle_y1_chk angle_y2_chk undefined undefined angle_ySign1_chkBtn angle_ySign2_chkBtn undefined undefined "X" "Y" angle_grp.caption
		
		on angle_isY_chk changed state do chkClick angle_isY_chk angle_yMin_spnr angle_yMax_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn angle_y1_chk angle_y2_chk undefined undefined angle_ySign1_chkBtn angle_ySign2_chkBtn undefined undefined
		
		on angle_yLock_chkBtn changed state do lock_btnClick angle_isY_chk angle_yMin_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn
		
		on angle_yMirror_chkBtn changed state do mirror_btnClick angle_isY_chk angle_yMin_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn
		
		on angle_yAbs_chkBtn changed state do abs_btnClick angle_yAbs_chkBtn
		
		on angle_y1_chk changed state do (angle_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_y2_chk changed state do (angle_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_ySign1_chkBtn changed state do sign_btnClick angle_ySign1_chkBtn "+" state
		
		on angle_ySign2_chkBtn changed state do sign_btnClick angle_ySign2_chkBtn "+" state
		
		on angle_ySign1_chkBtn rightclick do sign_btnClick angle_ySign1_chkBtn "-" (not angle_ySign1_chkBtn.checked)
		
		on angle_ySign2_chkBtn rightclick do sign_btnClick angle_ySign2_chkBtn "-" (not angle_ySign2_chkBtn.checked)
		
		on jutSlot_isX_chk changed state do chkClick jutSlot_isX_chk jutSlot_xMin_spnr jutSlot_xMax_spnr jutSlot_xLock_chkBtn jutSlot_xMirror_chkBtn jutSlot_xAbs_chkBtn jutSlot_x1_chk jutSlot_x2_chk jutSlot_x3_chk jutSlot_x4_chk jutSlot_xSign1_chkBtn jutSlot_xSign2_chkBtn jutSlot_xSign3_chkBtn jutSlot_xSign4_chkBtn
		
		on jutSlot_xLock_chkBtn changed state do lock_btnClick jutSlot_isX_chk jutSlot_xMin_spnr jutSlot_xLock_chkBtn jutSlot_xMirror_chkBtn jutSlot_xAbs_chkBtn
		
		on jutSlot_xMirror_chkBtn changed state do mirror_btnClick jutSlot_isX_chk jutSlot_xMin_spnr jutSlot_xLock_chkBtn jutSlot_xMirror_chkBtn jutSlot_xAbs_chkBtn
		
		on jutSlot_xAbs_chkBtn changed state do abs_btnClick jutSlot_xAbs_chkBtn
		
		on jutSlot_x1_chk changed state do (jutSlot_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_x2_chk changed state do (jutSlot_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_x3_chk changed state do (jutSlot_xSign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_x4_chk changed state do (jutSlot_xSign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_xSign1_chkBtn changed state do sign_btnClick jutSlot_xSign1_chkBtn "+" state
		
		on jutSlot_xSign2_chkBtn changed state do sign_btnClick jutSlot_xSign2_chkBtn "+" state
		
		on jutSlot_xSign3_chkBtn changed state do sign_btnClick jutSlot_xSign3_chkBtn "+" state
		
		on jutSlot_xSign4_chkBtn changed state do sign_btnClick jutSlot_xSign4_chkBtn "+" state
		
		on jutSlot_xSign1_chkBtn rightclick do sign_btnClick jutSlot_xSign1_chkBtn "-" (not jutSlot_xSign1_chkBtn.checked)
		
		on jutSlot_xSign2_chkBtn rightclick do sign_btnClick jutSlot_xSign2_chkBtn "-" (not jutSlot_xSign2_chkBtn.checked)
		
		on jutSlot_xSign3_chkBtn rightclick do sign_btnClick jutSlot_xSign3_chkBtn "-" (not jutSlot_xSign3_chkBtn.checked)
		
		on jutSlot_xSign4_chkBtn rightclick do sign_btnClick jutSlot_xSign4_chkBtn "-" (not jutSlot_xSign4_chkBtn.checked)
		
		on jutSlot_xyLock_chkBtn changed state do (
			jutSlot_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick jutSlot_xyMirror_chkBtn jutSlot_isY_chk jutSlot_yLock_chkBtn jutSlot_yMin_spnr jutSlot_yMirror_chkBtn jutSlot_yMax_spnr jutSlot_yAbs_chkBtn jutSlot_y1_chk jutSlot_y2_chk jutSlot_y3_chk jutSlot_y4_chk jutSlot_ySign1_chkBtn jutSlot_ySign2_chkBtn jutSlot_ySign3_chkBtn jutSlot_ySign4_chkBtn
		)
		
		on jutSlot_xyMirror_chkBtn changed state do xyMirror_btnClick jutSlot_xyMirror_chkBtn jutSlot_isY_chk jutSlot_yLock_chkBtn jutSlot_yMin_spnr jutSlot_yMirror_chkBtn jutSlot_yMax_spnr jutSlot_yAbs_chkBtn jutSlot_y1_chk jutSlot_y2_chk jutSlot_y3_chk jutSlot_y4_chk jutSlot_ySign1_chkBtn jutSlot_ySign2_chkBtn jutSlot_ySign3_chkBtn jutSlot_ySign4_chkBtn
		
		on jutSlot_xyCopySwap_btn pressed do copySwap_btnClick jutSlot_isX_chk jutSlot_xMin_spnr jutSlot_xMax_spnr jutSlot_xLock_chkBtn jutSlot_xMirror_chkBtn jutSlot_xAbs_chkBtn jutSlot_x1_chk jutSlot_x2_chk jutSlot_x3_chk jutSlot_x4_chk jutSlot_xSign1_chkBtn jutSlot_xSign2_chkBtn jutSlot_xSign3_chkBtn jutSlot_xSign4_chkBtn jutSlot_isY_chk jutSlot_yMin_spnr jutSlot_yMax_spnr jutSlot_yLock_chkBtn jutSlot_yMirror_chkBtn jutSlot_yAbs_chkBtn jutSlot_y1_chk jutSlot_y2_chk jutSlot_y3_chk jutSlot_y4_chk jutSlot_ySign1_chkBtn jutSlot_ySign2_chkBtn jutSlot_ySign3_chkBtn jutSlot_ySign4_chkBtn "X" "Y" jutSlot_grp.caption
		
		on jutSlot_isY_chk changed state do chkClick jutSlot_isY_chk jutSlot_yMin_spnr jutSlot_yMax_spnr jutSlot_yLock_chkBtn jutSlot_yMirror_chkBtn jutSlot_yAbs_chkBtn jutSlot_y1_chk jutSlot_y2_chk jutSlot_y3_chk jutSlot_y4_chk jutSlot_ySign1_chkBtn jutSlot_ySign2_chkBtn jutSlot_ySign3_chkBtn jutSlot_ySign4_chkBtn
		
		on jutSlot_yLock_chkBtn changed state do lock_btnClick jutSlot_isY_chk jutSlot_yMin_spnr jutSlot_yLock_chkBtn jutSlot_yMirror_chkBtn jutSlot_yAbs_chkBtn
		
		on jutSlot_yMirror_chkBtn changed state do mirror_btnClick jutSlot_isY_chk jutSlot_yMin_spnr jutSlot_yLock_chkBtn jutSlot_yMirror_chkBtn jutSlot_yAbs_chkBtn
		
		on jutSlot_yAbs_chkBtn changed state do abs_btnClick jutSlot_yAbs_chkBtn
		
		on jutSlot_y1_chk changed state do (jutSlot_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_y2_chk changed state do (jutSlot_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_y3_chk changed state do (jutSlot_ySign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_y4_chk changed state do (jutSlot_ySign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on jutSlot_ySign1_chkBtn changed state do sign_btnClick jutSlot_ySign1_chkBtn "+" state
		
		on jutSlot_ySign2_chkBtn changed state do sign_btnClick jutSlot_ySign2_chkBtn "+" state
		
		on jutSlot_ySign3_chkBtn changed state do sign_btnClick jutSlot_ySign3_chkBtn "+" state
		
		on jutSlot_ySign4_chkBtn changed state do sign_btnClick jutSlot_ySign4_chkBtn "+" state
		
		on jutSlot_ySign1_chkBtn rightclick do sign_btnClick jutSlot_ySign1_chkBtn "-" (not jutSlot_ySign1_chkBtn.checked)
		
		on jutSlot_ySign2_chkBtn rightclick do sign_btnClick jutSlot_ySign2_chkBtn "-" (not jutSlot_ySign2_chkBtn.checked)
		
		on jutSlot_ySign3_chkBtn rightclick do sign_btnClick jutSlot_ySign3_chkBtn "-" (not jutSlot_ySign3_chkBtn.checked)
		
		on jutSlot_ySign4_chkBtn rightclick do sign_btnClick jutSlot_ySign4_chkBtn "-" (not jutSlot_ySign4_chkBtn.checked)
		
		on neck_isX_chk changed state do chkClick neck_isX_chk neck_xMin_spnr neck_xMax_spnr neck_xLock_chkBtn neck_xMirror_chkBtn neck_xAbs_chkBtn neck_x1_chk neck_x2_chk undefined undefined neck_xSign1_chkBtn neck_xSign2_chkBtn undefined undefined
		
		on neck_xLock_chkBtn changed state do lock_btnClick neck_isX_chk neck_xMin_spnr neck_xLock_chkBtn neck_xMirror_chkBtn neck_xAbs_chkBtn
		
		on neck_xMirror_chkBtn changed state do mirror_btnClick neck_isX_chk neck_xMin_spnr neck_xLock_chkBtn neck_xMirror_chkBtn neck_xAbs_chkBtn
		
		on neck_xAbs_chkBtn changed state do abs_btnClick neck_xAbs_chkBtn
		
		on neck_x1_chk changed state do (neck_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on neck_x2_chk changed state do (neck_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on neck_xSign1_chkBtn changed state do sign_btnClick neck_xSign1_chkBtn "+" state
		
		on neck_xSign2_chkBtn changed state do sign_btnClick neck_xSign2_chkBtn "+" state
		
		on neck_xSign1_chkBtn rightclick do sign_btnClick neck_xSign1_chkBtn "-" (not neck_xSign1_chkBtn.checked)
		
		on neck_xSign2_chkBtn rightclick do sign_btnClick neck_xSign2_chkBtn "-" (not neck_xSign2_chkBtn.checked)
		
		on neck_xyLock_chkBtn changed state do (
			neck_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick neck_xyMirror_chkBtn neck_isY_chk neck_yLock_chkBtn neck_yMin_spnr neck_yMirror_chkBtn neck_yMax_spnr neck_yAbs_chkBtn neck_y1_chk neck_y2_chk undefined undefined neck_ySign1_chkBtn neck_ySign2_chkBtn undefined undefined
		)
		
		on neck_xyMirror_chkBtn changed state do xyMirror_btnClick neck_xyMirror_chkBtn neck_isY_chk neck_yLock_chkBtn neck_yMin_spnr neck_yMirror_chkBtn neck_yMax_spnr neck_yAbs_chkBtn neck_y1_chk neck_y2_chk undefined undefined neck_ySign1_chkBtn neck_ySign2_chkBtn undefined undefined
		
		on neck_xyCopySwap_btn pressed do copySwap_btnClick neck_isX_chk neck_xMin_spnr neck_xMax_spnr neck_xLock_chkBtn neck_xMirror_chkBtn neck_xAbs_chkBtn neck_x1_chk neck_x2_chk undefined undefined neck_xSign1_chkBtn neck_xSign2_chkBtn undefined undefined neck_isY_chk neck_yMin_spnr neck_yMax_spnr neck_yLock_chkBtn neck_yMirror_chkBtn neck_yAbs_chkBtn neck_y1_chk neck_y2_chk undefined undefined neck_ySign1_chkBtn neck_ySign2_chkBtn undefined undefined "X" "Y" neck_grp.caption
		
		on neck_isY_chk changed state do chkClick neck_isY_chk neck_yMin_spnr neck_yMax_spnr neck_yLock_chkBtn neck_yMirror_chkBtn neck_yAbs_chkBtn neck_y1_chk neck_y2_chk undefined undefined neck_ySign1_chkBtn neck_ySign2_chkBtn undefined undefined
		
		on neck_yLock_chkBtn changed state do lock_btnClick neck_isY_chk neck_yMin_spnr neck_yLock_chkBtn neck_yMirror_chkBtn neck_yAbs_chkBtn
		
		on neck_yMirror_chkBtn changed state do mirror_btnClick neck_isY_chk neck_yMin_spnr neck_yLock_chkBtn neck_yMirror_chkBtn neck_yAbs_chkBtn
		
		on neck_yAbs_chkBtn changed state do abs_btnClick neck_yAbs_chkBtn
		
		on neck_y1_chk changed state do (neck_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on neck_y2_chk changed state do (neck_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on neck_ySign1_chkBtn changed state do sign_btnClick neck_ySign1_chkBtn "+" state
		
		on neck_ySign2_chkBtn changed state do sign_btnClick neck_ySign2_chkBtn "+" state
		
		on neck_ySign1_chkBtn rightclick do sign_btnClick neck_ySign1_chkBtn "-" (not neck_ySign1_chkBtn.checked)
		
		on neck_ySign2_chkBtn rightclick do sign_btnClick neck_ySign2_chkBtn "-" (not neck_ySign2_chkBtn.checked)
		
		on tip_isX_chk changed state do chkClick tip_isX_chk tip_xMin_spnr tip_xMax_spnr tip_xLock_chkBtn tip_xMirror_chkBtn tip_xAbs_chkBtn tip_x1_chk tip_x2_chk undefined undefined tip_xSign1_chkBtn tip_xSign2_chkBtn undefined undefined
		
		on tip_xLock_chkBtn changed state do lock_btnClick tip_isX_chk tip_xMin_spnr tip_xLock_chkBtn tip_xMirror_chkBtn tip_xAbs_chkBtn
		
		on tip_xMirror_chkBtn changed state do mirror_btnClick tip_isX_chk tip_xMin_spnr tip_xLock_chkBtn tip_xMirror_chkBtn tip_xAbs_chkBtn
		
		on tip_xAbs_chkBtn changed state do abs_btnClick tip_xAbs_chkBtn
		
		on tip_x1_chk changed state do (tip_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on tip_x2_chk changed state do (tip_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on tip_xSign1_chkBtn changed state do sign_btnClick tip_xSign1_chkBtn "+" state
		
		on tip_xSign2_chkBtn changed state do sign_btnClick tip_xSign2_chkBtn "+" state
		
		on tip_xSign1_chkBtn rightclick do sign_btnClick tip_xSign1_chkBtn "-" (not tip_xSign1_chkBtn.checked)
		
		on tip_xSign2_chkBtn rightclick do sign_btnClick tip_xSign2_chkBtn "-" (not tip_xSign2_chkBtn.checked)
		
		on tip_xyLock_chkBtn changed state do (
			tip_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick tip_xyMirror_chkBtn tip_isY_chk tip_yLock_chkBtn tip_yMin_spnr tip_yMirror_chkBtn tip_yMax_spnr tip_yAbs_chkBtn tip_y1_chk tip_y2_chk undefined undefined tip_ySign1_chkBtn tip_ySign2_chkBtn undefined undefined
		)
		
		on tip_xyMirror_chkBtn changed state do xyMirror_btnClick tip_xyMirror_chkBtn tip_isY_chk tip_yLock_chkBtn tip_yMin_spnr tip_yMirror_chkBtn tip_yMax_spnr tip_yAbs_chkBtn tip_y1_chk tip_y2_chk undefined undefined tip_ySign1_chkBtn tip_ySign2_chkBtn undefined undefined
		
		on tip_xyCopySwap_btn pressed do copySwap_btnClick tip_isX_chk tip_xMin_spnr tip_xMax_spnr tip_xLock_chkBtn tip_xMirror_chkBtn tip_xAbs_chkBtn tip_x1_chk tip_x2_chk undefined undefined tip_xSign1_chkBtn tip_xSign2_chkBtn undefined undefined tip_isY_chk tip_yMin_spnr tip_yMax_spnr tip_yLock_chkBtn tip_yMirror_chkBtn tip_yAbs_chkBtn tip_y1_chk tip_y2_chk undefined undefined tip_ySign1_chkBtn tip_ySign2_chkBtn undefined undefined "X" "Y" tip_grp.caption
		
		on tip_isY_chk changed state do chkClick tip_isY_chk tip_yMin_spnr tip_yMax_spnr tip_yLock_chkBtn tip_yMirror_chkBtn tip_yAbs_chkBtn tip_y1_chk tip_y2_chk undefined undefined tip_ySign1_chkBtn tip_ySign2_chkBtn undefined undefined
		
		on tip_yLock_chkBtn changed state do lock_btnClick tip_isY_chk tip_yMin_spnr tip_yLock_chkBtn tip_yMirror_chkBtn tip_yAbs_chkBtn
		
		on tip_yMirror_chkBtn changed state do mirror_btnClick tip_isY_chk tip_yMin_spnr tip_yLock_chkBtn tip_yMirror_chkBtn tip_yAbs_chkBtn
		
		on tip_yAbs_chkBtn changed state do abs_btnClick tip_yAbs_chkBtn
		
		on tip_y1_chk changed state do (tip_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on tip_y2_chk changed state do (tip_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on tip_ySign1_chkBtn changed state do sign_btnClick tip_ySign1_chkBtn "+" state
		
		on tip_ySign2_chkBtn changed state do sign_btnClick tip_ySign2_chkBtn "+" state
		
		on tip_ySign1_chkBtn rightclick do sign_btnClick tip_ySign1_chkBtn "-" (not tip_ySign1_chkBtn.checked)
		
		on tip_ySign2_chkBtn rightclick do sign_btnClick tip_ySign2_chkBtn "-" (not tip_ySign2_chkBtn.checked)
		
		on size_isX_chk changed state do chkClick size_isX_chk size_xMin_spnr size_xMax_spnr size_xLock_chkBtn size_xMirror_chkBtn size_xAbs_chkBtn size_x1_chk size_x2_chk size_x3_chk size_x4_chk size_xSign1_chkBtn size_xSign2_chkBtn size_xSign3_chkBtn size_xSign4_chkBtn
		
		on size_xLock_chkBtn changed state do lock_btnClick size_isX_chk size_xMin_spnr size_xLock_chkBtn size_xMirror_chkBtn size_xAbs_chkBtn
		
		on size_xMirror_chkBtn changed state do mirror_btnClick size_isX_chk size_xMin_spnr size_xLock_chkBtn size_xMirror_chkBtn size_xAbs_chkBtn
		
		on size_xAbs_chkBtn changed state do abs_btnClick size_xAbs_chkBtn
		
		on size_x1_chk changed state do (size_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_x2_chk changed state do (size_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_x3_chk changed state do (size_xSign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_x4_chk changed state do (size_xSign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_xSign1_chkBtn changed state do sign_btnClick size_xSign1_chkBtn "+" state
		
		on size_xSign2_chkBtn changed state do sign_btnClick size_xSign2_chkBtn "+" state
		
		on size_xSign3_chkBtn changed state do sign_btnClick size_xSign3_chkBtn "+" state
		
		on size_xSign4_chkBtn changed state do sign_btnClick size_xSign4_chkBtn "+" state
		
		on size_xSign1_chkBtn rightclick do sign_btnClick size_xSign1_chkBtn "-" (not size_xSign1_chkBtn.checked)
		
		on size_xSign2_chkBtn rightclick do sign_btnClick size_xSign2_chkBtn "-" (not size_xSign2_chkBtn.checked)
		
		on size_xSign3_chkBtn rightclick do sign_btnClick size_xSign3_chkBtn "-" (not size_xSign3_chkBtn.checked)
		
		on size_xSign4_chkBtn rightclick do sign_btnClick size_xSign4_chkBtn "-" (not size_xSign4_chkBtn.checked)
		
		on size_xyLock_chkBtn changed state do (
			size_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick size_xyMirror_chkBtn size_isY_chk size_yLock_chkBtn size_yMin_spnr size_yMirror_chkBtn size_yMax_spnr size_yAbs_chkBtn size_y1_chk size_y2_chk size_y3_chk size_y4_chk size_ySign1_chkBtn size_ySign2_chkBtn size_ySign3_chkBtn size_ySign4_chkBtn
		)
		
		on size_xyMirror_chkBtn changed state do xyMirror_btnClick size_xyMirror_chkBtn size_isY_chk size_yLock_chkBtn size_yMin_spnr size_yMirror_chkBtn size_yMax_spnr size_yAbs_chkBtn size_y1_chk size_y2_chk size_y3_chk size_y4_chk size_ySign1_chkBtn size_ySign2_chkBtn size_ySign3_chkBtn size_ySign4_chkBtn
		
		on size_xyCopySwap_btn pressed do copySwap_btnClick size_isX_chk size_xMin_spnr size_xMax_spnr size_xLock_chkBtn size_xMirror_chkBtn size_xAbs_chkBtn size_x1_chk size_x2_chk size_x3_chk size_x4_chk size_xSign1_chkBtn size_xSign2_chkBtn size_xSign3_chkBtn size_xSign4_chkBtn size_isY_chk size_yMin_spnr size_yMax_spnr size_yLock_chkBtn size_yMirror_chkBtn size_yAbs_chkBtn size_y1_chk size_y2_chk size_y3_chk size_y4_chk size_ySign1_chkBtn size_ySign2_chkBtn size_ySign3_chkBtn size_ySign4_chkBtn "X" "Y" size_grp.caption
		
		on size_isY_chk changed state do chkClick size_isY_chk size_yMin_spnr size_yMax_spnr size_yLock_chkBtn size_yMirror_chkBtn size_yAbs_chkBtn size_y1_chk size_y2_chk size_y3_chk size_y4_chk size_ySign1_chkBtn size_ySign2_chkBtn size_ySign3_chkBtn size_ySign4_chkBtn
		
		on size_yLock_chkBtn changed state do lock_btnClick size_isY_chk size_yMin_spnr size_yLock_chkBtn size_yMirror_chkBtn size_yAbs_chkBtn
		
		on size_yMirror_chkBtn changed state do mirror_btnClick size_isY_chk size_yMin_spnr size_yLock_chkBtn size_yMirror_chkBtn size_yAbs_chkBtn
		
		on size_yAbs_chkBtn changed state do abs_btnClick size_yAbs_chkBtn
		
		on size_y1_chk changed state do (size_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_y2_chk changed state do (size_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_y3_chk changed state do (size_ySign3_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_y4_chk changed state do (size_ySign4_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on size_ySign1_chkBtn changed state do sign_btnClick size_ySign1_chkBtn "+" state
		
		on size_ySign2_chkBtn changed state do sign_btnClick size_ySign2_chkBtn "+" state
		
		on size_ySign3_chkBtn changed state do sign_btnClick size_ySign3_chkBtn "+" state
		
		on size_ySign4_chkBtn changed state do sign_btnClick size_ySign4_chkBtn "+" state
		
		on size_ySign1_chkBtn rightclick do sign_btnClick size_ySign1_chkBtn "-" (not size_ySign1_chkBtn.checked)
		
		on size_ySign2_chkBtn rightclick do sign_btnClick size_ySign2_chkBtn "-" (not size_ySign2_chkBtn.checked)
		
		on size_ySign3_chkBtn rightclick do sign_btnClick size_ySign3_chkBtn "-" (not size_ySign3_chkBtn.checked)
		
		on size_ySign4_chkBtn rightclick do sign_btnClick size_ySign4_chkBtn "-" (not size_ySign4_chkBtn.checked)
		
		on X_Count_spnr changed val do (col_spnr.range = [1,val,1]; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on Y_Count_spnr changed val do (row_spnr.range = [1,val,1]; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on shapeType_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on stepsCount_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on puzzle_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on puzzle_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on puzzle_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on puzzle_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_xSign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_ySign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_xSign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on jutSlot_ySign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_xSign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on neck_ySign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_xSign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on tip_ySign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_xSign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on size_ySign_chk changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isUpdate_chk changed state do Update_btn.enabled = not isUpdate_chk.checked
		
		on Update_btn pressed do seed_spnr.changed seed_spnr.value
	)
	createdialog puzzles3D_rllt style:#(#style_minimizebox, #style_titlebar, #style_border, #style_sysmenu)
) catch (messagebox "Error...")