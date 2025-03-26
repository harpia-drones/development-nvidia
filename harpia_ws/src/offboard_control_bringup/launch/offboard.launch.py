from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_path

def generate_launch_description():

    """ This function starts the system in a custom configuration """

    # Generate the object that must be returned by this function
    ld = LaunchDescription()

    project_name='offboard_control'

    ##################################################
    #  Mount the path to the files that will be used      
    ##################################################

    
    # rviz_config_path = os.path.join(
    #     get_package_share_path(f'{project_name}_bringup'),
    #     'config',
    #     'visualizer.rviz'
    # )

    # # print(rviz_config_path)

    ##################################################
    #                 Mount the nodes                
    ##################################################

    # offboard_control_node = Node(
    #     package="offboard_control",
    #     executable="offboard_control_by_position",
    # )

    offboard_control_node = Node(
        package="offboard_control",
        executable="feira_carreiras",
    )

    # visualizer_node = Node(
    #     package='offboard_control',
    #     executable='visualizer',
    # )

    # rviz2_node = Node(
    #     package="rviz2",
    #     executable="rviz2",
    #     arguments=['-d', rviz_config_path]
    # )

    ##################################################
    #   Add the action to LaunchDescription object 
    ##################################################

    ld.add_action(offboard_control_node)
    # ld.add_action(visualizer_node)
    # ld.add_action(rviz2_node)

    return ld