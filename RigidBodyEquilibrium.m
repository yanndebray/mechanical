classdef RigidBodyEquilibrium
    properties
        forces; % Array of forces [magnitude, angle in degrees]
        fx_components;
        fy_components;
    end
    
    methods
        function obj = RigidBodyEquilibrium(forces)
            % Constructor to initialize forces
            obj.forces = forces;
            [obj.fx_components, obj.fy_components] = obj.calculateComponents();
        end
        
        function [fx_components, fy_components] = calculateComponents(obj)
            % Calculate horizontal (fx) and vertical (fy) components for each force
            fx_components = zeros(size(obj.forces, 1), 1);
            fy_components = zeros(size(obj.forces, 1), 1);
            
            for i = 1:size(obj.forces, 1)
                magnitude = obj.forces(i, 1);
                angle = deg2rad(obj.forces(i, 2)); % Convert angle to radians
                fx_components(i) = magnitude * cos(angle);
                fy_components(i) = magnitude * sin(angle);
            end
            
            disp('Horizontal Components (Fx):');
            disp(fx_components);
            disp('Vertical Components (Fy):');
            disp(fy_components);
        end
        
        function status = checkEquilibrium(obj)
            % Check if the body is in equilibrium by ensuring sum of Fx and Fy is zero
            fx_total = sum(obj.fx_components);
            fy_total = sum(obj.fy_components);
            
            equilibrium_x = abs(fx_total) < 1e-5;
            equilibrium_y = abs(fy_total) < 1e-5;
            
            if equilibrium_x && equilibrium_y
                status = 'The body is in equilibrium.';
            else
                status = 'The body is not in equilibrium.';
            end
            disp(status);
        end
    end
end
