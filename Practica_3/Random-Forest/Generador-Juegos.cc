#include <iostream>
#include <string>
#include <sstream>
#include <chrono>
#include <string>

using namespace std;

int t_max = 7;
int depth_max= 7;
int dg_max = 7;

string generate(int ntrees, int depth, int degree){
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
    text += s + " " + argv[1] + " > salida.pddl";
}

int main(int argc, char *argv[]){
    if (argv[1] == 0){
        int ntrees, depth, degree;
        cout >> "Insert maximum number of trees, maximum depth and maximum degree" << endl;
        cin << ntrees << depth << degree;
        int status = system(generate(ntrees, depth,degree));
    }else if(argv[1] == 1){
        double tiempos = 0;
        double tiempos_dg = 0;
        double tiempos_depth = 0;
        for(int i = 3; i < t_max; i+=2){
            for(int j = 3; j < depth_max; j+=2){
                for(int k = 3; k < dg_max; k+=2){
                    for(int l = 0; l < 10; ++l){
                        int status = system(generate(i, j, k));
                        auto t1 = chrono::high_resolution_clock::now();
                        int status = system("ff -o extension2Domain.pddl -f salida.pddl");
                        auto t2 = chrono::high_resolution_clock::now();
                        auto duration = std::chrono::duration_cast<std::chrono::microseconds>( t2 - t1 ).count();
                        tiempos_dg += duration;
                    }
                    cout << "Media de tiempo (ms) para número de árboles, profundidad y grado máximos " << i << " " << j << " " << k << ": " << tiempos_dg/10 << endl;
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
