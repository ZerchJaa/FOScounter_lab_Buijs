// Selecciona las carpetas
inputDir = getDirectory("Selecciona la carpeta con las imágenes procesadas...");
outputDir = getDirectory("Selecciona la carpeta con las imágenes originales...");
resultsDir = getDirectory("Selecciona la carpeta donde se guardarán los resultados...");

// Obtiene una lista de todas las imágenes en la carpeta de entrada
list = getFileList(inputDir);

for (i = 0; i < list.length; i++) {
    // Abre las imágenes
    open(inputDir + list[i]);
    processedTitle = getTitle();
    open(outputDir + list[i]);
    originalTitle = getTitle();

    // Procesa la imagen en 8 bits
    selectWindow(processedTitle);
    run("8-bit");

    // Aplica umbralización automática
    setAutoThreshold("Moments no-reset");

    // Configura el fondo en blanco
    setOption("BlackBackground", false);

    // Convierte a imagen binaria
    run("Convert to Mask");

    // Realiza operaciones de procesamiento de imagen
    run("Median...", "radius=3");
    run("Despeckle");
    run("Despeckle");
    run("Watershed");
    run("Watershed");

    // Realiza el análisis de partículas y muestra los resultados
    run("Analyze Particles...", "display summarize add");

    // Elimina los resultados de la imagen procesada
    resetMinAndMax();
    run("Select All");
    run("Clear Results");

    // Obtén la lista de ROIs del ROI Manager
    roiManager("Select All");
    roiManager("Combine");

    // Genera un nuevo ROI que englobe todas las células
    roiManager("Show None");
    roiManager("Show All");

    // Mide las ROIs en la imagen original
    selectWindow(originalTitle);
    roiManager("Select All");
    roiManager("Measure");

    // Guarda los resultados en un archivo CSV
    saveAs("Results", resultsDir + "Results_" + list[i] + ".csv");

    // Cierra las ventanas de imagen
    selectWindow(processedTitle);
    close();
    selectWindow(originalTitle);
    close();

    // Limpia la lista de ROIs para la próxima iteración
    roiManager("Reset");
}
