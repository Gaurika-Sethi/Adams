! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
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
   size_of_icons = 5.0E-02  &
   spacing_for_grid = 1.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Basketball
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Basketball.steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+11  &
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
   default_coordinate_system = .Basketball.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Basketball.ground.MARKER_4  &
   adams_id = 4  &
   location = 0.0, 3.05, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Basketball.ground  &
   material_type = .Basketball.steel
!
part attributes  &
   part_name = .Basketball.ground  &
   name_visibility = off
!
!------------------------------------ ball ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Basketball.ground
!
part create rigid_body name_and_position  &
   part_name = .Basketball.ball  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body initial_velocity  &
   part_name = .Basketball.ball  &
   vx = 7.0560739625  &
   vy = 5.8762615876
!
defaults coordinate_system  &
   default_coordinate_system = .Basketball.ball
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Basketball.ball.MARKER_1  &
   adams_id = 1  &
   location = -7.0, 2.1, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Basketball.ball.cm  &
   adams_id = 7  &
   location = -7.0, 2.1, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Basketball.ball.MARKER_5  &
   adams_id = 5  &
   location = -7.0, 2.1, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Basketball.ball  &
   material_type = .Basketball.steel
!
! ****** Graphics for current part ******
!
geometry create shape ellipsoid  &
   ellipsoid_name = .Basketball.ball.ELLIPSOID_1  &
   adams_id = 6  &
   center_marker = .Basketball.ball.MARKER_1  &
   x_scale_factor = 0.24  &
   y_scale_factor = 0.24  &
   z_scale_factor = 0.24
!
part attributes  &
   part_name = .Basketball.ball  &
   color = RED  &
   name_visibility = off
!
!------------------------------------ hoop ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Basketball.ground
!
part create rigid_body name_and_position  &
   part_name = .Basketball.hoop  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Basketball.hoop
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Basketball.hoop.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 3.05, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Basketball.hoop.cm  &
   adams_id = 8  &
   location = 0.0, 3.05, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Basketball.hoop.MARKER_3  &
   adams_id = 3  &
   location = 0.0, 3.05, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Basketball.hoop.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 3.05, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Basketball.hoop  &
   material_type = .Basketball.steel
!
! ****** Graphics for current part ******
!
geometry create shape torus  &
   adams_id = 2  &
   torus_name = .Basketball.hoop.TORUS_2  &
   center_marker = .Basketball.hoop.MARKER_2  &
   angle_extent = 360.0  &
   major_radius = 0.24  &
   minor_radius = 1.0E-02  &
   side_count_for_perimeter = 20  &
   segment_count = 20
!
part attributes  &
   part_name = .Basketball.hoop  &
   color = GREEN  &
   name_visibility = off
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .Basketball.CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = .Basketball.ball.ELLIPSOID_1  &
   j_geometry_name = .Basketball.hoop.TORUS_2  &
   stiffness = 1.0E+08  &
   damping = 1.0E+04  &
   exponent = 2.2  &
   dmax = 1.0E-04
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint fixed  &
   joint_name = .Basketball.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Basketball.hoop.MARKER_3  &
   j_marker_name = .Basketball.ground.MARKER_4
!
constraint attributes  &
   constraint_name = .Basketball.JOINT_1  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Basketball.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=1.0 number_of_steps=50 model_name=.Basketball"
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Basketball.ground
!
geometry create shape gcontact  &
   contact_force_name = .Basketball.GCONTACT_5  &
   adams_id = 5  &
   contact_element_name = .Basketball.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Basketball.GCONTACT_5  &
   color = RED
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9.80665  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create pt2pt  &
   measure_name = .Basketball.MEA_PT2PT_1  &
   from_point = .Basketball.ball.MARKER_5  &
   to_point = .Basketball.hoop.MARKER_6  &
   characteristic = translational_displacement  &
   component = mag_component
!
data_element attributes  &
   data_element_name = .Basketball.MEA_PT2PT_1  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Basketball.x_vel  &
   units = "velocity"  &
   range = 5.0, 10.0  &
   use_allowed_values = no  &
   real_value = 7.0560739625
!
variable create  &
   variable_name = .Basketball.y_vel  &
   units = "velocity"  &
   range = 5.0, 10.0  &
   use_allowed_values = no  &
   real_value = 5.8762615876
!
!---------------------------- Function definitions ----------------------------!
!
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape ellipsoid  &
   ellipsoid_name = .Basketball.ball.ELLIPSOID_1  &
   x_scale_factor = (2 * 12.0cm)  &
   y_scale_factor = (2 * 12.0cm)  &
   z_scale_factor = (2 * 12.0cm)
!
part modify rigid_body initial_velocity  &
   part_name = .Basketball.ball  &
   vx = (.Basketball.x_vel)  &
   vy = (.Basketball.y_vel)
!
geometry modify shape torus  &
   torus_name = .Basketball.hoop.TORUS_2  &
   major_radius = (24cm)  &
   minor_radius = (1cm)
!
material modify  &
   material_name = .Basketball.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Basketball
