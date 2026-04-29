
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
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
   model_name = Spring_Damper
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Spring_Damper.steel  &
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
   default_coordinate_system = .Spring_Damper.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Spring_Damper.ground.MARKER_3  &
   adams_id = 3  &
   location = 0.0, 350.0, 50.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Spring_Damper.ground  &
   material_type = .Spring_Damper.steel
!
part attributes  &
   part_name = .Spring_Damper.ground  &
   name_visibility = off
!
!----------------------------------- PART_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Spring_Damper.ground
!
part create rigid_body name_and_position  &
   part_name = .Spring_Damper.PART_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Spring_Damper.PART_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Spring_Damper.PART_2.MARKER_1  &
   adams_id = 1  &
   location = -50.0, -100.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Spring_Damper.PART_2.cm  &
   adams_id = 4  &
   location = 0.0, -50.0, 50.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Spring_Damper.PART_2.MARKER_2  &
   adams_id = 2  &
   location = 0.0, -50.0, 50.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Spring_Damper.PART_2  &
   mass = 187.224  &
   center_of_mass_marker = .Spring_Damper.PART_2.cm  &
   ixx = 1.3001666667E+04  &
   iyy = 1.3001666667E+04  &
   izz = 1.3001666667E+04  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .Spring_Damper.PART_2.BOX_1  &
   adams_id = 1  &
   corner_marker = .Spring_Damper.PART_2.MARKER_1  &
   diag_corner_coords = 100.0, 100.0, 100.0
!
part attributes  &
   part_name = .Spring_Damper.PART_2  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Spring_Damper.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=100.0 number_of_steps=1000 model_name=.Spring_Damper"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Spring_Damper.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .Spring_Damper.SPRING_1  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .Spring_Damper.SPRING_1  &
   color = BLUE
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.i_marker  &
   object_value = (.Spring_Damper.PART_2.MARKER_2)
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.j_marker  &
   object_value = (.Spring_Damper.ground.MARKER_3)
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.stiffness_coefficient  &
   real_value = 5.0
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.damping_coefficient  &
   real_value = 5.0E-02
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.free_length_mode  &
   string_value = "Design_Length"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.i_dynamic_visibility  &
   string_value = "On"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.spring_visibility  &
   string_value = "depends"
!
variable modify  &
   variable_name = .Spring_Damper.SPRING_1.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .Spring_Damper.SPRING_1
!
undo end_block
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Function definitions ----------------------------!
!
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Spring_Damper.SPRING_1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
material modify  &
   material_name = .Spring_Damper.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Spring_Damper
