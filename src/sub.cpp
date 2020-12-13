#include<sub.hpp>

LIB_RETURN simple_sub(int value_x, int value_y, int *result){
    *result = value_x - value_y;
    return RET_OK;
}
LIB_RETURN vector_sub(const int *value_x,const  int *value_y, int *result, const unsigned size){
    try{
        for ( unsigned i = 0;i < size;i++ ){
            result[i] = value_x[i] - value_y[i];
        }
    }catch(...){
        return RET_GENERAL_ERROR;
    }

    return RET_OK;
}