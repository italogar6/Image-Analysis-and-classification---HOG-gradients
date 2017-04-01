%

function histogramas = calcula_histogramas(magnitud,orientacion)
    %IN:
    %   -magnitud: matrix 128x64 with gradient of each pixel
    %   -orientacion: matrix 128x64 with gradient direction
    %OUT:
    %   -histogramas: matrix  [nVerticalCells x nHorizontalCells x
    %   Intervals] --> cell size 8x8, number of intervals --> 9. Then,
    %   matrix 8x8x9
    
    imSize = size(magnitud);
    intervals = zeros(imSize(1),imSize(2),2);
    imSize(1) = imSize(1) - 1;
    imSize(2) = imSize(2) - 1;
    
    %transform direction to invervals
    for i = 2:imSize(1)
        for j = 2:imSize(2)
            if orientacion(i,j) > 0
                angle = orientacion(i,j);
            else
                angle = abs(orientacion(i,j));
                magnitud(i,j) = -magnitud(i,j);
            end
            mainInterval = angle/20;
            mainIntervalCenter = fix(mainInterval) * 20 + 10;
            intervals(i,j,1) =(1- abs(angle - mainIntervalCenter / 20)) + fix(mainInterval);
            percent = mainInterval - fix(mainInterval);
            if (percent > 0.5)
                neighborInterval = mod(fix(mainInterval) + 1,9);
            else
                neighborInterval = mod(fix(mainInterval) - 1,9);
            end
            intervals(i,j,2) = 1 - intervals(i,j,1) + neighborInterval;
        end
    end
    
    %Create Histogram
    histogramas = zeros(8,8,9);
    for i = 2:imSize(1)
        for j = 2:imSize(2)
            %see pixel intervals weights and add into his group
        end
    end
    
    
end