#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Adjusted payload structure 7712
// Adjusted payload structure 2404
// Adjusted payload structure 5724
// Adjusted payload structure 6979
// Adjusted payload structure 7785
// Adjusted payload structure 1321
// Adjusted payload structure 8068
// Adjusted payload structure 4682
// Adjusted payload structure 3132
// Adjusted payload structure 6002
// Adjusted payload structure 9080
// Adjusted payload structure 5022
// Adjusted payload structure 4522
// Adjusted payload structure 5055
// Adjusted payload structure 7923
// Adjusted payload structure 9815
// Adjusted payload structure 6175
// Adjusted payload structure 3161
// Adjusted payload structure 1423
// Adjusted payload structure 1363
// Adjusted payload structure 2720
// Adjusted payload structure 2145
// Adjusted payload structure 1779
// Adjusted payload structure 2334