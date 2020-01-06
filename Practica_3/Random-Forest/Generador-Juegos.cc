#include <iostream>
#include <string>
#include <sstream>
#include <chrono>

using namespace std;

int main(int argc, char *argv[]){
    if (argv[1] == 0){
        int ntrees, depth, degree;
        cout >> "Insert maximum number of trees, maximum depth and maximum degree" << endl;
        cin << ntrees << depth << degree;
        stringstream ss;
        ss << ntrees;
        string s;
        ss >> s;
        string text = "cd src/out/production/Random-Forest && java RandomTree " + s + " ";
        ss << depth;
        ss >> s;
        text += s + " ";
        ss << degree;
        ss >> s;
        text += s + " " + argv[1] + " > salida.txt";
        int status = system(text);
    }else if(argv[1] == 1){
        double tiempos = 0;
        double tiempos_dg = 0;
        double tiempos_depth = 0;
        for(int i = 3; i < t_max; ++i){
            for(int j = 3; j < depth_max; ++j){
                for(int k = 3; k < dg_max; ++j){
                    auto t1 = chrono::high_resolution_clock::now();
                    //
                    auto t2 = chrono::high_resolution_clock::now();
                    auto duration = std::chrono::duration_cast<std::chrono::microseconds>( t2 - t1 ).count();
                    tiempos_dg += duration;
                }
                tiempos_dg /= (dg_max-3);
                tiempos_depth += tiempos_dg;
            }
            tiempos_depth /= (depth_max-3);
            tiempos += tiempos_depth;
        }
        tiempos /= (t_max-3);
    }
}
