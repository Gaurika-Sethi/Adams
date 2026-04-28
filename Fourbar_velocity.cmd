

!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = rad  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Fourbar
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Fourbar.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 10.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_2  &
   adams_id = 2  &
   location = -60.0, 80.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_3  &
   adams_id = 3  &
   location = 180.0, 180.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_4  &
   adams_id = 4  &
   location = 180.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_12  &
   adams_id = 12  &
   location = -30.0, 45.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.ground.MARKER_16  &
   adams_id = 16  &
   location = 180.0, 90.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Fourbar.ground  &
   material_type = .Fourbar.steel
!
part attributes  &
   part_name = .Fourbar.ground  &
   name_visibility = off
!
!----------------------------------- PART_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.ground
!
part create rigid_body name_and_position  &
   part_name = .Fourbar.PART_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.PART_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Fourbar.PART_2.MARKER_5  &
   adams_id = 5  &
   location = 0.0, 10.0, 0.0  &
   orientation = 2.2794225989, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_2.MARKER_6  &
   adams_id = 6  &
   location = -80.0, 80.0, 0.0  &
   orientation = 2.2794225989, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_2.cm  &
   adams_id = 17  &
   location = -40.0, 45.0, 0.0  &
   orientation = 3.9935589808, 1.5707963264, 1.5707963215
!
marker create  &
   marker_name = .Fourbar.PART_2.MARKER_11  &
   adams_id = 11  &
   location = -30.0, 45.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_2.MARKER_13  &
   adams_id = 13  &
   location = 60.0, 130.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Fourbar.PART_2  &
   material_type = .Fourbar.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Fourbar.PART_2.LINK_1  &
   i_marker = .Fourbar.PART_2.MARKER_5  &
   j_marker = .Fourbar.PART_2.MARKER_6  &
   width = 9.2195444573  &
   depth = 4.6097722286
!
part attributes  &
   part_name = .Fourbar.PART_2  &
   color = CYAN  &
   name_visibility = off
!
!----------------------------------- PART_3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.ground
!
part create rigid_body name_and_position  &
   part_name = .Fourbar.PART_3  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.PART_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Fourbar.PART_3.MARKER_7  &
   adams_id = 7  &
   location = -80.0, 80.0, 0.0  &
   orientation = 0.3947911197, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_3.MARKER_8  &
   adams_id = 8  &
   location = 180.0, 180.0, 0.0  &
   orientation = 0.3947911197, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_3.cm  &
   adams_id = 18  &
   location = 50.0, 130.0, 0.0  &
   orientation = 5.0795628142, 1.5707963271, 1.5707963294
!
marker create  &
   marker_name = .Fourbar.PART_3.MARKER_14  &
   adams_id = 14  &
   location = 60.0, 130.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Fourbar.PART_3  &
   material_type = .Fourbar.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Fourbar.PART_3.LINK_2  &
   i_marker = .Fourbar.PART_3.MARKER_7  &
   j_marker = .Fourbar.PART_3.MARKER_8  &
   width = 26.0  &
   depth = 13.0
!
part attributes  &
   part_name = .Fourbar.PART_3  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- PART_4 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.ground
!
part create rigid_body name_and_position  &
   part_name = .Fourbar.PART_4  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Fourbar.PART_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Fourbar.PART_4.MARKER_9  &
   adams_id = 9  &
   location = 180.0, 180.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_4.MARKER_10  &
   adams_id = 10  &
   location = 180.0, 0.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .Fourbar.PART_4.cm  &
   adams_id = 19  &
   location = 180.0, 90.0, 0.0  &
   orientation = 3.1415926536, 1.5707963268, 1.5707963268
!
marker create  &
   marker_name = .Fourbar.PART_4.MARKER_15  &
   adams_id = 15  &
   location = 180.0, 90.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Fourbar.PART_4  &
   material_type = .Fourbar.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Fourbar.PART_4.LINK_3  &
   i_marker = .Fourbar.PART_4.MARKER_9  &
   j_marker = .Fourbar.PART_4.MARKER_10  &
   width = 18.0  &
   depth = 9.0
!
part attributes  &
   part_name = .Fourbar.PART_4  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Fourbar.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Fourbar.PART_2.MARKER_11  &
   j_marker_name = .Fourbar.ground.MARKER_12
!
constraint attributes  &
   constraint_name = .Fourbar.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Fourbar.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Fourbar.PART_2.MARKER_13  &
   j_marker_name = .Fourbar.PART_3.MARKER_14
!
constraint attributes  &
   constraint_name = .Fourbar.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Fourbar.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Fourbar.PART_4.MARKER_15  &
   j_marker_name = .Fourbar.ground.MARKER_16
!
constraint attributes  &
   constraint_name = .Fourbar.JOINT_3  &
   name_visibility = off
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Fourbar.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=10.0 step_size=0.1 model_name=.Fourbar"
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Fourbar.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .Fourbar.JOINT_1  &
   time_derivative = velocity  &
   function = ""
!
constraint attributes  &
   constraint_name = .Fourbar.MOTION_1  &
   name_visibility = off
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Fourbar.MOTION_1  &
   function = "1.0 * time"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
material modify  &
   material_name = .Fourbar.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
geometry modify shape link  &
   link_name = .Fourbar.PART_2.LINK_1  &
   width = (9.2195444573mm)  &
   depth = (4.6097722286mm)
!
geometry modify shape link  &
   link_name = .Fourbar.PART_3.LINK_2  &
   width = (26.0mm)  &
   depth = (13.0mm)
!
geometry modify shape link  &
   link_name = .Fourbar.PART_4.LINK_3  &
   width = (18.0mm)  &
   depth = (9.0mm)
!
model display  &
   model_name = Fourbar
