classdef SightTapeGen
    % Generate sight tape
    
    properties
        DistancePoints
        SightTapePoints
        ConfidencePoints
        PrintDPI
        TapeName
    end
    
    properties (Access = private)
        
    end
    
    methods
        function obj = SightTapeGen(DistancePoints, SightTapePoints, varargin)
            switch nargin
                case 2
                    if ~iscolumn(DistancePoints) || ~iscolumn(SightTapePoints)
                        error('Data points must be column vectors!')
                    end
                    
                    if ~isnumeric(DistancePoints) || ~isnumeric(SightTapePoints)
                        error('Data points must be numeric values!')
                    end
                    
                    if length(DistancePoints) ~= length(SightTapePoints)
                        error('Data points must have the same length!')
                    end
                    
                    obj.DistancePoints = DistancePoints;
                    obj.SightTapePoints = SightTapePoints;
                    obj.ConfidencePoints = ones(1,length(DistancePoints));
                    
                case 3
                    ConfidencePoints = varargin;
                    
                    if ~iscolumn(DistancePoints) || ~iscolumn(SightTapePoints) || ~iscolumn(ConfidencePoints)
                        error('Data points must be column vectors!')
                    end
                    
                    if ~isnumeric(DistancePoints) || ~isnumeric(SightTapePoints) || ~isnumeric(ConfidencePoints)
                        error('Data points must be numeric values!')
                    end
                    
                    if length(DistancePoints) ~= length(SightTapePoints) && length(DistancePoints) ~= length(ConfidencePoints)
                        error('Data points must have the same length!')
                    end
                    
                    obj.DistancePoints = DistancePoints;
                    obj.SightTapePoints = SightTapePoints;
                    obj.ConfidencePoints = ConfidencePoints;
                    
                otherwise
                    error('Incorrect number of input parameters!')
            end
            
            obj.PrintDPI = 300;
        end
        
        function obj = set.DistancePoints(obj, newDistancePoints)
            if ~iscolumn(newDistancePoints)
                error('Data points must be column vectors!')
            end
            
            if ~isnumeric(newDistancePoints)
                error('Data points must be numeric values!')
            end
            
            obj.DistancePoints = newDistancePoints;
        end
        
        function obj = set.SightTapePoints(obj, newSightTapePoints)
            if ~iscolumn(newSightTapePoints)
                error('Data points must be column vectors!')
            end
            
            if ~isnumeric(newSightTapePoints)
                error('Data points must be numeric values!')
            end
            
            obj.SightTapePoints = newSightTapePoints;
        end
        
        function obj = set.ConfidencePoints(obj, newConfidencePoints)
            if ~iscolumn(newConfidencePoints)
                error('Data points must be column vectors!')
            end
            
            if ~isnumeric(newConfidencePoints)
                error('Data points must be numeric values!')
            end
            
            obj.ConfidencePoints = newConfidencePoints;
        end        
        
        function obj = set.PrintDPI(obj, newPrintDPI)
            if numel(newPrintDPI) ~= 1
                error('Data points must be an integer!')
            end
                   
            
            if ~isinteger(newPrintDPI)
                error('Data points must be an integer!')
            end
            
            obj.PrintDPI = newPrintDPI;
        end       
        
        function obj = set.TapeName(obj, newTapeName)
            if ~ischar(newTapeName)
                error('Data points must be a character string!')
            end
                   
            obj.TapeName = newTapeName;
        end               
        
        GenerateTestTape(obj)
        
        GenerateSightTape(obj)
        
        SaveTape(obj)
    end
end

