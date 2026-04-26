! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
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
   model_name = pendulum
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .pendulum.steel  &
   adams_id = 1  &
   density = 7.8E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.3
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
   default_coordinate_system = .pendulum.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .pendulum.ground.pivot  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .pendulum.ground.MARKER_8  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .pendulum.ground  &
   material_type = .pendulum.steel
!
!------------------------------------ link ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .pendulum.ground
!
part create rigid_body name_and_position  &
   part_name = .pendulum.link  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .pendulum.link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .pendulum.link.top  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .pendulum.link.bottom  &
   adams_id = 3  &
   location = 450.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .pendulum.link.MARKER_7  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .pendulum.link.geom  &
   i_marker = .pendulum.link.top  &
   j_marker = .pendulum.link.bottom  &
   width = 20.0  &
   depth = 10.0
!
!------------------------------------ bob -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .pendulum.ground
!
part create rigid_body name_and_position  &
   part_name = .pendulum.bob  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .pendulum.bob
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .pendulum.bob.center  &
   adams_id = 4  &
   location = 450.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .pendulum.bob.edge  &
   adams_id = 5  &
   location = 480.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .pendulum.bob.cm  &
   adams_id = 6  &
   location = 465.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .pendulum.bob  &
   material_type = .pendulum.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .pendulum.bob.geom  &
   i_marker = .pendulum.bob.center  &
   j_marker = .pendulum.bob.edge  &
   width = 50.0  &
   depth = 50.0
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .pendulum.pivot  &
   adams_id = 1  &
   i_marker_name = .pendulum.link.top  &
   j_marker_name = .pendulum.ground.pivot
!
constraint create joint fixed  &
   joint_name = .pendulum.fix  &
   adams_id = 2  &
   i_marker_name = .pendulum.link.bottom  &
   j_marker_name = .pendulum.bob.center
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .pendulum.sim  &
   commands = "simulation single_run transient end_time=5 step_size=0.01"
!
simulation script create  &
   sim_script_name = .pendulum.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=50.0 number_of_steps=5000 model_name=.pendulum"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .pendulum.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .pendulum.TORSION_SPRING_1  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.i_marker  &
   object_value = (.pendulum.link.MARKER_7)
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.j_marker  &
   object_value = (.pendulum.ground.MARKER_8)
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.damping_coefficient  &
   real_value = 0.1
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .pendulum.TORSION_SPRING_1.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .pendulum.TORSION_SPRING_1
!
undo end_block
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9810.0  &
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
   instance_name = .pendulum.TORSION_SPRING_1
!
model display  &
   model_name = pendulum
