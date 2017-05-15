#ifndef MEMORY_H
#define MEMORY_H


#include <string>

#include "type.h"


namespace Benchmarking {

    class Memory {
    public:
        void reset();  // record memory usage
        Memory(const ll &num_operations, const size_t sizeof_base);
        std::string report() const;  // bytes per element (on average)
    private:
        ll n;  // number of elements in container
        size_t base;  // size of encapsulated data
        ll initial;
        ll extract_number(const std::string &line) const;
        ll current_usage() const;  // total (= virtual + physical) RAM used by process (in KB)
        ll allocated() const;  // kilobytes allocated since last reset
    };

}

#endif // MEMORY_H
