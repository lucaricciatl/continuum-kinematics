function dataout = trimesh_transofrm(data,T)
%% change position and orientation of a mesh
    %input --> triangulation structure
    %output --> triangulation structure
    
    %triangulation structure :  
    %>> triangulation(Points,ConnectivityList)
    
    %from mesh :
    %>>data = stlread('file.stl')
    %>>data = 
    % 
    %   triangulation with properties:
    % 
    %               Points: [n×3 double]
    %     ConnectivityList: [nc×3 double]
    
    %Points : points of the mesh
    %ConnectivityList : connection between points 
    
    n = length(data.Points) ;
    
    dataPoints = zeros(n,3);
    for i = 1:n
         point = T(1:4,1:4) * [data.Points(i,1:3) , 1 ]' ;
         dataPoints(i,1:3) = point(1:3) ;
    end

    dataout = triangulation(data.ConnectivityList,dataPoints) ;
    
end

