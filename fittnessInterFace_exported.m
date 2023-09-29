classdef fittnessInterFace_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        UIAxes4   matlab.ui.control.UIAxes
        UIAxes3   matlab.ui.control.UIAxes
        UIAxes2   matlab.ui.control.UIAxes
        UIAxes    matlab.ui.control.UIAxes
    end

    
    methods (Access = private)
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
        days = [];
            for value = 1:7:length(data)
                days(end + 1) = 'mon';
                days(end + 1) = 'tue';
                days(end + 1) = 'web';
                days(end + 1) = 'thu';
                days(end + 1) = 'fri';
                
                days(end + 1) = 'sat';
                days(end + 1) = 'sun';
            end
            
            y = 8000;
            bar(app.UIAxes,x,y)
        end

        % Button down function: UIAxes2
        function UIAxes2ButtonDown(app, event)
            x= 2
            y = 0.6;
            bar(app.UIAxes2,x ,y)
        end

        % Button down function: UIAxes3
        function UIAxes3ButtonDown(app, event)
            x = 9
            y = 9;
            bar(app.UIAxes3, x, y)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Steps each day')
            xlabel(app.UIAxes, 'Days')
            ylabel(app.UIAxes, 'Steps')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XTick = [0 0.2 0.4 0.6 0.8 1];
            app.UIAxes.Position = [316 268 300 185];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Step distance')
            xlabel(app.UIAxes2, 'Days')
            ylabel(app.UIAxes2, 'Average distance')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.ButtonDownFcn = createCallbackFcn(app, @UIAxes2ButtonDown, true);
            app.UIAxes2.Position = [1 268 300 185];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.UIFigure);
            title(app.UIAxes3, 'Calories burnt')
            xlabel(app.UIAxes3, 'Days')
            ylabel(app.UIAxes3, 'Calories')
            zlabel(app.UIAxes3, 'Z')
            app.UIAxes3.ButtonDownFcn = createCallbackFcn(app, @UIAxes3ButtonDown, true);
            app.UIAxes3.Position = [17 48 300 185];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.UIFigure);
            title(app.UIAxes4, 'Time spent')
            xlabel(app.UIAxes4, 'X')
            ylabel(app.UIAxes4, 'Y')
            zlabel(app.UIAxes4, 'Z')
            app.UIAxes4.Position = [316 48 300 185];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = fittnessInterFace_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end